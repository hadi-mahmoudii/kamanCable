import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/advanced_cable_selection.dart';

class ResultBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: _mainFontColor,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'جریان موثر',
            // textScaleFactor: 1.4,
            style: TextStyle(
              color: Colors.white,
              fontSize: 5.5 * _deviceBlockSize,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'EFFECTIVE CURRENT',
            style: TextStyle(
              fontFamily: 'montserrat',
              color: Colors.grey,
              fontSize: 3.5 * _deviceBlockSize,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Consumer<AdvancedCableSelectionProvider>(
              builder: (ctx, provider, _) => Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: provider.effectiveAmp.toStringAsFixed(3),
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 10 * _deviceBlockSize,
                        ),
                      ),
                      TextSpan(
                        text: '  AMP',
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 4 * _deviceBlockSize,
                        ),
                      ),
                    ],
                  ),
                ),
                // Text(
                //   value,
                //   style: TextStyle(
                //     fontFamily: 'montserrat',
                //     color: Colors.white,
                //     fontWeight: FontWeight.w700,
                //     fontSize: 10 * _deviceBlockSize,
                //   ),
                // ),
                // Text(
                //   'mm²',
                //   style: TextStyle(
                //     fontFamily: 'montserrat',
                //     color: Colors.white,
                //     fontWeight: FontWeight.w700,
                //     fontSize: 3 * _deviceBlockSize,
                //   ),
                // )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
