import 'package:flutter/material.dart';

import '../../Models/category_products.dart';

class ProductsCategoryBox extends StatelessWidget {
  final CategoryProductsModel product;

  const ProductsCategoryBox({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return TextButton(
      // padding: EdgeInsets.all(0.1),
      onPressed: () {
        // Navigator.of(context).pushNamed(
        //   ProductsCategoryListScreen.route,
        //   arguments: [
        //     'pName',
        //     'eName',
        //     'pHeader',
        //   ],
        // );
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              size: 5 * _deviceBlockSize,
              color: _mainFontColor,
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 5 * _deviceBlockSize,
                    color: _mainFontColor,
                  ),
                  // textScaleFactor: 1.1,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  product.nameE,
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    letterSpacing: 3,
                    color: Colors.grey,
                    fontSize: 2.2 * _deviceBlockSize,
                  ),
                  // textScaleFactor: 0.6,
                ),
              ],
            ),
            // Icon(Icons.settings_input_svideo),
          ],
        ),
      ),
    );
  }
}
