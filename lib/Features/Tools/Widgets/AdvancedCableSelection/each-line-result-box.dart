import 'package:flutter/material.dart';
import '../../Providers/advanced_cable_selection.dart';
import 'package:provider/provider.dart';

class EachLineResultBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: _mainFontColor,
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Consumer<AdvancedCableSelectionProvider>(
              builder: (ctx, provider, _) => Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: provider.eachLineAmp.toStringAsFixed(3),
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),
                      TextSpan(
                        text: '  AMP',
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   width: 10,
          // ),
          VerticalDivider(
            color: Colors.white,
          ),
          Expanded(
            child: Text(
              'جریان ورودی هر سیم',
              // textScaleFactor: 1.4,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
