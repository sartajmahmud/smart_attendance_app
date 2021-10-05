import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Models/Network.dart';
import '../Repositories/NetworkRepository.dart' as repository;

class NetworkController extends ControllerMVC{
  Network network ;

  void getNW() async{
    network = await repository.getNetwork();
    // repository.getLocation().then((value) async{
    //   if (value != null) {
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    //   }
    // }).catchError((e) async{

    // scaffoldKey?.currentState?.showSnackBar(SnackBar(
    //   content: Text("Wrong mobile number or password"),
    // ));
  }




}