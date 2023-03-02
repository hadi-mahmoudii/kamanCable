import 'package:flutter/material.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/alert_dialog.dart';
import 'new-comment.dart';

class AddCommentButton extends StatelessWidget {
  final String? id;
  final String? type;

  const AddCommentButton({Key? key, required this.id, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceWidthBlockSize = _devicewidth / 100;

    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(left: 40),
        child: CircleAvatar(
          radius: 6 * _deviceWidthBlockSize,
          backgroundColor: _mainFontColor,
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showDialog(
                context: context,
                // ignore: missing_return
                builder: (ctx) {
                  if (User.token != 'Bearer ') {
                    return AlertDialog(
                      content: Container(
                        child: NewComment(
                          id: id,
                          type: type,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(15),
                    );
                  } else {
                    return GlobalAlertDialog(
                      content: 'برای ثبت نظر به حساب خود وارد شوید',
                      title: 'خطا',
                    );
                  }
                }),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
