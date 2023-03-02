import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/app_banner.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../Entities/awg_to_mil_datas.dart';
import '../Widgets/tools-header.dart';
import 'Telecomunication_screen.dart';
import 'celenec_screen.dart';

class TranslatorSelectorScreen extends StatelessWidget {
  static const route = '/TranslatorSelectorScreen';
  @override
  Widget build(BuildContext context) {
    TextEditingController selectedBox = new TextEditingController();
    selectedBox.text = awgDatas[0].keys.first;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: <Widget>[
            ToolsHeader(
              pName: 'تفسیر کابل',
              eName: 'Cable Interpretation',
            ),
            SizedBox(
              height: 20,
            ),
            NavigatorButton(
              mainFontColor: _mainFontColor,
              pName: 'استاندارد سِلِنِک',
              eName: 'CELENEC',
              path: CelenecScreen.route,
              deviceBlockSize: User.deviceBlockSize,
            ),
            NavigatorButton(
              mainFontColor: Color.fromRGBO(0x1B, 55, 95, 1),
              pName: 'استاندارد ارتباطات',
              eName: 'TELECOMUNICATION',
              path: TelecomunicationScreen.route,
              deviceBlockSize: User.deviceBlockSize,
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({
    Key? key,
    required this.mainFontColor,
    required this.pName,
    required this.eName,
    required this.path,
    required this.deviceBlockSize,
  }) : super(key: key);

  final Color mainFontColor;
  final String pName;
  final String eName;
  final String path;
  final double deviceBlockSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(path),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: mainFontColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    eName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 5 * deviceBlockSize,
                      fontFamily: 'montserrat',
                    ),
                  ),
                  Text(
                    pName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 3.5 * deviceBlockSize,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
