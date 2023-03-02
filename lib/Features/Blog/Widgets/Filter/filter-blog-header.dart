import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterBlogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.filter,
            color: _mainFontColor,
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'فیلتر اخبار',
                style: TextStyle(
                  color: _mainFontColor,
                  fontSize: 6 * _deviceBlockSize,
                  fontWeight: FontWeight.w700,
                ),
                textDirection: TextDirection.rtl,
              ),
              Text(
                'FILTERS',
                style: TextStyle(
                  fontFamily: 'montserrat',
                  letterSpacing: 4,
                  color: Colors.grey,
                  fontSize: 3 * _deviceBlockSize,
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
