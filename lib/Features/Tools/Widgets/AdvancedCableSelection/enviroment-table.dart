import 'package:flutter/material.dart';
import '../../Entities/advanced_cable_selection.dart';
import 'package:provider/provider.dart';

import '../../Providers/advanced_cable_selection.dart';
import 'drop-down-box.dart';

class EnviromentTable extends StatefulWidget {
  @override
  _EnviromentTableState createState() => _EnviromentTableState();
}

class _EnviromentTableState extends State<EnviromentTable> {
  @override
  Widget build(BuildContext context) {
    // var cableProviderObject =
    //     Provider.of<AdvancedCableSelectionProvider>(context, listen: false);
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Consumer<AdvancedCableSelectionProvider>(
      builder: (ctx, cableProviderObject, _) => Container(
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
              height: 15,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                ' درجه حرارت',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 3 * _deviceBlockSize,
                ),
                textDirection: TextDirection.rtl,
                // textScaleFactor: 0.8,
              ),
            ),
            DropDownBox(
              values: tempDatas,
              func: cableProviderObject.setTemp,
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                ' نوع عایق',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 3 * _deviceBlockSize,
                ),
                textDirection: TextDirection.rtl,
                // textScaleFactor: 0.8,
              ),
            ),
            DropDownBox(
              values: insulationMaterialDatas,
              func: cableProviderObject.setInsulationMaterial,
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                ' محل نصب',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 3 * _deviceBlockSize,
                ),
                textDirection: TextDirection.rtl,
                // textScaleFactor: 0.8,
              ),
            ),
            DropDownBox(
              values: insulationPlaceDatas,
              func: cableProviderObject.setInsulationPlace,
            ),
            SizedBox(
              height: 15,
            ),
            cableProviderObject.insulationPlaceIndex == 0
                ? ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          ' نوع خاک',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 3 * _deviceBlockSize,
                          ),
                          textDirection: TextDirection.rtl,
                          // textScaleFactor: 0.8,
                        ),
                      ),
                      DropDownBox(
                        values: natureOfSoilKeys,
                        func: cableProviderObject.setNatureOfSoil,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                : Container(),
            cableProviderObject.insulationPlaceIndex == 0
                ? ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          ' عمق زمین',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 3 * _deviceBlockSize,
                          ),
                          textDirection: TextDirection.rtl,
                          // textScaleFactor: 0.8,
                        ),
                      ),
                      DropDownBox(
                        values: layingDepthKeys,
                        func: cableProviderObject.setLayingDepth,
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
