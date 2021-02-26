
import 'dart:convert';
import 'dart:io';

import 'package:foodaholic_rider_app/src/helpers/custom_trace.dart';
import 'package:foodaholic_rider_app/src/models/driver.dart';
import 'package:foodaholic_rider_app/src/models/user.dart';
import 'package:foodaholic_rider_app/src/repository/user_repository.dart';
import 'package:geodesy/geodesy.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import '../repository/user_repository.dart' as userRepo;

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

// Future<Driver> updateLocation({Driver driver}) async {
//   User _user = userRepo.currentUser.value;
//   final String _apiToken = 'api_token=${_user.apiToken}';
//   // address.userId = _user.id;
//   final String url = 'http://admin.food-aholic.com/api/driver-current-location/${_user.id}?$_apiToken';
//   final client = new http.Client();
//   try {
//     final response = await client.put(
//       url,
//       headers: {HttpHeaders.contentTypeHeader: 'application/json'},
//       body: json.encode(driver.UpdateLocationMap()),
//     );
//     print("This is update delivery address $url");
//     print("This is update delivery address body ${address.toMap()}");
//     print("This is update delivery address response body ${response.body}");
//     return Address.fromJSON(json.decode(response.body)['data']);
//   } catch (e) {
//     print(CustomTrace(StackTrace.current, message: url));
//     return new Address.fromJSON({});
//   }
// }

Future<void> UpdateRiderLocation({Driver driver, User user}) async {
  //final String _apiToken = 'api_token=${currentUser.value.apiToken}';
  final String _apiToken = 'api_token=${GlobalConfiguration().getString('api_token')}';
  print(_apiToken);
  final String url = 'http://admin.food-aholic.com/api/driver-current-location/39?api_token=IQyyJul4vjP6rdaKZrAU5ao33j6xO3YxIsj5Swvx21hJHD8QFAiMA0MeFivT';
  final client = new http.Client();
  final response = await client.put(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(driver.UpdateLocationMap()),
  );
  print("this is update location $url");
   print("this is update location body ${json.encode(driver.UpdateLocationMap())}");
  print("this is update location response body ${response.body}");
  //setCurrentUser(response.body);
  // int status = int.parse(json.decode(response.body)['data'].toString());
  // return status;
}