import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Controllers/HomeScreenController.dart';
import 'package:smart_attendance/Models/UserProfile.dart';
import 'package:smart_attendance/Repositories/UserRepository.dart';
import 'package:smart_attendance/Views/login_screen.dart';

class HomeScreen extends StatefulWidget {
  UserProfile up;
  HomeScreen(this.up);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  HomeScreenController _con;
  _HomeScreenState() : super(HomeScreenController()) {
    _con = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await this.initialFunc();
      setState(() { });
    });

    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }

  initialFunc() async {
    _con.up= widget.up;
    // await _con.getUserData();
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
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.list_alt,
        //     color: Colors.blue,
        //   ),
        //   onPressed: () {},
        // ),
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
                              SizedBox(height: 10,),
                              _con.up.entry_time != null ? Text('${_con.up.entry_time}',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),) :Text ("Attendance not counted yet")
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(60)),
                              child: FlatButton(
                                onPressed: () async {
                                  //print(_con.location.radius);
                                  print(_con.network.ssid);
                                  await _con.Entry(_con.up.attendance_type,
                                      _con.location, _con.network, _scaffoldKey);
                                  await _con.getUserData();
                                  setState(() {});
                                },
                                child: Text("Entry"),
                              ),
                            ),
                          ),
                        ),
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
                              SizedBox(height: 10,),
                              _con.up.exit_time != null ?
                              Text('${_con.up.exit_time}',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),) :Text("You have not exited yet")
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(60)),
                              child: FlatButton(
                                onPressed: () async {
                                  await _con.Exit(_con.up.attendance_type, _scaffoldKey);
                                  await _con.getUserData();
                                  setState(() {});
                                },
                                child: Text("Exit"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      onPressed: () async {
                        await _con.getUserData();
                        await _con.getOfficeLocation(id:_con.up.location_id);
                        await _con.getOfficeNetwork(id:_con.up.network_id);
                        setState(() {


                        });
                      },
                      child: Text("Refresh"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
