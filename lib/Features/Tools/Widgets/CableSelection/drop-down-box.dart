import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropDownBox extends StatefulWidget {
  DropDownBox({
    Key? key,
    required this.values,
    required this.func,
  }) : super(key: key);

  final List<String> values;
  final Function func;

  @override
  _DropDownBoxState createState() => _DropDownBoxState();
}

class _DropDownBoxState extends State<DropDownBox> {
  String? _curValue;

  @override
  void initState() {
    _curValue = widget.values[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _curValue = widget.values[0];
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 1),
        width: double.infinity,
        child: DropdownButton(
          focusColor: Colors.red,
          icon: Icon(FontAwesomeIcons.angleDown),
          isExpanded: true,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              _curValue!,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: _mainFontColor,
                fontSize: 3.5 * _deviceBlockSize,
              ),
              // textScaleFactor: 0.8,
            ),
          ),
          isDense: true,
          items: widget.values.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: Container(
                // width: 10,
                // height: 20,
                // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      value,
                      style: TextStyle(
                        color: _mainFontColor,
                        fontSize: 4 * _deviceBlockSize,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          onChanged: (dynamic val) {
            setState(() {
              int index = 0;
              for (var i = 0; i < widget.values.length; i++) {
                if (widget.values[i] == val) {
                  index = i;
                  break;
                }
              }
              widget.func(index,val);
              _curValue = val;
            });
          },
        ),
      ),
    );
  }
}
