import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../Cores/Config/user.dart';

class HeartHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final Color _secondColor = _theme.accentColor;
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double User.deviceBlockSize = _devicewidth / 100;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.solidHeart,
            color: _secondColor,
            size: 8 * User.deviceBlockSize,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'جزئیات خبر',
                style: TextStyle(
                  color: _mainFontColor,
                  fontSize: 6 * User.deviceBlockSize,
                  fontWeight: FontWeight.w700,
                ),
                textDirection: TextDirection.rtl,
              ),
              Text(
                'FULL TEXT',
                style: TextStyle(
                  fontFamily: 'montserrat',
                  letterSpacing: 5,
                  color: Colors.grey,
                  fontSize: 4 * User.deviceBlockSize,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          )
        ],
      ),
    );
  }
}
