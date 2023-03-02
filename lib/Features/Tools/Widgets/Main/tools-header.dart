import 'package:flutter/material.dart';

import '../../../../Cores/Config/image_datas.dart';
import '../../../../Cores/Config/user.dart';

class ToolsMainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      width: User.deviceWidth - 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            logoImage,
            fit: BoxFit.fitWidth,
            width: 20 * User.deviceBlockSize,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'ابزار ها',
                style: TextStyle(
                  fontSize: 6.5 * _deviceBlockSize,
                  fontWeight: FontWeight.w700,
                  color: _mainFontColor,
                ),
                // textScaleFactor: _pixelRatio,
                textDirection: TextDirection.rtl,
              ),
              Text(
                'TOOLS',
                style: TextStyle(
                  fontFamily: 'montserrat',
                  letterSpacing: 4,
                  color: Colors.grey,
                  fontSize: 4 * _deviceBlockSize,
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
