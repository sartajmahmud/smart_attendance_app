import 'package:mvc_pattern/mvc_pattern.dart';
import '../Repositories/OrderRepository.dart';
import '../Models/SalesOrder.dart';

class OrderController extends ControllerMVC{
  OrderController(){

  }

  List<SalesOrder> salesOrders = [];
  void getSalesOrder() async {
    final Stream<SalesOrder> stream = await getSalesOrders();
    stream.listen((SalesOrder _slide) {
      print('AssignedSeller '+_slide.id.toString());
      setState(() => salesOrders.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
}