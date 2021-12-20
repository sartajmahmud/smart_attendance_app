import 'package:mvc_pattern/mvc_pattern.dart';
import '../Models/AssignedSeller.dart';
import '../Repositories/SellerRepository.dart';
import '../Models/Seller.dart';

class SellerController extends ControllerMVC{

  Seller seller = new Seller();

  SellerController(){
   getAssignedSeller();
  }

  List assignedSeller = [];
  void getAssignedSeller() async {
    final Stream<AssignedSeller> stream = await getAssignedSellers();
    stream.listen((AssignedSeller _slide) {
      print('AssignedSeller'+_slide.seller.name);
      setState(() => assignedSeller.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
}