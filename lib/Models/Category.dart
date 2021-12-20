
import 'Media.dart';

class Category {
  String id;
  String name;
  String media_id;
  Media media;

  Category();

  Category.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      name = jsonMap['name'];
      media_id = jsonMap['media_id'].toString();
      media = jsonMap['media'] != null ? Media.fromJSON(jsonMap['media']) : Media.fromJSON({});
    } catch (e) {
      id = '';
      name = '';
      media = new Media();
      //print(CustomTrace(StackTrace.current, message: e));
    }
  }
  Map toMap(){
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"]=name;
    return map;
  }
}