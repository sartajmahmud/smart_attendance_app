import 'dart:isolate';
import 'package:location_permissions/location_permissions.dart';
import 'package:background_locator/background_locator.dart';
import 'package:background_locator/settings/android_settings.dart';
import 'package:background_locator/settings/ios_settings.dart';
import 'package:background_locator/settings/locator_settings.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../BackgroundGPS/file_manager.dart';
import '../BackgroundGPS/location_callback_handler.dart';
import '../BackgroundGPS/location_service_repository.dart';
import 'package:background_locator/location_dto.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Controllers/HomeScreenController.dart';
import 'package:smart_attendance/Models/UserProfile.dart';
import 'package:smart_attendance/Repositories/UserRepository.dart';
import 'package:smart_attendance/Views/login_screen.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  UserProfile up;
  HomeScreen(this.up);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  HomeScreenController _con;

  int status = 1;

  ReceivePort port = ReceivePort();

  String logStr = '';
  bool isRunning;
  LocationDto lastLocation;
  DateTime lastTimeLocation;

  _HomeScreenState() : super(HomeScreenController()) {
    _con = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await this.initialFunc();
      setState(() {});
    });

    super.initState();
    FileManager.writeUser();
    if (IsolateNameServer.lookupPortByName(
            LocationServiceRepository.isolateName) !=
        null) {
      IsolateNameServer.removePortNameMapping(
          LocationServiceRepository.isolateName);
    }

    IsolateNameServer.registerPortWithName(
        port.sendPort, LocationServiceRepository.isolateName);

    port.listen(
      (dynamic data) async {
        await updateUI(data);
      },
    );
    initPlatformState();
    // _onStart();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> updateUI(LocationDto data) async {
    // final log = await FileManager.readLogFile();

    await _updateNotificationText(data);

    setState(() {
      if (data != null) {
        lastLocation = data;
        lastTimeLocation = DateTime.now();
      }
      //  logStr = log;
    });
  }

  Future<void> _updateNotificationText(LocationDto data) async {
    if (data == null) {
      return;
    }

    await BackgroundLocator.updateNotificationText(
        title: "new location received",
        msg: "${DateTime.now()}",
        bigMsg: "${data.latitude}, ${data.longitude}");
  }

  Future<void> initPlatformState() async {
    print('Initializing...');
    await BackgroundLocator.initialize();
    // logStr = await FileManager.readLogFile();
    print('Initialization done');
    final _isRunning = await BackgroundLocator.isServiceRunning();
    setState(() {
      isRunning = _isRunning;
    });
    print('Running ${isRunning.toString()}');
  }

  void onStop() async {
    BackgroundLocator.unRegisterLocationUpdate();
    final _isRunning = await BackgroundLocator.isServiceRunning();

    setState(() {
      isRunning = _isRunning;
    });
  }

  void _onStart() async {
    if (await _checkLocationPermission()) {
      _startLocator();
      final _isRunning = await BackgroundLocator.isServiceRunning();

      setState(() {
        isRunning = _isRunning;
        lastTimeLocation = null;
        lastLocation = null;
      });
    } else {
      // show error
    }
  }

  Future<bool> _checkLocationPermission() async {
    final access = await LocationPermissions().checkPermissionStatus();
    switch (access) {
      case PermissionStatus.unknown:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
        final permission = await LocationPermissions().requestPermissions(
          permissionLevel: LocationPermissionLevel.locationAlways,
        );
        if (permission == PermissionStatus.granted) {
          return true;
        } else {
          return false;
        }
        break;
      case PermissionStatus.granted:
        return true;
        break;
      default:
        return false;
        break;
    }
  }

  void _startLocator() {
    Map<String, dynamic> data = {'countInit': 1};
    BackgroundLocator.registerLocationUpdate(LocationCallbackHandler.callback,
        initCallback: LocationCallbackHandler.initCallback,
        initDataCallback: data,
/*
        Comment initDataCallback, so service not set init variable,
        variable stay with value of last run after unRegisterLocationUpdate
*/
        disposeCallback: LocationCallbackHandler.disposeCallback,
        iosSettings: IOSSettings(
            accuracy: LocationAccuracy.NAVIGATION, distanceFilter: 0),
        autoStop: false,
        androidSettings: AndroidSettings(
            accuracy: LocationAccuracy.NAVIGATION,
            interval: 5,
            distanceFilter: 0,
            client: LocationClient.google,
            androidNotificationSettings: AndroidNotificationSettings(
                notificationChannelName: 'Location tracking',
                notificationTitle: 'Start Location Tracking',
                notificationMsg: 'Track location in background',
                notificationBigMsg:
                    'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
                notificationIcon: '',
                notificationIconColor: Colors.grey,
                notificationTapCallback:
                    LocationCallbackHandler.notificationCallback)));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  initialFunc() async {
    _con.up = widget.up;
    await _con.getOfficeLocation();
    await _con.getOfficeNetwork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: IconButton(
            icon: Icon(
              Icons.refresh,
              size: 30,
              color: Colors.green,
            ),
            onPressed: () async {
              await _con.getUserData();
              await _con.getOfficeLocation(id: _con.up.location_id);
              await _con.getOfficeNetwork(id: _con.up.network_id);
              setState(() {});
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onPressed: () {
                logout().then((value) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                });
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width * .9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${_con.up.name}",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Your Attendance Type',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          _con.up.attendance_type == 2
                              ? Text(
                                  'Network Based',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  'Location Based',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                        ],
                      )),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Todays Entry Time',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              _con.up.entry_time != null
                                  ? Text(
                                      '${_con.up.entry_time}',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text("Attendance not counted yet")
                            ],
                          ),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Center(
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           color: Colors.green,
                        //           borderRadius: BorderRadius.circular(60)),
                        //       child: FlatButton(
                        //         onPressed: () async {
                        //           //print(_con.location.radius);
                        //           print(_con.network.ssid);
                        //           await _con.Entry(
                        //               _con.up.attendance_type,
                        //               _con.location,
                        //               _con.network,
                        //               _scaffoldKey);
                        //           await _con.getUserData();
                        //           setState(() {});
                        //         },
                        //         child: Text("Entry"),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Todays Exit Time',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              _con.up.exit_time != null
                                  ? Text(
                                      '${_con.up.exit_time}',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text("You have not exited yet")
                            ],
                          ),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Center(
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           color: Colors.red,
                        //           borderRadius: BorderRadius.circular(60)),
                        //       child: FlatButton(
                        //         onPressed: () async {
                        //           if(_con.up.entry_time == null){
                        //             _scaffoldKey?.currentState?.showSnackBar(SnackBar(
                        //                 content: Text("You have no entry attendance yet")));
                        //           }else{
                        //             await _con.Exit(
                        //                 _con.up.attendance_type, _scaffoldKey);
                        //             await _con.getUserData();
                        //             setState(() {});
                        //           }
                        //
                        //         },
                        //         child: Text("Exit"),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Text(
                    'Background Process Status',
                    style: TextStyle(fontSize: 18),
                  ),
                  ListTile(
                    title: ToggleSwitch(
                      minWidth: (MediaQuery.of(context).size.width * .75) / 2,
                      initialLabelIndex: status,
                      cornerRadius: 20.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      labels: ['Inactive', 'Active'],
                      icons: [Icons.close, Icons.check],
                      activeBgColors: [Colors.red, Colors.green],
                      onToggle: (index) {
                        print('switched to: $index');
                        if (index == 0) {
                          onStop();
                          // timer.cancel();
                          // isStopped=true;
                          _con.up.status = "0";
                          _con.updateStatus();
                          status = int.parse(_con.up.status);
                        } else {
                          _onStart();
                          _con.up.status = "1";
                          // _con.updateStatus();
                          status = int.parse(_con.up.status);

                          setState(() {
                            _con.Entry(_con.up.attendance_type, _con.location,
                                _con.network, _scaffoldKey);
                            _con.getUserData();
                          });
                          // timer = Timer.periodic(Duration(seconds: 5), (timer) {
                          //   _con.updateRiderlocation();
                          // });
                        }
                      },
                    ),
                  ),
                  // Expanded(
                  //   flex: 2,
                  //   child: FlatButton(
                  //     onPressed: () async {
                  //       await _con.getUserData();
                  //       await _con.getOfficeLocation(id: _con.up.location_id);
                  //       await _con.getOfficeNetwork(id: _con.up.network_id);
                  //       setState(() {});
                  //     },
                  //     child: Text("Refresh"),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
