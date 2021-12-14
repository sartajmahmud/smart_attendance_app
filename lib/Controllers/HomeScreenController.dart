import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Models/UserProfile.dart';
import '../Repositories/UserRepository.dart';

class HomeScreenController extends ControllerMVC {
  HomeScreenController();
  String RiderStatus;

  UserProfile up;
  Future<void> getUserData() async {
    up = await getUserProfile();
  }

  Future<void> updateStatus()async{
    //final response=await entryAttendance();
    setState((){
      this.RiderStatus='';
    });
  }


  Future<LocationData> getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {}
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {}
    }

    return _locationData = await location.getLocation();
  }

}
