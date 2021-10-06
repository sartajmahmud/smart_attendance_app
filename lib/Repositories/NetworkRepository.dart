import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_attendance/Configs/Server.dart';
import 'package:smart_attendance/Models/Network.dart';
import 'package:smart_attendance/Repositories/UserRepository.dart';

String ServerUrl = getServerUrl();

Future<Network> getNetwork({int id}) async {
  String url ;
if(id!=null){
  url = '$ServerUrl/network/$id';
}else{
  url = '$ServerUrl/network/${currentUser.value.network_id}';
}

  final client = new http.Client();
  final response = await client.get(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  );

  print("This is Network $url");
  print("this is Network response ${response.body}");
  if (response.statusCode == 200) {
    return Network.fromJSON(json.decode(response.body));
  } else {
    print(response.body.toString());
    throw new Exception(response.body);
  }
}