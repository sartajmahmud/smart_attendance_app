import 'Category.dart';
import 'Media.dart';

class Product {
  String id;
  String category_id;
  String deliverable;
  String name;
  double price;
  double discounted_Price;
  double delivery_fee;
  String media_id;
  String description;
  Category category;
  Media media;

  Product();

  Product.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      category_id = jsonMap['category_id'].toString();
      deliverable = jsonMap['deliverable'].toString();
      name = jsonMap['name'];
      price = jsonMap['price'] != null ? jsonMap['price'].toDouble() : 0.0;
      discounted_Price = jsonMap['discounted_Price'] != null
          ? jsonMap['discounted_Price'].toDouble()
          : 0.0;
      delivery_fee = jsonMap['delivery_fee'] != null ? double.parse(
          jsonMap['delivery_fee'].toString()) : -1;
      media_id = jsonMap['media_id'].toString();
      description = jsonMap['description'];
      media = jsonMap['media'] != null ? Media.fromJSON(jsonMap['media']) : Media.fromJSON({});

      category = jsonMap['category'] != null
          ? Category.fromJSON(jsonMap['category'])
          : Category.fromJSON({});

    } catch (e) {
      id = '';
      name = '';
      price = 0.0;
      discounted_Price = 0.0;
      description = '';
      delivery_fee = -1;
      deliverable = '1';
      category = Category.fromJSON({});
      media = new Media();
    }
  }

  @override
  bool operator ==(dynamic other) {
    return other.id == this.id;
  }

  @override
  int get hashCode => this.id.hashCode;
}