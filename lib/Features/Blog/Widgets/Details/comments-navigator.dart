import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Cores/Config/routes.dart';
import '../../../../Cores/Config/user.dart';

class CommentsNavigator extends StatelessWidget {
  final String commentsCount;
  final String id;
  final String type;

  const CommentsNavigator({
    Key? key,
    required this.commentsCount,
    required this.id,
    required this.type,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceWidthBlockSize = _devicewidth / 100;
    var _newsCommentsCount = commentsCount;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidthBlockSize),
      margin: EdgeInsets.only(bottom: 10),
      child: TextButton(
        onPressed: () {
          // var blogProviderObject = Provider.of<BlogProvider>(context);
          if (User.token == 'Bearer ') {
            showDialog(
              context: context,
              builder: (
                ctx,
              ) =>
                  AlertDialog(
                content: Text(
                  'برای مشاهده کامنت ها به آیدی خود وارد شوید.',
                  textDirection: TextDirection.rtl,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text('Ok'),
                  )
                ],
              ),
            );
          } else {
            Navigator.of(context).pushNamed(
              Routes.commentScreen,
              arguments: {'id': id, 'type': type},
            );
          }
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 6 * _deviceWidthBlockSize,
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'نظرات کاربران',
                  style: TextStyle(
                      fontSize: 3.5 * _deviceWidthBlockSize,
                      color: _mainFontColor),
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  '$_newsCommentsCount نظر ',
                  style: TextStyle(
                    fontFamily: 'iranyekan',
                    fontSize: 3 * _deviceWidthBlockSize,
                    color: Colors.grey,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                'assets/Icons/comment.svg',
                height: 7 * _deviceWidthBlockSize,
                width: 7 * _deviceWidthBlockSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
