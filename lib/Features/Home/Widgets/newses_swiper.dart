import 'package:flutter/material.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/user.dart';
import '../../Blog/Providers/blog_provider.dart';
import '../../Blog/Widgets/Main/blog_overview_row.dart';

class NewsesSwiper extends StatefulWidget {
  const NewsesSwiper({
    Key? key,
    // @required this.controller,
    // @required this.datas,
  }) : super(key: key);

  // final ScrollController controller;
  // final datas;

  @override
  _NewsesSwiperState createState() => _NewsesSwiperState();
}

class _NewsesSwiperState extends State<NewsesSwiper> {
  // int _ind = 0;
  bool isInit = true;
  ScrollController swpcontroller = new ScrollController();
  @override
  void didChangeDependencies() async {
    if (isInit) {
      var blogProvider = Provider.of<BlogProvider>(context);
      await blogProvider.getItems(false, page: 1);
      setState(() {
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;

    return isInit
        ? Center(child: LoadingWidget(mainFontColor: mainFontColor))
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Stack(
              children: [
                Container(
                  // width: User.deviceWidth - 50,
                  height: 140,
                  child: Consumer<BlogProvider>(
                    builder: (ctx, blogItems, _) => blogItems.items.length != 0
                        ? ListView.separated(
                            controller: swpcontroller,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            // physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, ind) => Container(
                              width: MediaQuery.of(context).size.width - 40,
                              // height: 200,
                              child: BlogOverviewRow(
                                blog: blogItems.items[ind],
                                themeData: themeData,
                              ),
                            ),
                            separatorBuilder: (ctx, ind) => SizedBox(
                              width: 3 * User.deviceBlockSize,
                            ),
                            itemCount: blogItems.items.length,
                          )
                        : Container(),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: User.deviceBlockSize * 17,
                  child: InkWell(
                    onTap: () {
                      swpcontroller.animateTo(
                        swpcontroller.position.pixels +
                            User.deviceWidth * 0.98 +
                            6 * User.deviceBlockSize -
                            40,
                        duration: Duration(seconds: 1),
                        curve: Curves.linearToEaseOut,
                      );
                    },
                    child: Card(
                      child: Icon(
                        Icons.chevron_right,
                        size: 7.5 * User.deviceBlockSize,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: User.deviceBlockSize * 17,
                  child: InkWell(
                    onTap: () {
                      swpcontroller.animateTo(
                        swpcontroller.position.pixels -
                            User.deviceWidth * 0.98 -
                            6 * User.deviceBlockSize +
                            40,
                        duration: Duration(seconds: 1),
                        curve: Curves.linearToEaseOut,
                      );
                    },
                    child: Card(
                      child: Icon(
                        Icons.chevron_left,
                        size: 7.5 * User.deviceBlockSize,
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }
}
