import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Cores/Config/routes.dart';

class NewPageNavigator extends StatelessWidget {
  final String? title;
  // final String subtitle;
  final String? boxIcon;
  final datas;
  final String commentType;

  const NewPageNavigator({
    Key? key,
    this.title,
    // this.subtitle,
    this.boxIcon,
    this.datas,
    this.commentType = 'product',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _pixelRatio =
        (_media.size.height / _media.size.width * 7 / 5).roundToDouble();
    final double _devicewidth = _media.size.width;
    final double _deviceBlockSize = _devicewidth / 100;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2 * _pixelRatio),
      margin: EdgeInsets.only(top: 10),
      child: TextButton(
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () => boxIcon == 'comments'
            ? Navigator.of(context).pushNamed(
                Routes.commentScreen,
                arguments: {
                  'id': datas,
                  'type': commentType,
                },
              )
            : Navigator.of(context).pushNamed(
                Routes.productItemDetailsScreen,
                arguments: datas,
              ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 5 * _deviceBlockSize,
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  title!,
                  style: TextStyle(fontSize: 5.5, color: _mainFontColor),
                  textScaleFactor: _pixelRatio,
                  textDirection: TextDirection.rtl,
                ),
                // Text(
                //   subtitle,
                //   style: TextStyle(
                //     fontFamily: 'iranyekan',
                //     fontSize: 5,
                //     color: Colors.grey,
                //   ),
                //   textScaleFactor: _pixelRatio,
                //   textDirection: TextDirection.rtl,
                // ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: boxIcon == 'comments'
                  ? SvgPicture.asset(
                      'assets/Icons/comment.svg',
                      height: 5.5 * _deviceBlockSize,
                      width: 5.5 * _deviceBlockSize,
                      color: Colors.grey,
                    )
                  : Icon(
                      Icons.info,
                      size: 5.5 * _deviceBlockSize,
                      color: Colors.grey,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
