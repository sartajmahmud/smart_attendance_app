class User {
  int id;
  int role_id;
  String name;
  String password;
  String email;
  String phoneNumber;
  String device_token;
  bool auth;

  User();

  @override
  String toString() {
    var map = this.loginMap();
    map["auth"] = this.auth;
    return map.toString();
  }

  User.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      role_id = jsonMap['role_id'];
      name = jsonMap['name'];
      email = jsonMap['email'];
      phoneNumber = jsonMap['phoneNumber'];
      device_token = jsonMap['device_token'];
    } catch (e) {
      print(e);
    }
  }

  Map loginMap() {
    var map = new Map<String, dynamic>();
    map['phoneNumber'] = phoneNumber;
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
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    if (device_token != null) {
      map["device_token"] = device_token;
    }
    map['role_id'] = 3;

    return map;
  }

  Map DuplicateACMap(){
    var map = new Map<String, dynamic>();
    map['phoneNumber']=phoneNumber;
    return map;
  }
}
