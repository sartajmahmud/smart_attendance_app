class Network {
  int id;
  String ssid;
  String password;

  Network();

  Network.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      ssid = jsonMap['ssid'];
      password = jsonMap['password'];
    } catch (e) {
      print(e);
    }
  }
}
