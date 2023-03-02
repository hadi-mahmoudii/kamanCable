import 'package:flutter/material.dart';
import '../../../Cores/Config/routes.dart';
import 'advanced_cable_selection_screen.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/five_navigation_button.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../../Profile/Screens/profile_main_screen.dart';
import '../Widgets/Main/tools-header.dart';
import '../Widgets/Main/tools_navigator_box.dart';
import 'awg_to_mili_screen.dart';
import 'cable_selection_screen.dart';
import 'power_consumption_screen.dart';
import 'translator_selector_screen.dart';

class ToolsMainScreen extends StatefulWidget {
  @override
  _ToolsMainScreenState createState() => _ToolsMainScreenState();
}

class _ToolsMainScreenState extends State<ToolsMainScreen> {
  bool showLogin = false;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var _mainFontColor = themeData.primaryColor;
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double User.deviceBlockSize = _devicewidth / 100;
    // final double _deviceHeigth = _media.size.height;
    // final double _deviceHeigthBlockSize = _deviceHeigth / 100;
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: PreferredSize(
        child: SimpleAppbar('بازگشت'),
        preferredSize: Size(double.infinity, 40),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: showLogin
            ? UnloginUserContainer(
                mainFontColor: _mainFontColor,
                // deviceBlockSize: User.deviceBlockSize,
                // deviceHeightBlockSize: 5,
              )
            : ListView(
                children: <Widget>[
                  ToolsMainHeader(),
                  ToolsScreenNavigatorBox(
                    color: _mainFontColor,
                    deviceBlockSize: User.deviceBlockSize,
                    pName: 'تبدیل اندازه نمای آمریکایی سیم به میلیمتر',
                    eName: 'AWG to Millimeter Converter',
                    navigate: () => User.token == 'Bearer '
                        ? setState(() {
                            showLogin = true;
                          })
                        : Navigator.of(context)
                            .pushNamed(AWGToMiliScreen.route),
                  ),
                  ToolsScreenNavigatorBox(
                    color: Color.fromRGBO(0x1B, 55, 95, 1),
                    deviceBlockSize: User.deviceBlockSize,
                    pName: 'توان مصرفی تجهیزات و وسائل',
                    eName: 'Appliances Power Consumption',
                    navigate: () => User.token == 'Bearer '
                        ? setState(() {
                            showLogin = true;
                          })
                        : Navigator.of(context)
                            .pushNamed(PowerConsumptionScreen.route),
                  ),
                  ToolsScreenNavigatorBox(
                    color: _mainFontColor,
                    deviceBlockSize: User.deviceBlockSize,
                    pName: 'انتخاب کابل',
                    eName: 'Cable Selection',
                    navigate: () => User.token == 'Bearer '
                        ? setState(() {
                            showLogin = true;
                          })
                        : Navigator.of(context)
                            .pushNamed(CableSelectionScreen.route,arguments: true),
                  ),
                  ToolsScreenNavigatorBox(
                    color: Color.fromRGBO(0x1B, 55, 95, 1),
                    deviceBlockSize: User.deviceBlockSize,
                    pName: 'ترجمه ی کدهای مشخصه',
                    eName: 'Identifier Code Translator',
                    navigate: () => User.token == 'Bearer '
                        ? setState(() {
                            showLogin = true;
                          })
                        : Navigator.of(context)
                            .pushNamed(TranslatorSelectorScreen.route),
                  ),
                  ToolsScreenNavigatorBox(
                    color: _mainFontColor,
                    deviceBlockSize: User.deviceBlockSize,
                    pName: 'سیم و کابل موردنیاز ساختمان',
                    eName: 'Building Cables',
                    navigate: () => User.token == 'Bearer '
                        ? setState(() {
                            showLogin = true;
                          })
                        : Navigator.of(context)
                            .pushNamed(Routes.buildingCablesScreen),
                  ),
                  ToolsScreenNavigatorBox(
                    color: Color.fromRGBO(0x1B, 55, 95, 1),
                    deviceBlockSize: User.deviceBlockSize,
                    pName: 'انتخاب کابل پیشرفته',
                    eName: 'Advance Cable Selection',
                    navigate: () => User.token == 'Bearer '
                        ? setState(() {
                            showLogin = true;
                          })
                        : Navigator.of(context)
                            .pushNamed(AdvancedCableSelection.route,arguments: true),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: FiveNavigationButton(
        curIndex: 3,
        mainFontColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
