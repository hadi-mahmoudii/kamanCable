import 'package:flutter/material.dart';

class ProductItemGuaranteeItem extends StatefulWidget {
  final double? deviceBlockSize;

  const ProductItemGuaranteeItem({Key? key, this.deviceBlockSize})
      : super(key: key);

  @override
  _ProductItemGuaranteeItemState createState() =>
      _ProductItemGuaranteeItemState();
}

class _ProductItemGuaranteeItemState extends State<ProductItemGuaranteeItem> {
  var _curGuaranteeIndex = 1;
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainColor = _theme.primaryColor;
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
                      _curGuaranteeIndex = 1;
                    });
                  },
                  child: GuaranteeRow(
                    mainColor: _mainColor,
                    title: 'بدون گارانتی',
                    number: '1',
                    isSelected: _curGuaranteeIndex == 1 ? true : false,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _curGuaranteeIndex = 2;
                    });
                  },
                  child: GuaranteeRow(
                    mainColor: _mainColor,
                    title: 'گارانتی همراه سرویس',
                    number: '2',
                    isSelected: _curGuaranteeIndex == 2 ? true : false,
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
                  'گارانتی',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 6 * _deviceWidthBlockSize,
                  ),
                ),
                Text(
                  'Guarantee',
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

class GuaranteeRow extends StatelessWidget {
  final Color _mainColor;
  final String _title;
  final String _number;

  final bool _isSelected;
  const GuaranteeRow({
    Key? key,
    required Color mainColor,
    required String title,
    required String number,
    required bool isSelected,
  })  : _mainColor = mainColor,
        _title = title,
        _number = number,
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
              ' ',
            ),
            Spacer(),
            Text(
              _title,
              style: TextStyle(
                color: _isSelected ? Colors.white : _mainColor,
                fontSize: 3.5 * _deviceWidthBlockSize,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '.$_number',
              style: TextStyle(
                fontFamily: 'montserrat',
                color: _isSelected ? Colors.white : _mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
