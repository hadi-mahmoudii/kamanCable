import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';
class ProfileOverveiwIdScreen extends StatefulWidget {
  @override
  _ProfileOverveiwIdScreenState createState() =>
      _ProfileOverveiwIdScreenState();
}

class _ProfileOverveiwIdScreenState extends State<ProfileOverveiwIdScreen> {
  bool? _isForgion = false;

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
    final String _idCode = '0371451515';

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
            SimpleHeader2('کد ملی', 'NATIONAL CODE'),
            SizedBox(
              height: 15,
            ),
            _isForgion!
                ? Container()
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      initialValue: _idCode,
                      decoration: InputDecoration(
                        icon: SizedBox(
                          width: 10,
                          height: 10,
                          child: Icon(
                            FontAwesomeIcons.solidIdCard,
                          ),
                        ),
                        labelText: 'کد ملی',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'iranyekan',
                          fontWeight: FontWeight.w100,
                        ),
                        isDense: true,
                      ),
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontFamily: 'montserrat'),
                    ),
                  ),
            SizedBox(
              height: _isForgion! ? 0 : 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Spacer(),
                RichText(
                  text: TextSpan(
                    text: 'تبعه خارجی',
                    style: TextStyle(color: _mainFontColor),
                    children: [
                      TextSpan(
                        text: '(افرادی که فاقد کد ملی می باشند)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    activeColor: _mainFontColor,
                    value: _isForgion,
                    onChanged: (val) {
                      setState(
                        () {
                          _isForgion = val;
                        },
                      );
                    },
                  ),
                ),
              ],
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
