import 'package:flutter/material.dart';
import '../../../Cores/Config/user.dart';
import '../Entities/awg_to_mil_datas.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Widgets/app_banner.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../Widgets/AWGToMiliScreen/selector_box.dart';
import '../Widgets/tools-header.dart';

class AWGToMiliScreen extends StatelessWidget {
  static const route = '/AWGToMiliScreen';
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
              pName: 'تبدیل اندازه نمای آمریکایی سیم به میلی متر',
              eName: 'AWG TO MILLIMETER',
            ),
            SizedBox(
              height: 30,
            ),
            AWGToMiliValueSelector(
              // deviceBlockSize: User.deviceBlockSize,
              // deviceWidth: User.deviceWidth,
              packageCTRL: selectedBox,
            ),
          ],
        ),
      ),
    );
  }
}
