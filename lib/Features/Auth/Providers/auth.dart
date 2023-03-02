import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Cores/Config/urls.dart';
import '../../../Cores/Config/user.dart';
import '../../../Cores/Models/request_result.dart';

class Auth extends ChangeNotifier with ReassembleHandler {
  @override
  void reassemble() {}
  bool showSplash = true; //for dont show splash many times
  // resetShowSplash(){
  //   showSplash = false;
  //   // notifyListeners();
  // }
  String? _helperToken;
  String? _token;
  DateTime? _expiaryDate;
  bool _isLoggedIn = false;
  Map<String, dynamic>? _userData = {};

  bool get isAuth {
    return token != null;
  }

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  String? get token {
    if (_expiaryDate != null &&
        _expiaryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  // Map<String, dynamic> get user {
  //   return {..._user};
  // }

// eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjI5YWE5Y2JjYWU0MjkyYTY5MWQwOGU3MTM0MGI1NzBlOGFlMWIwMDlmNDRiMGRjZTU3NDk1ZjMzYTIxMmNjYzg3ZWVjODdhNDNkYzQ3NGM1In0.eyJhdWQiOiIxIiwianRpIjoiMjlhYTljYmNhZTQyOTJhNjkxZDA4ZTcxMzQwYjU3MGU4YWUxYjAwOWY0NGIwZGNlNTc0OTVmMzNhMjEyY2NjODdlZWM4N2E0M2RjNDc0YzUiLCJpYXQiOjE1OTAzMDQwMzIsIm5iZiI6MTU5MDMwNDAzMiwiZXhwIjoxNjIxODQwMDMyLCJzdWIiOiIxNTY5Iiwic2NvcGVzIjpbXX0.G7FlP8l4Fq1PK-iB2otXYnunlQwGA0RgwFhFyHYVmcnuDSCM8NBdhlgxUdNAXTfv2ASuD6GTFehtHlYZoU6LUc8cspxzBnlqapJOi7GVYHasVu7GTKpJ9a2-_io0ikFfyRg-1YV7G-cU1tPhtaaVzCPbZYQ93pISGB9Jx_IZHuO58glHxF9OZQoSoZj-1RxI96e2s3_6-_Dv74_qASxrAdPdtCwbGJu8PI2b8NUaosBp89bDcWdDPfBzOat1fGJViNvSliufAFXrWwHU9oim6W9pzJfbgBApkm4L0Wt7B1ECwyCmP3ZQcY-UvjIsjpk4nJkotrl-nQ19ZfnuBdTob_yTdeddwN2C_mQdF6F0Ilw2Yc_dVFFLn2U3iO25pY9TkETLgQDR8iF1sjQNtUpr41wPIAujb3rc1jIj3aMexPvctelpTQQF_Qqk-iMr8_7mTwPQMrgVFDXT8QU6xgSaxiCC3yuNwFN8JPsjrvYCq6xhEct7uFpwiEUzcTSo3g8ZdM2mbYJj5cpa0LWXx6L_Ffmw7HtxUvlREYkuUrqCu1nfXnVOpWO8Bwo0nauZan2KxJBDEO5bYeViQMcUhMW7rArn3TkK0NCi9Xxco8SL2mO5MfKeNcFZZhxva7aFHvSV3I6fUCZbjlKfK3qEd_b1hdRdcbQvWfRGqBdy_Lk3Xw8
  Future<RequestResult> verifyRegister(String code) async {
    final response = await http.post(
      Uri.parse(Urls.verifyRegisterNumber),
      body: {
        'code': code,
      },
      headers: {'X-Requested-With': 'XMLHttpRequest', 'origin': Urls.domain},
    );
    final responseData = json.decode(response.body);
    // print(responseData);
    try {
      if ((responseData['data'] as List<dynamic>).isEmpty) {
        // print('Wrong Code');
        return RequestResult.WrongCode;
      }
    } catch (e) {}

    _token = responseData['data']['token'];
    _userData = responseData['data']['user'];
    User.name = _userData!['name'];
    User.phone = _userData!['cell_number'];
    _expiaryDate = DateTime.now().add(
      Duration(
        // seconds: responseData['expires_in'],
        seconds: 10000000000,
      ),
    );
    User.token = _token;
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'token': _token,
      'expiaryDate': _expiaryDate!.toIso8601String(),
      'user': _userData
    });
    prefs.setString('userData', userData);
    _isLoggedIn = true;
    notifyListeners();
    return RequestResult.Accept;
  }

  Future<RequestResult> forgetPass(String cellNumber) async {
    final response = await http.post(
      Uri.parse(Urls.getForgetPassNumber),
      body: {
        'cell_number': cellNumber,
      },
      headers: {'X-Requested-With': 'XMLHttpRequest', 'origin': Urls.domain},
    );
    final responseData = json.decode(response.body);
    // print(responseData);
    // if (response.statusCode == 401) {
    //   if (responseData['message'] == 'The user credentials were incorrect.') {
    //     return 'badinput'; // incorrect user or pass
    //   }
    //   else{
    //     return 'error';
    //   }
    // }
    try {
      if (responseData['message']['title'] == 'موفق') {
        return RequestResult.VerifyPhone;
      } else {
        return RequestResult.Reject;
      }
    } catch (e) {
      return RequestResult.Reject;
    }
  }

  Future<RequestResult> sendRePass(String password) async {
    final response = await http.post(
      Uri.parse(Urls.sendRePass),
      body: {
        'password': password,
        'password_confirmation': password,
      },
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'origin': Urls.domain,
        'Authorization': 'Bearer ' + _helperToken!,
      },
    );
    final responseData = json.decode(response.body);
    // print(responseData['message']['title']);
    if (responseData['message']['title'] == 'موفق') {
      return RequestResult.Accept;
    } else {
      return RequestResult.Reject;
    }
  }

  Future<RequestResult> verifyForgetPass(String code) async {
    final response = await http.post(
      Uri.parse(Urls.verifyForgetPassNumber),
      body: {
        'code': code,
      },
      headers: {'X-Requested-With': 'XMLHttpRequest', 'origin': Urls.domain},
    );
    final responseData = json.decode(response.body);
    if (responseData['data'] == null) {
      return RequestResult.WrongCode;
    }
    // print(responseData['data']);
    _helperToken = responseData['data']['token'];
    return RequestResult.Accept;

    // if (response.statusCode == 401) {
    //   if (responseData['message'] == 'The user credentials were incorrect.') {
    //     return 'badinput'; // incorrect user or pass
    //   }
    //   else{
    //     return 'error';
    //   }
    // }
    // try {
    //   if (responseData['message']['title'] == 'موفق') {
    //     return RequestResult.VerifyPhone;
    //   } else {
    //     return RequestResult.Reject;
    //   }
    // } catch (e) {
    //   return RequestResult.Reject;
    // }
  }

  Future<RequestResult> signUp(
      String userName, String password, String cellNumber) async {
    // print(userName);
    // print(password);
    // print(cellNumber);
    // print(Urls.domain);
    final response = await http.post(
      Uri.parse(Urls.signUp),
      body: {
        'last_name': userName,
        'cell_number': cellNumber,
        'password': password,
        'password_confirmation': password,
      },
      headers: {'X-Requested-With': 'XMLHttpRequest', 'origin': Urls.domain},
    );
    final responseData = json.decode(response.body);
    // print(responseData);
    try {
      var result = responseData['message']['title'];
      if (result == 'موفق') {
        return RequestResult.VerifyPhone;
      }
    } catch (e) {}
    try {
      if (responseData['errors']['cell_number'][0] ==
          'تلفن همراه قبلا انتخاب شده است.') {
        return RequestResult.DuplicateNumber;
      }
    } catch (e) {}
    return RequestResult.Reject;
  }

  Future<RequestResult> login(String userName, String password) async {
    final response = await http.post(
      Uri.parse(Urls.login),
      body: {
        'username': userName,
        'password': password,
      },
      headers: {'X-Requested-With': 'XMLHttpRequest', 'origin': Urls.domain},
    );
    final responseData = json.decode(response.body);
    // for (var key in (responseData['data'] as Map).keys) {
    //   print(key);
    //   print(responseData['data'][key]);
    // }
    // print(responseData['data']);
    try {
      if (responseData['errors']['verification'] ==
          'تأیید شماره تلفن انجام نشده است.') {
        return RequestResult.VerifyPhone;
      }
    } catch (e) {}
    try {
      if (responseData['errors']['credentials'] ==
          'نام کاربری و یا رمز عبور نادرست می باشد.') {
        return RequestResult.WrongLogin;
      }
      if (responseData['message'] == 'The given data was invalid.') {
        return RequestResult.WronNumber;
      }
    } catch (e) {}
    _token = responseData['data']['token'];
    User.token = _token;
    _userData = responseData['data']['user'];
    User.name = _userData!['name'];
    // print(_userData['cell_number']);
    User.phone = _userData!['cell_number'];
    _expiaryDate = DateTime.now().add(
      Duration(
        // seconds: responseData['expires_in'],
        seconds: 10000000000,
      ),
    );
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'token': _token,
      'expiaryDate': _expiaryDate!.toIso8601String(),
      'user': _userData
    });
    prefs.setString('userData', userData);
    _isLoggedIn = true;
    notifyListeners();
    return RequestResult.Accept;
  }

  Future<bool> tryAutoLogin(BuildContext context) async {
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // print('try auto');
    _isLoggedIn = false;
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      // print('undone');

      return false;
    }
    final userData =
        json.decode(prefs.getString('userData')!);
    final expiaryDate = DateTime.parse(userData['expiaryDate'] as String);
    if (expiaryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = userData['token'] as String?;
    User.token = _token;
    _expiaryDate = expiaryDate;
    _userData = userData['user'] as Map<String, dynamic>?;
    User.name = _userData!['name'];
    User.phone = _userData!['cell_number'];
    _isLoggedIn = true;
    notifyListeners();
    // print('done');
    return true;
  }

  // Future<Map<String, dynamic>> getUserData() async {
  // final response = await http.get(
  //   Url.getUserInfo,
  //   headers: {'Authorization': 'Bearer ' + token},
  // );
  // // print(response.body);
  // if (response.statusCode == 200) {
  //   var data = json.decode(response.body)['data'];
  //   _user.addAll(
  //     {
  //       'id': data['user']['id'],
  //       'name': data['user']['name'],
  //       'email': data['user']['email'],
  //       'cell_number': data['user']['cell_number'],
  //       'address': data['user']['address'],
  //       'gender': data['user']['gender'],
  //       'medical_center': data['user']['medical_center']['name'],
  //       'roles': data['roles'],
  //     },
  //   );
  //   // print(_user);
  //   notifyListeners();
  //   return _user;
  // } else {
  //   return {};
  // }
  // }

  Future<void> setUserData(id, name, email) async {
    await http.post(
      Uri.parse('https://cssd-doc.com/api/UpdateInfo'),
      headers: {
        'Authorization': 'Bearer ' + token!,
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: json.encode(
        {
          "id": id,
          "name": name,
          "email": email,
          // "country_code": "0098",
          // "cell_number": "09338736511",
          // "gender": "Male",
          // "verified": "Verified",
          // "status": "Active",
          // "medical_center_id": 1,
          // "address": null,
          // "created_at": null,
          // "updated_at": "2020-04-23 21:54:52",
          // "medical_center": {
          //   "id": 1,
          //   "name": "B",
          //   "address": "1",
          //   "phone_number": "12345678951",
          //   "city_id": 1,
          //   "created_at": null,
          //   "updated_at": "2020-01-12 05:38:35"
          // },
          // "roles": [
          //   {
          //     "id": 1,
          //     "name": "Admin",
          //     "guard_name": "web",
          //     "created_at": null,
          //     "updated_at": null,
          //     "pivot": {
          //       "model_id": 1,
          //       "role_id": 1,
          //       "model_type": "App\\User",
          //     },
          //   },
          // ],
        },
      ),
    );
    // print(response.body);
  }

  void logout() async {
    _token = null;
    _expiaryDate = null;
    _userData = {};
    _isLoggedIn = false;
    User.token = '';
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    notifyListeners();
  }
}
