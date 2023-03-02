import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterDropDownBox extends StatefulWidget {
  FilterDropDownBox({
    Key? key,
    required this.values,
  }) : super(key: key);

  final List<String> values;

  @override
  _FilterDropDownBoxState createState() => _FilterDropDownBoxState();
}

class _FilterDropDownBoxState extends State<FilterDropDownBox> {
  String? _curValue;
  TextEditingController minPrice = new TextEditingController();
  TextEditingController maxPrice = new TextEditingController();
  late Timer timer;
  @override
  void initState() {
    _curValue = widget.values[0];
    minPrice.text = '176000';
    maxPrice.text = '1276000';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(right: 7 * _deviceBlockSize),
          child: Text(
            'دسته بندی',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 2.5 * _deviceBlockSize,
            ),
            textDirection: TextDirection.rtl,
            // textScaleFactor: 0.8,
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.format_align_right,
                  size: 3.5 * _deviceBlockSize,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: _deviceBlockSize,
              ),
              Expanded(
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
                        child: Text(
                          value,
                          style: TextStyle(
                            color: _mainFontColor,
                            fontSize: 4 * _deviceBlockSize,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (dynamic val) {
                    setState(() {
                      _curValue = val;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      'تومان',
                      style: TextStyle(
                        fontSize: 3 * _deviceBlockSize,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 1),
                      width: 28 * _deviceBlockSize,
                      child: TextField(
                        enabled: false,
                        controller: maxPrice,
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          color: _mainFontColor,
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.number,
                        // showCursor: false,
                        decoration: InputDecoration(
                          labelText: 'حداکثر قیمت ',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 3 * _deviceBlockSize,
                          ),
                          contentPadding: EdgeInsets.all(1),
                          isDense: true,
                          // hasFloatingPlaceholder: false,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(240, 240, 240, 1),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(240, 240, 240, 1),
                            ),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(240, 240, 240, 1),
                            ),
                          ),
                        ),
                        // showCursor: false,
                        // maxLengthEnforced: false,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.expand_more,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                        int valu = int.parse(maxPrice.text);
                        if (valu > 999) {
                          valu -= 1000;
                          maxPrice.text = valu.toString();
                        }
                      });
                    },
                    onTapDown: (_) {
                      timer = Timer.periodic(Duration(milliseconds: 50), (t) {
                        setState(() {
                          int valu = int.parse(maxPrice.text);
                          if (valu > 999) {
                            valu -= 1000;
                            maxPrice.text = valu.toString();
                          }
                        });
                      });
                    },
                    onTapCancel: () {
                      timer.cancel();
                    },
                    onTapUp: (_) {
                      timer.cancel();
                    },
                  ),
                ],
              ),
              // SizedBox(width: 4 * _deviceBlockSize,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 240, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      'تومان',
                      style: TextStyle(
                        fontSize: 3 * _deviceBlockSize,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 1),
                      width: 28 * _deviceBlockSize,
                      child: TextField(
                        enabled: false,
                        controller: minPrice,
                        style: TextStyle(
                          fontFamily: 'montserrat',
                          color: _mainFontColor,
                        ),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          labelText: 'حداقل قیمت ',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 3 * _deviceBlockSize,
                          ),
                          contentPadding: EdgeInsets.all(1),
                          isDense: true,
                          // hasFloatingPlaceholder: false,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(240, 240, 240, 1),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(240, 240, 240, 1),
                            ),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(240, 240, 240, 1),
                            ),
                          ),
                        ),
                        // showCursor: false,
                        // maxLengthEnforced: false,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.expand_less,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                        int valu = int.parse(minPrice.text);
                        valu += 1000;
                        minPrice.text = valu.toString();
                      });
                    },
                    onTapDown: (_) {
                      timer = Timer.periodic(Duration(milliseconds: 50), (t) {
                        setState(() {
                          int valu = int.parse(minPrice.text);
                          valu += 1000;
                          minPrice.text = valu.toString();
                        });
                      });
                    },
                    onTapCancel: () {
                      timer.cancel();
                    },
                    onTapUp: (_) {
                      timer.cancel();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          height: 3,
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 33 * _deviceBlockSize,
          height: 8 * _deviceBlockSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Row(
            children: <Widget>[
              Spacer(),
              Text(
                'فیلتر محصولات',
                style: TextStyle(
                  fontSize: 3 * _deviceBlockSize,
                ),
              ),
              SizedBox(
                width: _deviceBlockSize,
              ),
              Icon(
                FontAwesomeIcons.filter,
                size: 3 * _deviceBlockSize,
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
