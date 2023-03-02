import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/cable_selection.dart';

class BasicTable extends StatefulWidget {
  @override
  _BasicTableState createState() => _BasicTableState();
}

class _BasicTableState extends State<BasicTable> {
  @override
  Widget build(BuildContext context) {
    var cableProviderObject =
        Provider.of<CableSelectionProvider>(context, listen: false);
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: _mainFontColor, width: 1),
          left: BorderSide(color: Colors.grey, width: 0.5),
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
        // borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: <Widget>[
          Text(
            '2. Enviroment',
            style: TextStyle(
              fontFamily: 'montserrat',
              fontWeight: FontWeight.w700,
              color: _mainFontColor,
              fontSize: 5 * _deviceBlockSize,
            ),
            // textScaleFactor: 1.4,
          ),
          SizedBox(
            height: 10,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              // initialValue: '0',
              onChanged: (value) {
                cableProviderObject.setVoltageValue(double.parse(value));
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 2),
                labelText: 'ولتاژ',
                labelStyle: TextStyle(fontFamily: 'iranyekan'),
                suffix: Text(
                  'Volt',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                isDense: false,
              ),
              style: TextStyle(fontFamily: 'montserrat'),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              // initialValue: '0',
              onChanged: (value) {
                cableProviderObject.setdVoltageValue(double.parse(value));
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 2),
                labelText: 'افت ولتاژ - درصد',
                labelStyle: TextStyle(fontFamily: 'iranyekan'),
                suffix: Text(
                  '[6.9v]%',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                isDense: false,
              ),
              style: TextStyle(fontFamily: 'montserrat'),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              // initialValue: '0',
              onChanged: (value) {
                cableProviderObject.setdPathDistanceValue(double.parse(value));
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 2),
                labelText: 'طول مسیر',
                labelStyle: TextStyle(fontFamily: 'iranyekan'),
                suffix: Text(
                  'Meter',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                isDense: false,
              ),
              style: TextStyle(fontFamily: 'montserrat'),
              keyboardType: TextInputType.number,
            ),
          ),
          // InputBox(
          //   title: ' نسبت اتصال کوتاه',
          //   subtitle: widget._shortCircuitRatingsub,
          //   ctrl: widget._shortCircuitRatingCtrl,
          // ),
          // InputBox(
          //   title: ' ضریب قدرت اتصال کوتاه',
          //   subtitle: widget._shortCircuitPowerFactorsub,
          //   ctrl: widget._shortCircuitPowerFactorCtrl,
          // ),
          // InputBox(
          //   title: ' مدت زمان اتصال کوتاه',
          //   subtitle: widget._shortCircuitPowerDurationsub,
          //   ctrl: widget._shortCircuitPowerDurationCtrl,
          // ),
          SizedBox(
            height: 20,
          ),
          // TextButton(
          //   padding: EdgeInsets.all(0),
          //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          //   onPressed: () {
          //     setState(() {
          //       // table2Vis = !table2Vis;
          //     });
          //   },
          //   child: Container(
          //     width: 50 * _deviceBlockSize,
          //     decoration: BoxDecoration(
          //       border: Border.all(),
          //       borderRadius: BorderRadius.circular(7),
          //     ),
          //     child: Row(
          //       children: <Widget>[
          //         Spacer(),
          //         Text(
          //           'ولتاژ و جریان',
          //           style: TextStyle(
          //             color: _mainFontColor,
          //           ),
          //           textDirection: TextDirection.rtl,
          //         ),
          //         Icon(
          //           FontAwesomeIcons.angleDown,
          //           color: _mainFontColor,
          //           // size: 7 ,
          //         ),
          //         Spacer(),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
