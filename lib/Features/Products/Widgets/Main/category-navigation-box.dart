import 'package:flutter/material.dart';

import '../../../../Cores/Config/routes.dart';
import '../../../../Cores/Config/user.dart';
import '../../Models/category.dart';

class CategoryNavigationBox extends StatelessWidget {
  final CategoryModel category;

  const CategoryNavigationBox({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return TextButton(
      onPressed: () {
        if (category.count != '0')
          Navigator.of(context)
              .pushNamed(Routes.categoryScreen, arguments: category);
        else
          Navigator.of(context)
              .pushNamed(Routes.categoryProductsScreen, arguments: category);
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              size: 5 * _deviceBlockSize,
              color: _mainFontColor,
            ),
            // category.count != '0'
            //     ? Container(
            //         margin: EdgeInsets.only(left: 10),
            //         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //         decoration: BoxDecoration(
            //           color: Colors.black12,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Column(
            //           children: <Widget>[
            //             Text(
            //               category.count,
            //               style: TextStyle(
            //                 fontFamily: 'montserrat',
            //                 fontWeight: FontWeight.w700,
            //                 color: Colors.black54,
            //               ),
            //               // textScaleFactor: 0.8,
            //             ),
            //             Text(
            //               'آیتم',
            //               style: TextStyle(
            //                   color: Colors.grey,
            //                   fontSize: 2.3 * _deviceBlockSize),
            //               // textScaleFactor: 0.7,
            //             ),
            //           ],
            //         ),
            //       )
            //     : Container(),
            Spacer(),
            Container(
              width: User.deviceWidth * .7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    category.name,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 5 * _deviceBlockSize,
                      color: _mainFontColor,
                    ),
                    // textScaleFactor: 1.1,
                  ),
                  Text(
                    category.nameE,
                    textDirection: TextDirection.rtl,
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
            ),
            SizedBox(width: 5),
            Image.network(
              category.image!,
              height: 25,
              width: 25,
            ),
            // Icon(Icons.settings_input_svideo),
          ],
        ),
      ),
    );
  }
}
