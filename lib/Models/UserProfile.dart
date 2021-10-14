class UserProfile {
  String name;
  int attendance_type;
  int location_id;
  int network_id;
  String entry_time;
  String exit_time;
  String status;

  UserProfile.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      name = jsonMap['name'];
      attendance_type = jsonMap['attendance_type'];
      location_id = jsonMap['location_id'];
      network_id = jsonMap['network_id'];
      entry_time = jsonMap['entry_time'];
      exit_time = jsonMap['exit_time'];
    } catch (e) {
      print(e);
    }
  }
}
