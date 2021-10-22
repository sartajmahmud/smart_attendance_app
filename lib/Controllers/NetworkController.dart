import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Models/Network.dart';
import '../Repositories/NetworkRepository.dart' as repository;

class NetworkController extends ControllerMVC {
  Network network;

  void getNW() async {
    network = await repository.getNetwork();
  }
}
