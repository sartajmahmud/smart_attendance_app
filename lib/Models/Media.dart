import '../helpers/custom_trace.dart';

class Media {
  String id;
  String name;
  String url;

  Media();

  Media.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      name = jsonMap['name'];
      url = jsonMap['url'];
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["url"] = url;
    return map;
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}