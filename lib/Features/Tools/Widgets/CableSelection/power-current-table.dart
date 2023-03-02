import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/cable_selection.dart';

class PowerCurrentTable extends StatefulWidget {
  const PowerCurrentTable({
    Key? key,
   
  })  : 
        super(key: key);


  @override
  _PowerCurrentTableState createState() => _PowerCurrentTableState();
}

class _PowerCurrentTableState extends State<PowerCurrentTable> {
  TextEditingController _powerCtrl = new TextEditingController();
  TextEditingController _currentCtrl = new TextEditingController();

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
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: _mainFontColor, width: 1),
          left: BorderSide(color: Colors.grey, width: 0.5),
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
      ),
      child: Column(
        children: <Widget>[
          Text(
            '3.Power & Current',
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
              controller: _currentCtrl,
              onTap: () => _currentCtrl.text = '',
              onChanged: (value) {
                _powerCtrl.text =
                    cableProviderObject.currentToPower(double.parse(value));
                // _powerCtrl.text = cableProviderObject.powerValue.toString();
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 2),
                labelText: 'جریان',
                labelStyle: TextStyle(fontFamily: 'iranyekan'),
                suffix: Text(
                  'A',
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
              onTap: () => _powerCtrl.text = '',
              controller: _powerCtrl,
              onChanged: (value) {
                _currentCtrl.text =
                    cableProviderObject.powerToCurrent(double.parse(value));
                // _currentCtrl.text = cableProviderObject.currentValue.toString();
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 2),
                labelText: 'توان',
                labelStyle: TextStyle(fontFamily: 'iranyekan'),
                suffix: Text(
                  'KW',
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
            height: 20,
          ),
          // InkWell(
          //   onTap: (){
          //     Provider.of<CableSelectionProvider>(context).setSizeValue(0);
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
          //           'تعیین سایز کابل',
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
