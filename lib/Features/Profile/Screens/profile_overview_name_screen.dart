import 'package:flutter/material.dart';

import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';

class ProfileOverveiwNameScreen extends StatelessWidget {
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

    final String _name = 'مهدیه';
    final String _family = 'بیگی';

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
            SimpleHeader2('نام و نام خانوادگی', 'NAME AND FAMILY'),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  icon: SizedBox(
                    width: 10,
                    height: 10,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 6 * _deviceBlockSize,
                    ),
                  ),
                  labelText: 'نام',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'iranyekan',
                    fontWeight: FontWeight.w100,
                  ),
                  isDense: true,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                initialValue: _family,
                decoration: InputDecoration(
                  icon: SizedBox(
                    width: 10,
                    height: 10,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 6 * _deviceBlockSize,
                    ),
                  ),
                  labelText: 'نام خانوادگی',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'iranyekan',
                    fontWeight: FontWeight.w100,
                  ),
                  isDense: true,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(
              height: 30,
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
