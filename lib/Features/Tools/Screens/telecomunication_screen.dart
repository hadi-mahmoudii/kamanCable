import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/app_banner.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/static_bottom_selector.dart';
import '../Entities/telecomunication_datas.dart';
import '../Widgets/tools-header.dart';
import '../Widgets/translators_result_table.dart';

class TelecomunicationScreen extends StatefulWidget {
  static const route = '/TelecomunicationScreen';

  @override
  _TelecomunicationScreenState createState() => _TelecomunicationScreenState();
}

class _TelecomunicationScreenState extends State<TelecomunicationScreen> {
  List<TextEditingController> allCtrls = [];
  List<Map<String, String>> allValues = [];
  List<String> allLabes = [
    'Cable Type',
    'Insulation',
    'Shield',
    'Armor',
    'Coating',
    'Element Count',
    'Arrange',
    'Conductor Size',
  ];
  List<Map<String, String>> allSelectors = [
    TelecomDatas.types,
    TelecomDatas.insulation,
    TelecomDatas.shield,
    TelecomDatas.armor,
    TelecomDatas.jacket,
    TelecomDatas.number,
    TelecomDatas.arrange,
    TelecomDatas.size,
  ];
  bool isInit = true;
  String keyResult = '';
  @override
  void didChangeDependencies() {
    if (isInit) {
      for (var i = 0; i < 8; i++) {
        allCtrls.add(
          TextEditingController(),
        );
      }
      for (var i = 0; i < 8; i++) {
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
              pName: 'استاندارد ارتباطات',
              eName: 'TELECOMUNICATION',
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
