import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Cores/Config/image_datas.dart';

class CategoriesGrid extends StatelessWidget {
  final List<Map<String, String>> _datas = homeCategoriesGrid;
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context);
    final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    return Padding(
      padding: const EdgeInsets.all(
        20,
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: _media.size.width - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: (_media.size.width / 3 - 20),
                  height: 55 * _pixelRatio,
                  child: DataBox(_datas[0], 0),
                ),
                Container(
                  width: (_media.size.width / 3 - 20),
                  height: 55 * _pixelRatio,
                  child: DataBox(_datas[1], 1),
                ),
                Container(
                  width: (_media.size.width / 3 - 20),
                  height: 55 * _pixelRatio,
                  child: DataBox(_datas[2], 2),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4 * _pixelRatio,
          ),
          Container(
            width: _media.size.width - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: (_media.size.width / 3 - 20),
                  height: 55 * _pixelRatio,
                  child: DataBox(_datas[3], 3),
                ),
                Container(
                  width: (_media.size.width / 3 - 20),
                  height: 55 * _pixelRatio,
                  child: DataBox(_datas[4], 4),
                ),
                Container(
                  width: (_media.size.width / 3 - 20),
                  height: 55 * _pixelRatio,
                  child: DataBox(_datas[5], 5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataBox extends StatelessWidget {
  final Map<String, String> _datas;
  final int _index;
  DataBox(this._datas, this._index);
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainColor = _theme.primaryColor;
    final Color _secondColor = _theme.accentColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    var _itemPersianNAme = _datas['pname']!;
    var _itemEnglishName = _datas['ename']!;
    var _itemImage = this._datas['image']!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _index % 2 == 1 ? Colors.white : _mainColor,
        border: Border.all(
          color: _mainColor,
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SvgPicture.asset(
              _itemImage,
              height: 18 * _deviceBlockSize,
              width: 18 * _deviceBlockSize,
              color: _index % 2 == 1 ? _mainColor : _secondColor,
            ),
          ),
          Text(
            _itemPersianNAme,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 4 * _deviceBlockSize,
              color: _index % 2 == 1 ? _mainColor : _secondColor,
            ),
          ),
          Text(
            _itemEnglishName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'montserrat',
              color: _index % 2 == 1 ? _mainColor : _secondColor,
              letterSpacing: 2,
              fontSize: 2 * _deviceBlockSize,
            ),
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }
}
