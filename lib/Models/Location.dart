class Location {
  int id;
  String name;
  double latitude;
  double longitude;
  int radius;

  Location();

  Location.fromJSON(Map<String, dynamic> jsonMap){
    try {
      id = jsonMap['id'];
      name = jsonMap['name'];
      latitude = jsonMap['latitude'];
      longitude = jsonMap['longitude'];
      radius = jsonMap['location_id'];
    } catch (e) {
      print(e);
    }
  }
}