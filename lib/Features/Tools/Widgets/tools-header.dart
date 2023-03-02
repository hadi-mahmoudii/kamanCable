import 'package:flutter/material.dart';

import '../../../Cores/Config/image_datas.dart';
import '../../../Cores/Config/user.dart';

class ToolsHeader extends StatelessWidget {
  final String pName;
  final String eName;

  const ToolsHeader({
    Key? key,
    required this.pName,
    required this.eName,
  }) : super(key: key);

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
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Container(
            // height: 50,
            child: Image.asset(
              logoImage,
              fit: BoxFit.fitWidth,
              width: 20 * User.deviceBlockSize,
            ),
          ),
          Spacer(),
          Container(
            width: User.deviceWidth * .66,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  // ,
                  pName,
                  style: TextStyle(
                    fontSize: 5 * _deviceBlockSize,
                    fontWeight: FontWeight.w700,
                    color: _mainFontColor,
                  ),
                  // textScaleFactor: _pixelRatio,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  // 'AWG TO MILLIMETER',
                  eName.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    letterSpacing: 4,
                    color: Colors.grey,
                    fontSize: 3.5 * _deviceBlockSize,
                  ),
                  textDirection: TextDirection.rtl,
                  // textScaleFactor: _pixelRatio,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
