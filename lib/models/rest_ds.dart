import 'dart:async';
import 'package:smart_home_app/utils/network_util.dart';
import 'package:smart_home_app/models/user_data.dart';
import 'package:smart_home_app/utils/custom_exception.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final baseURL = 'https://192.168.1.101/cloudserver/server_files';
  static final loginURL = baseURL + "/login_data.php";
  static final signupURL = baseURL + "/signup_data.php";
  static final _apiKEY = "somerandomkey";

  Future<User> login(String email, String password) {
    return _netUtil.post(loginURL, body: {
      "token": _apiKEY,
      "email": email,
      "password": password
    }).then((dynamic res) {
      print(res.toString());
      if (res["error"]) throw new FormException(res["errorMessage"].toString());
      return new User.map(res["user"]);
    });
  }

  Future<Map> signup(String name, String email, String password,
      String address, String city, String contact) {
    return _netUtil.post(signupURL, body: {
      "token": _apiKEY,
      "action": "1",
      "name": name,
      "email": email,
      "password": password.toString(),
      "address": address,
      "city": city,
      "mobile": contact.toString(),
    }).then((dynamic res) {
      print(res.toString());
      if (res["error"]) throw new FormException(res["errorMessage"].toString());
      return res;
    });
  }
}
