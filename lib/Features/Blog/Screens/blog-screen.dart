import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/five_navigation_button.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../Providers/blog_provider.dart';
import '../Widgets/Main/blog-header.dart';
import '../Widgets/Main/blog_overview_row.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  bool isInit = true;
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);
  int _curPage = 1;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      var blogProviderObject = Provider.of<BlogProvider>(context);
      await blogProviderObject.getItems(false);
      _curPage += 1;
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    var themeData = _theme.textTheme;

    // var blogProvider = Provider.of<BlogProvider>(context, listen: false);
    // blogProvider.getItems();
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double _deviceWidthBlockSize = _devicewidth / 100;
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: PreferredSize(
        child: SimpleAppbar('بازگشت'),
        preferredSize: Size(double.infinity, 40),
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              bottom: 5,
            ),
            child: Consumer<BlogProvider>(
              builder: (ctx, blogProvider, _) => blogProvider.isLoading
                  ? LoadingWidget(mainFontColor: _mainFontColor)
                  : RefreshIndicator(
                      child: blogProvider.items.length != 0
                          ? SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  BlogHeader(),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (ctx, index) =>
                                        BlogOverviewRow(
                                      blog: blogProvider.items[index],
                                      themeData: themeData,
                                    ),
                                    // FeedOverview(
                                    //   items: blogProvider.items[index],
                                    // ),
                                    itemCount: blogProvider.items.length,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text('خبری یافت نشد'),
                            ),
                      onRefresh: () {
                        return blogProvider.getItems(
                          false,
                          page: _curPage,
                          reset: true,
                        );
                      },
                    ),
            )),
      ),
      bottomNavigationBar: FiveNavigationButton(
        curIndex: 1,
        mainFontColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

// class ItemBox extends StatelessWidget {
//   const ItemBox({
//     Key key,
//     @required double pixelRatio,
//   })  : _pixelRatio = pixelRatio,
//         super(key: key);

//   final double _pixelRatio;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: _pixelRatio),
//       decoration: BoxDecoration(
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.black12,
//         //     blurRadius: 20.0,
//         //     offset: Offset(
//         //       0.0,
//         //       10,
//         //     ),
//         //   )
//         // ],
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: FeedOverview(),
//     );
//   }
// }
