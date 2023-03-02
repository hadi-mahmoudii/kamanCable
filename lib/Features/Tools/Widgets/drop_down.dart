import 'package:flutter/material.dart';

import '../../../Cores/Widgets/txt_field.dart';

class DropDownBox2 extends StatefulWidget {
  DropDownBox2({
    Key? key,
    required this.label,
    required this.icon,
    required this.values,
    required this.func,
    required this.ctrl,
    this.fontFamily = 'iranyekan',
    this.textAlign = TextAlign.right,
  }) : super(key: key);
  final String label;
  final IconData icon;
  final Map<String, String> values;
  final Function func;
  final TextEditingController ctrl;
  final String fontFamily;
  final TextAlign textAlign;

  @override
  _DropDownBox2State createState() => _DropDownBox2State();
}

class _DropDownBox2State extends State<DropDownBox2> {
  @override
  void initState() {
    super.initState();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    index = 0;
    return Container(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: <Widget>[
            TXTFeild(
              label: widget.label,
              textCtrl: widget.ctrl,
              icon: Icons.expand_more,
              validate: (value) {},
              readOnly: true,
              fontFamily: 'montserrat',
              marginRight: 0,
              marginLeft: 0,
              textAlign: widget.textAlign,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                // color: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: DropdownButton(
                  underline: SizedBox(),
                  focusColor: Colors.red,
                  iconSize: 0,
                  isExpanded: true,
                  items: widget.values.keys.map((String key) {
                    index += 1;
                    return new DropdownMenuItem<String>(
                      value: key,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '$index. $key',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    4 * MediaQuery.of(context).size.width / 100,
                                fontFamily: widget.fontFamily,
                              ),
                              textDirection: TextDirection.ltr,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (dynamic key) {
                    setState(() {
                      widget.ctrl.text = key;
                      widget.func(key, widget.values[key]);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
