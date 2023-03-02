import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Cores/Config/user.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double _deviceWidthBlockSize = _devicewidth / 100;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.3),
      child: Row(
        children: <Widget>[
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Spacer(),
              Text(
                'خانه',
                style: TextStyle(
                    fontSize: 6 * User.deviceBlockSize,
                    fontWeight: FontWeight.bold,
                    color: _mainFontColor),
              ),
              Text(
                'صنایع سیم و کابل کمان',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 3 * User.deviceBlockSize,
                ),
              ),
              Spacer()
            ],
          ),
          Icon(
            FontAwesomeIcons.home,
            size: 10 * User.deviceBlockSize,
            color: _mainFontColor,
          ),
        ],
      ),
    );
  }
}
