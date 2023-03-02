import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/routes.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../Providers/comment_provider.dart';

class NewComment extends StatefulWidget {
  final String? id;
  final String? type;
  const NewComment({Key? key, required this.id, required this.type})
      : super(key: key);
  @override
  _NewCommentState createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  final TextEditingController _messageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color mainFontColor = theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _pixelRatio =
        (_media.size.height / _media.size.width * 7 / 5).roundToDouble();
    return Consumer<CommentProvider>(
        builder: (ctx, commentProvider, _) => commentProvider.isLoading
            ? SizedBox(
                height: 100,
                child: LoadingWidget(mainFontColor: mainFontColor),
              )
            : Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    NewCommentHeader(),
                    SizedBox(height: 8.5 * _pixelRatio),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.comment),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                          // hintText: 'متن کامنت',
                          labelText: 'متن کامنت',
                          // border: InputBorder.none,
                          labelStyle: TextStyle(
                            fontSize: 6.5 * _pixelRatio,
                          ),
                          isDense: true,
                          // alignLabelWithHint: false,
                        ),
                        style: TextStyle(
                          fontSize: 7.5 * _pixelRatio,
                        ),
                        textDirection: TextDirection.rtl,
                        minLines: 1,
                        maxLines: 5,
                        controller: _messageController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      height: 5 * _pixelRatio,
                    ),
                    InkWell(
                      onTap: () async {
                        await Provider.of<CommentProvider>(context,
                                listen: false)
                            .sendComment(widget.id, widget.type,
                                _messageController.text);
                        Navigator.of(context).pop();
                        Navigator.of(context).popAndPushNamed(
                          Routes.commentScreen,
                          arguments: {'id': widget.id, 'type': widget.type},
                        );
                      },
                      child: Container(
                        width: 50 * _pixelRatio,
                        height: 12.5 * _pixelRatio,
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
                              'ثبت کامنت',
                              style: TextStyle(
                                fontSize: 5.5,
                              ),
                              textScaleFactor: _pixelRatio,
                            ),
                            Icon(
                              Icons.add,
                              size: 7 * _pixelRatio,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}

class NewCommentHeader extends StatelessWidget {
  const NewCommentHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.add,
              size: 30,
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  'ثبــــت کامـــــــــنت',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  'NEW COMMENT',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    letterSpacing: 3,
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
