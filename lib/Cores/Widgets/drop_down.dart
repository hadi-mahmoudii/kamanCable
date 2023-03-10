import 'package:flutter/material.dart';

import '../../Features/Tools/Entities/power_datas.dart';
import 'txt_field.dart';

class DropDownBox extends StatefulWidget {
  DropDownBox({
    Key? key,
    required this.label,
    required this.icon,
    required this.values,
    required this.func,
    required this.ctrl,
  }) : super(key: key);
  final String label;
  final IconData icon;
  final List<PowerObject> values;
  final Function func;
  final TextEditingController ctrl;

  @override
  _DropDownBoxState createState() => _DropDownBoxState();
}

class _DropDownBoxState extends State<DropDownBox> {
  // String _curValue;

  @override
  void initState() {
    // _curValue = widget.values[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 25),
      // height: 100,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TXTFeild(
              label: widget.label,
              textCtrl: widget.ctrl,
              icon: Icons.expand_more,
              validate: (value) {},
              readOnly: true,
              // currentFocosNode: _nameFocusNode,
              // nextFocosNode: _familyFocusNode,
              // inputAction: TextInputAction.next,
            ),
            Container(
              // color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 10),
              // width: AppSession.deviceWidth * .7,
              child: DropdownButton(
                underline: SizedBox(),
                focusColor: Colors.red,
                // icon: Padding(
                //   padding: const EdgeInsets.only(left: 10),
                //   child: Icon(Icons.expand_more),
                // ),
                iconSize: 0,
                isExpanded: true,
                // hint: Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 4),
                //   child: Text(
                //     _curValue != '' ? _curValue : widget.label,
                //     style: TextStyle(
                //       // fontWeight: FontWeight.w700,
                //       color: _curValue != '' ? Colors.black : Colors.grey,
                //       fontSize: _curValue != ''
                //           ? 4.5 * AppSession.deviceBlockSize
                //           : 4 * AppSession.deviceBlockSize,
                //     ),
                //     textDirection: TextDirection.rtl,
                //     // textScaleFactor: 0.8,
                //   ),
                // ),
                // isDense: true,
                items: widget.values.map((PowerObject powerObj) {
                  return new DropdownMenuItem<String>(
                    value: powerObj.value,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      // width: 10,
                      // height: 20,
                      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Text(
                        powerObj.value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 4 * MediaQuery.of(context).size.width / 100,
                        ),
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (dynamic val) {
                  setState(() {
                    // int index = 0;
                    // for (var i = 0; i < widget.values.length; i++) {
                    //   if (widget.values[i] == val) {
                    //     index = i;
                    //     break;
                    //   }
                    // }
                    // widget.func(index, val);
                    widget.ctrl.text = val;
                    widget.func(widget.values
                        .firstWhere((element) => element.value == val));
                    // _curValue = val;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
