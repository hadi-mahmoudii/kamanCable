import 'package:flutter/material.dart';

import '../Config/image_datas.dart';
import '../Config/user.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
    required Color mainFontColor,
    // @required double deviceBlockSize,
  })  : _mainFontColor = mainFontColor,
        // _deviceBlockSize = deviceBlockSize,
        super(key: key);

  final Color _mainFontColor;
  // final double _deviceBlockSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                // 'ابـــــــــــزار مــــــــــــــهدی',
                'صنایع کابـــــل کــــــمان',
                style: TextStyle(
                  color: _mainFontColor,
                  fontSize: 4.2 * User.deviceBlockSize,
                ),
                textDirection: TextDirection.rtl,
              ),
              Text(
                'All Rights Reserved',
                style: TextStyle(
                  color: _mainFontColor,
                  fontSize: 2.5 * User.deviceBlockSize,
                  letterSpacing: 2,
                  fontFamily: 'montserrat',
                ),
              )
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset(
            logoImage,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}
