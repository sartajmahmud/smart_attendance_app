
import 'dart:convert';
import 'dart:io';

import 'package:deliveryboy/src/helpers/custom_trace.dart';
import 'package:deliveryboy/src/models/driver.dart';
import 'package:deliveryboy/src/repository/user_repository.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

Future<int> UpdateRiderStatus({Driver driver}) async {
  final String _apiToken = 'api_token=${currentUser.value.apiToken}';
  final String url = 'http://admin.food-aholic.com/api/driver-update-status/${currentUser.value.id}?$_apiToken';
  final client = new http.Client();
  final response = await client.put(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(driver.RiderStatus()),
  );
  print("this is update user $url");
  // print("this is update user body ${json.encode(user.toMap())}");
  print("this is update user response body ${response.body}");
  //setCurrentUser(response.body);
  int status = int.parse(json.decode(response.body)['data'].toString());
  return status;
}

 Future<Driver> GetRider() async {
  final String _apiToken = 'api_token=${currentUser.value.apiToken}';
  final String url = '${GlobalConfiguration().getString('api_base_url')}${currentUser.value.id}?$_apiToken';
  final client = new http.Client();
 // final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  try{
    final response = await client.get(url);
    print("this is url $url");
    print("this is url ${json.decode(response.body)['data']['driver']}");
    return Driver.fromJSON(json.decode(response.body)['data']['driver']);
  }catch(e){
    print(CustomTrace(StackTrace.current, message: url));
    return new Driver.fromJSON({});
  }

}