class SalesOrderItem{
  int id;
  int sales_order_id;
  int product_id;
  int quantity;

  SalesOrderItem.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      sales_order_id = jsonMap['sales_order_id'];
      product_id = jsonMap['product_id'];
      quantity = jsonMap['quantity'];
    } catch (e) {
      id = 0;
      sales_order_id = 0;
      product_id = 0;
      quantity = 0;
    }
  }

  @override
  bool operator ==(dynamic other) {
    return other.id == this.id;
  }

  @override
  int get hashCode => this.id.hashCode;
}