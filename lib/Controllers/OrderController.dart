import 'package:mvc_pattern/mvc_pattern.dart';
import '../Repositories/OrderRepository.dart';
import '../Models/SalesOrder.dart';

class OrderController extends ControllerMVC{

  OrderController(){
    getSalesOrder();
  }

  List<SalesOrder> salesOrders = [];

  void getSalesOrder() async {
    print('controler func');
    final Stream<SalesOrder> stream = await getSalesOrders();
    stream.listen((SalesOrder _slide) {
      print('salesorder '+_slide.salesOrderItems[0].quantity.toString());
      setState(() => salesOrders.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
}