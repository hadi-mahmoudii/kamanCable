import 'package:flutter/material.dart';

import '../../../../Cores/Config/user.dart';
import '../../Entities/awg_to_mil_datas.dart';
import 'awg_bottom_selector.dart';

class AWGToMiliValueSelector extends StatefulWidget {
  const AWGToMiliValueSelector({
    Key? key,
    // @required double deviceBlockSize,
    // @required double deviceWidth,
    required this.packageCTRL,
  }) :
        // User.deviceBlockSize = deviceBlockSize,
        //       User.deviceWidth = deviceWidth,
        super(key: key);

  // final double User.deviceBlockSize;
  // final double User.deviceWidth;

  final TextEditingController packageCTRL;

  @override
  _AWGToMiliValueSelectorState createState() => _AWGToMiliValueSelectorState();
}

class _AWGToMiliValueSelectorState extends State<AWGToMiliValueSelector> {
  List<String>? datas = [];
  @override
  void initState() {
    datas = awgDatas[0]['1'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themedata = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      // height: 65,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Container(
            child: AWGBottomSelector(
              color: Theme.of(context).primaryColor,
              icon: null,
              label: 'اندازه نمایی آمریکایی سیم را انتخاب کنید',
              controller: widget.packageCTRL,
              function: (list) {
                setState(() {
                  datas = list;
                });
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              color: themedata.primaryColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'اطلاعات تبدیلی',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white38,
                    fontWeight: FontWeight.w700,
                    fontSize: 4.6 * User.deviceBlockSize,
                  ),
                ),
                Text(
                  'CONVERTED DATA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white38,
                    fontFamily: 'montserrat',
                    fontSize: 3 * User.deviceBlockSize,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5 * User.deviceBlockSize,
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Divider(
                    color: Colors.white,
                    height: 4,
                  ),
                ),
                AWGToMilConvertedDataRow(
                  // deviceBlockSize: widget.User.deviceBlockSize,
                  // devicewidth: widget.User.deviceWidth,
                  title: 'AWG',
                  value: widget.packageCTRL.text,
                  type: '',
                  backgroundColor: Color.fromRGBO(0x1B, 55, 95, 1),
                ),
                AWGToMilConvertedDataRow(
                  // deviceBlockSize: widget.User.deviceBlockSize,
                  // devicewidth: widget.User.deviceWidth,
                  title: 'Diameter',
                  value: datas![0],
                  type: ' mm',
                ),
                AWGToMilConvertedDataRow(
                  // deviceBlockSize: widget.User.deviceBlockSize,
                  // devicewidth: widget.User.deviceWidth,
                  title: 'Diameter',
                  value: datas![1],
                  type: ' inch',
                  backgroundColor: Color.fromRGBO(0x1B, 55, 95, 1),
                ),
                AWGToMilConvertedDataRow(
                  // deviceBlockSize: widget.User.deviceBlockSize,
                  // devicewidth: widget.User.deviceWidth,
                  title: 'Cross Section',
                  value: datas![2],
                  type: ' mm²',
                ),
                AWGToMilConvertedDataRow(
                  // deviceBlockSize: widget.User.deviceBlockSize,
                  // devicewidth: widget.User.deviceWidth,
                  title: 'Available Cable Size',
                  value: datas![3],
                  type: ' mm²',
                  backgroundColor: Color.fromRGBO(0x1B, 55, 95, 1),
                ),
                AWGToMilConvertedDataRow(
                  // deviceBlockSize: widget.User.deviceBlockSize,
                  // devicewidth: widget.User.deviceWidth,
                  title: 'Resistance',
                  value: datas![4],
                  type: datas![5],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AWGToMilConvertedDataRow extends StatelessWidget {
  const AWGToMilConvertedDataRow({
    Key? key,
    // @required double deviceBlockSize,
    // @required double devicewidth,
    required String title,
    required String value,
    required String type,
    Color? backgroundColor,
  })  :
        //  User.deviceBlockSize = deviceBlockSize,
        //       User.deviceWidth = devicewidth,
        _backgroundColor = backgroundColor,
        _title = title,
        _value = value,
        _type = type,
        super(key: key);

  // final double User.deviceBlockSize;
  // final double User.deviceWidth;
  final String _title;
  final String _value;
  final String _type;

  final Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 4 * User.deviceBlockSize,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: User.deviceWidth / 2 - 30,
            child: Text(
              _title,
              style: TextStyle(
                fontFamily: 'montserrat',
                color: Colors.white,
                fontSize: 3.5 * User.deviceBlockSize,
              ),
            ),
          ),
          Expanded(
            // width: User.deviceWidth / 2 - 50,
            child: RichText(
              text: TextSpan(
                text: _value,
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontFamily: 'montserrat'),
                children: <TextSpan>[
                  TextSpan(
                    text: ' $_type',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontFamily: 'montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
