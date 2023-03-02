import 'package:flutter/material.dart';

import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';

class ProfileAddressAddScreen extends StatelessWidget {
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

    final String _address = '';
    // 'قم ، بلوارامین ،نبش کوچه 35 ، سمت راست ، پلاک 54 ، زنگ سمت چپ';
    return Scaffold(
      appBar: PreferredSize(
        child: SimpleAppbar('آدرس های من'),
        preferredSize: Size(double.infinity, 7 * _deviceHeightBlockSize),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SimpleHeader2('ثبت آدرس', 'NEW ADDRESS'),
            SizedBox(
              height: 20,
            ),
            SelectorBox(
              datas: ['قم', 'تهران'],
              deviceBlockSize: _deviceBlockSize,
              packageCTRL: new TextEditingController(),
              label: 'شهر',
              icon: Icons.location_on,
            ),
            SizedBox(
              height: 10,
            ),
            SelectorBox(
              datas: ['بلوارامین', 'پردیسان'],
              deviceBlockSize: _deviceBlockSize,
              packageCTRL: new TextEditingController(),
              label: 'منطقه',
              icon: Icons.location_on,
            ),
            SizedBox(
              height: 5,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                minLines: 1,
                maxLines: 5,
                initialValue: _address,
                decoration: InputDecoration(
                  icon: SizedBox(
                    width: 10,
                    height: 10,
                    child: Icon(
                      Icons.home,
                      color: Colors.grey,
                      size: 6 * _deviceBlockSize,
                    ),
                  ),
                  labelText: 'آدرس',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'iranyekan',
                    fontWeight: FontWeight.w100,
                  ),
                  isDense: true,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _mainFontColor,
                    ),
                    child: Text(
                      'تایید ✔',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 6 * _deviceBlockSize,
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
    required String label,
    required IconData icon,
    required this.packageCTRL,
  })  : _deviceBlockSize = deviceBlockSize,
        _datas = datas,
        _label = label,
        _icon = icon,
        super(key: key);

  final double _deviceBlockSize;
  final List<String> _datas;
  final String _label;
  final IconData _icon;
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
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget._label,
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
                            color: _mainFontColor,
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
                                  child: Text(
                                    val,
                                    style: TextStyle(
                                      color: _mainFontColor,
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
              ),
              SizedBox(
                width: 2 * widget._deviceBlockSize,
              ),
              Icon(
                widget._icon,
                color: Colors.grey,
                size: 6 * widget._deviceBlockSize,
              )
            ],
          ),
        ),
      ],
    );
  }
}
