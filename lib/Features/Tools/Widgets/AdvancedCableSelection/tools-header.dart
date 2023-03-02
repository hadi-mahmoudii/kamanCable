import 'package:flutter/material.dart';

import '../../../../Cores/Config/image_datas.dart';

class ToolsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;

    // final double _deviceheight = MediaQuery.of(context).size.height;
    // final double _deviceBlockSizeVertical = _deviceheight / 100;
    // print(_deviceBlockSize);
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            child: Image.asset(logoImage, fit: BoxFit.fitWidth),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'انتــــــخاب کـــــــابل',
                style: TextStyle(
                  fontSize: 6.5 * _deviceBlockSize,
                  fontWeight: FontWeight.w700,
                  color: _mainFontColor,
                ),
                // textScaleFactor: _pixelRatio,
                textDirection: TextDirection.rtl,
              ),
              Text(
                'CABLE SELECTION',
                style: TextStyle(
                  fontFamily: 'montserrat',
                  letterSpacing: 4,
                  color: Colors.grey,
                  fontSize: 3.2 * _deviceBlockSize,
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
