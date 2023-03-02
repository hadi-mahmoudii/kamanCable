import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  static String? _token = '';

  static String get token {
    return 'Bearer ' + User._token!;
  }

  static set token(String? token) {
    User._token = token;
  }

  static String? _name = '';

  static String? get name {
    return User._name;
  }

  static set name(String? name) {
    User._name = name;
  }

  static String? _phone = '';

  static String? get phone {
    return User._phone;
  }

  static set phone(String? phone) {
    User._phone = phone;
  }

  static double _deviceWidth = 0;
  static double get deviceWidth {
    return User._deviceWidth;
  }

  static double _deviceBlockSize = 0;
  static double get deviceBlockSize {
    return User._deviceBlockSize;
  }

  static double _deviceHeigth = 0;
  static double get deviceHeigth {
    return User._deviceHeigth;
  }

  setSizes(Size sizes) {
    _deviceWidth = sizes.width;
    _deviceHeigth = sizes.height;
    _deviceBlockSize = sizes.width / 100;
    // notifyListeners();
  }
}

final Color mainFontColor = Color.fromRGBO(0x1B, 0x27, 0x49, 1);
