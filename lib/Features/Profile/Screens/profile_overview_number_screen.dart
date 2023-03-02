import 'package:flutter/material.dart';

import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';
class ProfileOverveiwNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final Color _secondColor = _theme.accentColor;

    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    final double _deviceHeight = _media.size.height;
    final double _deviceHeightBlockSize = _deviceHeight / 100;
    // final String _title = 'نام و نام خانوادگی';
    // final IconData _icon = Icons.person;
    final String _mobile = '09122314565';
    final String _phone = '1234567';

    return Scaffold(
      appBar: PreferredSize(
        child: SimpleAppbar('اطلاعات حساب کاربری'),
        preferredSize: Size(double.infinity, 7 * _deviceHeightBlockSize),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SimpleHeader2('شماره تماس', 'PHONE NUMBER'),
            SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                initialValue: _mobile,
                decoration: InputDecoration(
                  icon: SizedBox(
                    width: 10,
                    height: 10,
                    child: Icon(
                      Icons.person,
                      size: 6 * _deviceBlockSize,
                    ),
                  ),
                  labelText: 'شماره همراه',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'iranyekan',
                    fontWeight: FontWeight.w100,
                  ),
                  isDense: true,
                ),
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'montserrat',
                  color: _mainFontColor,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: _devicewidth * .25,
                  child: SelectorBox(
                    datas: ['0253', '025'],
                    deviceBlockSize: _deviceBlockSize,
                    packageCTRL: new TextEditingController(),
                  ),
                ),
                Spacer(),
                Container(
                  width: _devicewidth * .6,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      initialValue: _phone,
                      decoration: InputDecoration(
                        icon: SizedBox(
                          width: 10,
                          height: 10,
                          child: Icon(
                            Icons.person,
                            size: 6 * _deviceBlockSize,
                          ),
                        ),
                        labelText: 'شماره تلفن ثابت',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'iranyekan',
                          fontWeight: FontWeight.w100,
                        ),
                        isDense: true,
                      ),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'montserrat',
                        color: _mainFontColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _mainFontColor,
                    ),
                    child: Text(
                      'تایید اطلاعات ✔',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _secondColor,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 6 * _deviceBlockSize,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SelectorBox extends StatefulWidget {
  const SelectorBox({
    Key? key,
    required List<String> datas,
    required double deviceBlockSize,
    required this.packageCTRL,
  })  : _deviceBlockSize = deviceBlockSize,
        _datas = datas,
        super(key: key);

  final double _deviceBlockSize;
  final List<String> _datas;

  final TextEditingController packageCTRL;

  @override
  _SelectorBoxState createState() => _SelectorBoxState();
}

class _SelectorBoxState extends State<SelectorBox> {
  @override
  void initState() {
    widget.packageCTRL.text = widget._datas[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text(
              'پیش شماره',
              style: TextStyle(
                fontSize: 3 * widget._deviceBlockSize,
                color: Colors.grey,
                fontWeight: FontWeight.w700,
              ),
              textDirection: TextDirection.rtl,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: DropdownButtonFormField(
                style: TextStyle(
                  fontFamily: 'montserrat',
                  fontSize: 4 * widget._deviceBlockSize,
                  color: _mainFontColor,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5),
                  isDense: true,
                ),
                iconSize: 7 * widget._deviceBlockSize,
                icon: Icon(
                  Icons.expand_more,
                  color: Colors.grey,
                ),
                isExpanded: true,
                hint: Text(
                  widget.packageCTRL.text,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                isDense: true,
                items: widget._datas.map((val) {
                  return new DropdownMenuItem<String>(
                    value: val,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: deviceWidth * .2,
                          child: Text(
                            val,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (dynamic val) {
                  setState(() {
                    widget.packageCTRL.text = val;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
