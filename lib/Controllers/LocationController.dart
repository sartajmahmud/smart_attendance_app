import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Models/Location.dart';
import '../Repositories/LocationRepository.dart' as repository;

class LocationController extends ControllerMVC {
  OfficeLocation location;

  void getLoc() async {
    location = await repository.getLocation();
  }
}
