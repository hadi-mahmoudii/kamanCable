import 'package:flutter/material.dart';

class ProductItemColorPicker extends StatefulWidget {
  final double? deviceBlockSize;

  const ProductItemColorPicker({Key? key, this.deviceBlockSize})
      : super(key: key);

  @override
  _ProductItemColorPickerState createState() => _ProductItemColorPickerState();
}

class _ProductItemColorPickerState extends State<ProductItemColorPicker> {
  List<Map<String, Object>> colorsList = [
    {
      'maincolor': Colors.red,
      'name': 'قرمز',
    },
    {
      'maincolor': Color.fromRGBO(0, 0, 60, 1),
      'name': 'سورمه ای',
    },
    {
      'maincolor': Colors.blueAccent,
      'name': 'آبی',
    },
    {
      'maincolor': Colors.black,
      'name': 'مشکی',
    },
  ];
  var _curColorIndex = 1;
  @override
  Widget build(BuildContext context) {
    // final ThemeData _theme = Theme.of(context);
    // final Color _mainFontColor = _theme.textSelectionColor;
    final _media = MediaQuery.of(context);
    final double _deviceWidth = _media.size.width;
    final double _deviceWidthBlockSize = _deviceWidth / 100;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 3 * _deviceWidthBlockSize),
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.black12,
                ),
              ),
            ),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _curColorIndex = 1;
                    });
                  },
                  child: ColorRow(
                    mainColor: Color.fromRGBO(0x1B, 0x27, 0x49, 1),
                    title: 'سورمه ای',
                    price: '13000',
                    isSelected: _curColorIndex == 1 ? true : false,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _curColorIndex = 2;
                    });
                  },
                  child: ColorRow(
                    mainColor: Colors.red,
                    title: 'قرمز',
                    price: '12000',
                    isSelected: _curColorIndex == 2 ? true : false,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _curColorIndex = 3;
                    });
                  },
                  child: ColorRow(
                    mainColor: Colors.orange,
                    title: 'نارنجی',
                    price: '11000',
                    isSelected: _curColorIndex == 3 ? true : false,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _curColorIndex = 4;
                    });
                  },
                  child: ColorRow(
                    mainColor: Color.fromRGBO(0, 200, 190, 1),
                    title: 'سبز',
                    price: '15000',
                    isSelected: _curColorIndex == 4 ? true : false,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'رنگ',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 6 * _deviceWidthBlockSize,
                  ),
                ),
                Text(
                  'Color',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontSize: 3 * _deviceWidthBlockSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorRow extends StatelessWidget {
  final Color _mainColor;
  final String _title;
  final String _price;
  final bool _isSelected;
  const ColorRow({
    Key? key,
    required Color mainColor,
    required String title,
    required String price,
    required bool isSelected,
  })  : _mainColor = mainColor,
        _title = title,
        _price = price,
        _isSelected = isSelected,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    final double _deviceWidth = _media.size.width;
    final double _deviceWidthBlockSize = _deviceWidth / 100;

    return Card(
      color: _isSelected ? _mainColor : Colors.white,
      elevation: .5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'تومان',
              style: TextStyle(
                color: _isSelected ? Colors.white : _mainColor,
                fontSize: 3 * _deviceWidthBlockSize,
              ),
            ),
            Text(
              _price,
              style: TextStyle(
                color: _isSelected ? Colors.white : _mainColor,
                fontWeight: FontWeight.w700,
                fontFamily: 'montserrat',
              ),
            ),
            Spacer(),
            Text(
              _title,
              style: TextStyle(
                color: _isSelected ? Colors.white : _mainColor,
                fontSize: 3.5 * _deviceWidthBlockSize,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isSelected ? Colors.white : _mainColor),
              width: 15,
              child: Text(' '),
            )
          ],
        ),
      ),
    );
  }
}
