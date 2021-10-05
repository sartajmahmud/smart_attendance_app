class User{
  int id;
  String name;
  String password;
  String email;
  int attendance_type;
  int location_id;
  int network_id;
  String device_token;

  bool auth;

  User();

  @override
  String toString() {
    var map = this.loginMap();
    map["auth"] = this.auth;
    return map.toString();
  }

  User.fromJSON(Map<String, dynamic> jsonMap){
    try{
      id = jsonMap['id'];
      name = jsonMap['name'];
      email = jsonMap['email'];
      attendance_type = jsonMap['attendance_type'];
      location_id = jsonMap['location_id'];
      network_id = jsonMap['network_id'];
      device_token = jsonMap['device_token'];

    }catch(e){
      print(e);
    }
  }

  Map loginMap() {

    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['password'] = password;
    if (device_token != null) {
      map["device_token"] = device_token;
    }

    return map;
  }

  Map signUpMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    if (device_token != null) {
      map["device_token"] = device_token;
    }

    return map;
  }
}