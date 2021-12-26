import 'package:mvc_pattern/mvc_pattern.dart';
import '../Repositories/VisitRepository.dart';
import '../Models/SalesVisit.dart';

class VisitController extends ControllerMVC{

  VisitController(){
    getSalesVisit();
  }

  List<SalesVisit> salesVisits = [];

  void getSalesVisit() async {
    print('controler func');
    final Stream<SalesVisit> stream = await getSalesVisits();
    stream.listen((SalesVisit _slide) {
      print('salesVisits '+_slide.contact_person);
      setState(() => salesVisits.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
}