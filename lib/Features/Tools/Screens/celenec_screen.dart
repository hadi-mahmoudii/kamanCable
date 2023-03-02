import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/app_banner.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/static_bottom_selector.dart';
import '../Entities/cenelec_datas.dart';
import '../Widgets/tools-header.dart';
import '../Widgets/translators_result_table.dart';

class CelenecScreen extends StatefulWidget {
  static const route = '/CelenecScreen';

  @override
  _CelenecScreenState createState() => _CelenecScreenState();
}

class _CelenecScreenState extends State<CelenecScreen> {
  // TextEditingController dpCtrl = new TextEditingController();
  // TextEditingController nvCtrl = new TextEditingController();
  // TextEditingController iCtrl = new TextEditingController();
  // TextEditingController seCtrl = new TextEditingController();
  // TextEditingController cCtrl = new TextEditingController();
  // TextEditingController cmCtrl = new TextEditingController();
  // TextEditingController sdCtrl = new TextEditingController();
  // TextEditingController ctCtrl = new TextEditingController();
  // TextEditingController ccCtrl = new TextEditingController();
  // TextEditingController pcCtrl = new TextEditingController();
  // TextEditingController csCtrl = new TextEditingController();
  List<TextEditingController> allCtrls = [];
  // Map<String, String> dpValue = {'title': '', 'type': ''};
  // Map<String, String> nvValue = {'title': '', 'type': ''};
  // Map<String, String> iValue = {'title': '', 'type': ''};
  // Map<String, String> seValue = {'title': '', 'type': ''};
  // Map<String, String> cValue = {'title': '', 'type': ''};
  // Map<String, String> cmValue = {'title': '', 'type': ''};
  // Map<String, String> sdValue = {'title': '', 'type': ''};
  // Map<String, String> ctValue = {'title': '', 'type': ''};
  // Map<String, String> ccValue = {'title': '', 'type': ''};
  // Map<String, String> pcValue = {'title': '', 'type': ''};
  // Map<String, String> csValue = {'title': '', 'type': ''};
  List<Map<String, String>> allValues = [];
  List<String> allLabes = [
    'Design Parameter',
    'Nominal Voltage',
    'Insulation',
    'Structural Elements',
    'Coating',
    'Conductor Material',
    'Special Design',
    'Conductor Type',
    'Conductor Count',
    'Protective Conductor',
    'Conductor Size',
  ];
  List<Map<String, String>> allSelectors = [
    CenelecDatas.dp,
    CenelecDatas.nv,
    CenelecDatas.iAndsm,
    CenelecDatas.se,
    CenelecDatas.iAndsm,
    CenelecDatas.cm,
    CenelecDatas.sdf,
    CenelecDatas.ct,
    CenelecDatas.number,
    CenelecDatas.pc,
    CenelecDatas.size
  ];
  bool isInit = true;
  String keyResult = '';
  @override
  void didChangeDependencies() {
    if (isInit) {
      for (var i = 0; i < 11; i++) {
        allCtrls.add(
          TextEditingController(),
        );
      }
      for (var i = 0; i < 11; i++) {
        allValues.add({'title': '', 'type': ''});
      }
      setState(() {
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double User.deviceBlockSize = _devicewidth / 100;
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      bottomNavigationBar: Container(
        height: 50,
        child: AppBanner(
          mainFontColor: _mainFontColor,
          // deviceBlockSize: User.deviceBlockSize,
        ),
      ),
      appBar: PreferredSize(
        child: SimpleAppbar('ابزار ها'),
        preferredSize: Size(40, 40),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ToolsHeader(
              pName: 'استاندارد سِلِنِک',
              eName: 'CELENEC',
            ),
          ),
          Container(
            // width: _devicewidth - 40,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                for (var i = 0; i < allCtrls.length; i++)
                  Container(
                    width: User.deviceBlockSize * 48 - 20,
                    child: StaticBottomSelector(
                      color: _mainFontColor,
                      icon: null,
                      label: '${i + 1}.${allLabes[i]}',
                      controller: allCtrls[i],
                      datas: allSelectors[i],
                      function: (key, value) {
                        keyResult = '';
                        allValues[i]['type'] = value;
                        allValues[i]['title'] = key;
                        for (var value in allValues) {
                          keyResult += value['title']!;
                        }
                        setState(() {});
                      },
                    ),
                  )
                // Container(
                //   width: User.deviceBlockSize * 40,
                //   child: DropDownBox2(
                //     label: allLabes[i],
                //     icon: null,
                //     values: allSelectors[i],
                //     func: (key, value) {
                //       keyResult = '';
                //       allValues[i]['type'] = value;
                //       allValues[i]['title'] = key;
                //       for (var value in allValues) {
                //         keyResult += value['title'];
                //       }
                //       setState(() {});
                //     },
                //     ctrl: allCtrls[i],
                //   ),
                // )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          keyResult == ''
              ? Container()
              : Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: _mainFontColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      keyResult,
                      style: TextStyle(
                        fontSize: User.deviceBlockSize * 6,
                        color: Colors.white,
                        fontFamily: 'montserrat',
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TranslatorsResultTable(
              deviceBlockSize: User.deviceBlockSize,
              deviceWidth: User.deviceWidth,
              values: allValues,
            ),
          ),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
