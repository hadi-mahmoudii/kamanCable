import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../Providers/comment_provider.dart';
import '../Widgets/add-comment-button.dart';
import '../Widgets/comment-box.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  bool isInit = true;
  Map<String, dynamic>? args;
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);
  // int _curPage = 1;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      var commentProviderObject =
          Provider.of<CommentProvider>(context, listen: false);
      await commentProviderObject.getItems(args!['id'], args!['type'], false);
      // _curPage += 1;
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _deviceHeight = _media.size.height;
    final double _deviceHeightBlockSize = _deviceHeight / 100;
    return Scaffold(
      appBar: PreferredSize(
        child: SimpleAppbar('بازگشت'),
        preferredSize: Size(double.infinity, 5 * _deviceHeightBlockSize),
      ),
      body: Consumer<CommentProvider>(
        builder: (ctx, commentProvider, _) => commentProvider.isLoading
            ? LoadingWidget(mainFontColor: _mainFontColor)
            : RefreshIndicator(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      children: <Widget>[
                        // CommentsScreen(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) => Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: CommentBox(commentProvider.items[index]),
                          ),
                          itemCount: commentProvider.items.length,
                        )
                      ],
                    ),
                  ),
                ),
                onRefresh: () {
                  return commentProvider.getItems(
                      args!['id'], args!['type'], true);
                },
              ),
      ),
      floatingActionButton: AddCommentButton(
        id: args!['id'],
        type: args!['type'],
      ),
    );
  }
}
