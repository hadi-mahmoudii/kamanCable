import 'package:flutter/material.dart';

class SimpleAppbar extends StatelessWidget {
  final String title;
  SimpleAppbar(this.title);
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    // final Color _secondColor = _theme.accentColor;
    // final Color _secondFontColor = _theme.textSelectionHandleColor;
    // final Color _borderColor = _theme.hoverColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    // final double _pixelRatio =
    //     (_media.size.height / _media.size.width * 7 / 5).roundToDouble();
    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.only(
        right: 1,
        left: 20.3,
        // bottom: _pixelRatio,
        top: MediaQuery.of(context).padding.top,
      ),
      child: TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 3.5 * _deviceBlockSize,
                fontWeight: FontWeight.w700,
                color: _mainFontColor,
              ),
              // textScaleFactor: _pixelRatio,
              textDirection: TextDirection.rtl,
            ),
            Container(
              margin: const EdgeInsets.only(left: 3.0),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 3 * _deviceBlockSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
