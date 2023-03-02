import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';
class ProfileOverveiwPasswordScreen extends StatefulWidget {
  @override
  _ProfileOverveiwPasswordScreenState createState() =>
      _ProfileOverveiwPasswordScreenState();
}

class _ProfileOverveiwPasswordScreenState
    extends State<ProfileOverveiwPasswordScreen> {
  String _curPassword = 'testtest';
  bool _hideCurPassword = true;
  String _newPassword = '';
  bool _hideNewPassword = true;
  String _newPasswordRepeat = '';
  bool _hidenewPasswordRepeat = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final Color _secondColor = _theme.accentColor;

    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    final double _deviceHeight = _media.size.height;
    final double _deviceHeightBlockSize = _deviceHeight / 100;
    // final String _title = 'نام و نام خانوادگی';
    // final IconData _icon = Icons.person;

    return Scaffold(
      appBar: PreferredSize(
        child: SimpleAppbar('اطلاعات حساب کاربری'),
        preferredSize: Size(double.infinity, 7 * _deviceHeightBlockSize),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SimpleHeader2('رمز عبور', 'PASSWORD'),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                initialValue: _curPassword,
                onChanged: (val) {},
                decoration: InputDecoration(
                  icon: SizedBox(
                    width: 10,
                    height: 10,
                    child: Icon(
                      FontAwesomeIcons.lock,
                      color: Colors.grey,
                      size: 6 * _deviceBlockSize,
                    ),
                  ),
                  suffixIcon: InkWell(
                    child: Icon(
                      FontAwesomeIcons.eye,
                      color: _mainFontColor,
                    ),
                    onTap: () {
                      setState(() {
                        _hideCurPassword = !_hideCurPassword;
                      });
                    },
                  ),
                  labelText: 'کلمه ی عبور فعلی',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'iranyekan',
                    fontWeight: FontWeight.w100,
                  ),
                  isDense: true,
                ),
                obscureText: _hideCurPassword,
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontFamily: 'montserrat'),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                initialValue: _newPassword,
                onChanged: (val) {},
                decoration: InputDecoration(
                  icon: SizedBox(
                    width: 10,
                    height: 10,
                    child: Icon(
                      FontAwesomeIcons.lock,
                      color: Colors.grey,
                      size: 6 * _deviceBlockSize,
                    ),
                  ),
                  suffixIcon: InkWell(
                    child: Icon(
                      FontAwesomeIcons.eye,
                      color: _mainFontColor,
                    ),
                    onTap: () {
                      setState(() {
                        _hideNewPassword = !_hideNewPassword;
                      });
                    },
                  ),
                  labelText: 'کلمه ی عبور جدید',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'iranyekan',
                    fontWeight: FontWeight.w100,
                  ),
                  isDense: true,
                ),
                obscureText: _hideCurPassword,
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontFamily: 'montserrat'),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                initialValue: _newPasswordRepeat,
                onChanged: (val) {},
                decoration: InputDecoration(
                  icon: SizedBox(
                    width: 10,
                    height: 10,
                    child: Icon(
                      FontAwesomeIcons.lock,
                      color: Colors.grey,
                      size: 6 * _deviceBlockSize,
                    ),
                  ),
                  suffixIcon: InkWell(
                    child: Icon(
                      FontAwesomeIcons.eye,
                      color: _mainFontColor,
                    ),
                    onTap: () {
                      setState(() {
                        _hidenewPasswordRepeat = !_hidenewPasswordRepeat;
                      });
                    },
                  ),
                  labelText: 'تکرار کلمه ی عبور جدید',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'iranyekan',
                    fontWeight: FontWeight.w100,
                  ),
                  isDense: true,
                ),
                obscureText: _hideCurPassword,
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontFamily: 'montserrat'),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _mainFontColor,
                    ),
                    child: Text(
                      'تایید اطلاعات ✔',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _secondColor,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 6 * _deviceBlockSize,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
