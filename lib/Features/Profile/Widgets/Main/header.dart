import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../Cores/main-screen.dart';
import '../../../Auth/Providers/auth.dart';

class ProfileMainHeader extends StatelessWidget {
  // this header have no icon
  final String persian;
  final String english;
  final bool isloggedIn;
  ProfileMainHeader(this.persian, this.english, this.isloggedIn);
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final Color _secondFontColor = _theme.accentColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Container(
      margin: EdgeInsets.only(bottom: isloggedIn ? 25 : 0),
      // padding: const EdgeInsets.only(top: 8.0, right: 20, left: 20),
      child: Row(
        children: <Widget>[
          isloggedIn
              ? InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: AlertDialog(
                          title: Text('خروج'),
                          content: Text('خروج از حساب کاربری؟'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('خیر'),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            ),
                            TextButton(
                              child: Text('بله'),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                Provider.of<Auth>(context, listen: false)
                                    .logout();
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx) => MainScreen(),
                                  ),
                                );
                                // Phoenix.rebirth(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(1),
                    child: Icon(
                      FontAwesomeIcons.powerOff,
                      color: _secondFontColor,
                    ),
                  ),
                )
              : Container(),
          Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                persian,
                style: TextStyle(
                  fontSize: 6 * _deviceBlockSize,
                  fontWeight: FontWeight.w700,
                  color: _mainFontColor,
                ),
                textDirection: TextDirection.rtl,
                // textScaleFactor: _pixelRatio,
              ),
              Text(
                english,
                style: TextStyle(
                  fontFamily: 'montserrat',
                  letterSpacing: 4,
                  color: Colors.grey,
                  fontSize: 3 * _deviceBlockSize,
                ),
                textDirection: TextDirection.rtl,
                // textScaleFactor: _pixelRatio,
              ),
            ],
          )
        ],
      ),
    );
  }
}
