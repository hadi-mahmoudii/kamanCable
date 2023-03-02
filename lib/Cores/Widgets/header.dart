import 'package:flutter/material.dart';

class SimpleHeader extends StatelessWidget {
  final String persian;
  final String english;
  SimpleHeader(this.persian, this.english);
  @override
  Widget build(BuildContext context) {
   final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Container(
      margin: EdgeInsets.only(bottom: 2 * _deviceBlockSize),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Icon(Icons.arrow_back_ios),
          Spacer(),
          Column(
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
              ),
              Text(
                english,
                style: TextStyle(
                  fontFamily: 'montserrat',
                  letterSpacing: _deviceBlockSize,
                  color: Colors.grey,
                  fontSize: 3.5 * _deviceBlockSize,
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
