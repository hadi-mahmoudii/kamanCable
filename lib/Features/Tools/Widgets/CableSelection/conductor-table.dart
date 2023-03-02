import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Entities/cable_selection_datas.dart';
import '../../Providers/cable_selection.dart';
import 'drop-down-box.dart';

class ConductorTable extends StatelessWidget {
  const ConductorTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cableProviderObject = Provider.of<CableSelectionProvider>(context);
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Container(
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
            '1. Input',
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
          Align(
            alignment: Alignment.topRight,
            child: Text(
              ' نوع هادی',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 3 * _deviceBlockSize,
              ),
              textDirection: TextDirection.rtl,
              // textScaleFactor: 0.8,
            ),
          ),
          DropDownBox(
            values: cableGuiderTypes,
            func: cableProviderObject.setGuiderType,
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              ' اندود',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 3 * _deviceBlockSize,
              ),
              textDirection: TextDirection.rtl,
              // textScaleFactor: 0.8,
            ),
          ),
          DropDownBox(
            values: cableEndodTypes,
            func: cableProviderObject.setEndod,
          ),
          // InputBox(title: ' ولتاژ', subtitle: _volsub, ctrl: _volCtrl),
          // InputBox(
          //     title: ' افت ولتاژ - درصد', subtitle: _dvolsub, ctrl: _dvolCtrl),
          // InputBox(
          //     title: ' جریان جاری',
          //     subtitle: _loadCurrentsub,
          //     ctrl: _loadCurrentCtrl),
          // InputBox(
          //     title: ' ضریب قدرت',
          //     subtitle: _powerFactorsub,
          //     ctrl: _powerFactorCtrl),
          SizedBox(
            height: 20,
          ),
          // TextButton(
          //   padding: EdgeInsets.all(0),
          //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          //   onPressed: () {
          //     // setState(() {
          //     //   // table2Vis = !table2Vis;
          //     // });
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
          //           'اطلاعات پایه',
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
