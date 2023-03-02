import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widgets/AdvancedCableSelection/each-line-result-box.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/app_banner.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../Providers/advanced_cable_selection.dart';
import '../Widgets/AdvancedCableSelection/enviroment-table.dart';
import '../Widgets/AdvancedCableSelection/input-table.dart';
import '../Widgets/AdvancedCableSelection/result-box.dart';
import '../Widgets/tools-header.dart';

class AdvancedCableSelection extends StatefulWidget {
  static const route = '/AdvancedCableSelection';
  @override
  _AdvancedCableSelectionState createState() => _AdvancedCableSelectionState();
}

class _AdvancedCableSelectionState extends State<AdvancedCableSelection> {
  //table1
  // TextEditingController _volCtrl = TextEditingController();
  // TextEditingController _dvolCtrl = TextEditingController();
  // TextEditingController _loadCurrentCtrl = TextEditingController();
  // TextEditingController _powerFactorCtrl = TextEditingController();
  //table2
  // TextEditingController _shortCircuitRatingCtrl = TextEditingController();
  // TextEditingController _shortCircuitPowerFactorCtrl = TextEditingController();
  // TextEditingController _shortCircuitPowerDurationCtrl =
  // TextEditingController();

  // static GlobalKey<FormState> _form = GlobalKey<FormState>();
  // TextEditingController _cableLengthCtrl = TextEditingController();
  bool isInit = true;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      final bool letShowDialog = ModalRoute.of(context)!.settings.arguments as bool;
      if (letShowDialog)
        Future.delayed(
          Duration.zero,
          () => showDialog(
            context: context,
            builder: (ctx) => WarnDialog(),
          ),
        );
      Provider.of<AdvancedCableSelectionProvider>(context).resetValues();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double _deviceBlockSize = _devicewidth / 100;
    // _volCtrl.text = '220';
    // _dvolCtrl.text = '3';
    // _loadCurrentCtrl.text = '100';
    // _powerFactorCtrl.text = '1';
    // _shortCircuitRatingCtrl.text = '10';
    // _shortCircuitPowerFactorCtrl.text = '0.25';
    // _shortCircuitPowerDurationCtrl.text = '0.02';
    // _cableLengthCtrl.text = '25';
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double _deviceBlockSize = _devicewidth / 100;
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ToolsHeader(
                  pName: 'انتخاب کابل پیشرفته',
                  eName: 'ADVANCE CABLE SELECTION',
                ),
                // ToolsHeader(),
                SizedBox(height: 20),
                InputTable(),
                EnviromentTable(),
                ShowButton(mainFontColor: _mainFontColor),
                EachLineResultBox(),
                ResultBox(),
                SizedBox(height: 20),
                ResetButton(mainFontColor: _mainFontColor),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WarnDialog extends StatelessWidget {
  const WarnDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Spacer(),
          Text(
            'توجه داشته باشید',
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
      content: Text(
        'محاسبات انجام شده در این ابزار صرفا بر اساس استاندارد کابل های مسی و تولیدات شرکت کابل کمان بوده و این شرکت مسؤلیتی در مورد دیگر برندها نخواهد داشت .',
        textDirection: TextDirection.rtl,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0x1B, 0x27, 0x49, 1),
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'بسیار خب، متوجه شدم.',
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ShowButton extends StatelessWidget {
  const ShowButton({
    Key? key,
    required Color mainFontColor,
  })  : _mainFontColor = mainFontColor,
        super(key: key);

  final Color _mainFontColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          // print('object');
          Provider.of<AdvancedCableSelectionProvider>(context, listen: false)
              .calculateResult();
          // FocusScope.of(context).requestFocus();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: _mainFontColor,
            border: Border.all(),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              'تعیین جریان خروجی',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  const ResetButton({
    Key? key,
    required Color mainFontColor,
  })  : _mainFontColor = mainFontColor,
        super(key: key);

  final Color _mainFontColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .popAndPushNamed(AdvancedCableSelection.route, arguments: false);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: _mainFontColor,
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'انتخاب مجدد',
                style: TextStyle(color: Colors.white),
                textDirection: TextDirection.rtl,
              ),
              Icon(FontAwesomeIcons.angleUp, color: Colors.white
                  // size: 7 ,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
