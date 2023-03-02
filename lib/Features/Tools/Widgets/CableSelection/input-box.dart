import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    Key? key,
    required TextEditingController ctrl,
    required String title,
    required String subtitle,
  })  : _ctrl = ctrl,
        _title = title,
        _subtitle = subtitle,
        super(key: key);

  final TextEditingController _ctrl;
  final String _title;
  final String _subtitle;
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            _title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 3 * _deviceBlockSize,
            ),
            textDirection: TextDirection.rtl,
            // textScaleFactor: 0.8,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _ctrl,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      isDense: true,
                      border: InputBorder.none,
                      icon: Text(
                        _subtitle,
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 4 * _deviceBlockSize,
                          fontWeight: FontWeight.w700,
                          color: _mainFontColor,
                        ),
                        // textScaleFactor: 1.2,
                      ),
                    ),
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'montserrat',
                      color: _mainFontColor,
                      fontSize: 3.5 * _deviceBlockSize,
                    ),
                    textAlign: TextAlign.justify,
                    keyboardType: TextInputType.number,
                    minLines: 1,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
