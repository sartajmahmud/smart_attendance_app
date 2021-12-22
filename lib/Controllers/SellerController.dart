import 'package:mvc_pattern/mvc_pattern.dart';
import '../Models/AssignedSeller.dart';
import '../Repositories/SellerRepository.dart';

class SellerController extends ControllerMVC{

  SellerController(){
   getAssignedSeller();
  }

  List<AssignedSeller>assignedSeller = [];

  void getAssignedSeller() async {
    final Stream<AssignedSeller> stream = await getAssignedSellers();
    stream.listen((AssignedSeller _slide) {
      print('AssignedSeller '+_slide.seller.inventory.product.name);
      setState(() => assignedSeller.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
}