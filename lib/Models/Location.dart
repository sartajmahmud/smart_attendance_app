class OfficeLocation {
  int id;
  String name;
  double latitude;
  double longitude;
  int radius;

  OfficeLocation();

  OfficeLocation.fromJSON(Map<String, dynamic> jsonMap){
    try {
      id = jsonMap['id'];
      name = jsonMap['name'];
      latitude = jsonMap['latitude'];
      longitude = jsonMap['longitude'];
      radius = jsonMap['radius'];
    } catch (e) {
      print(e);
    }
  }
}