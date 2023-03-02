import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';
import '../../Products/Widgets/ItemScreen/new-page-navigator.dart';
import '../Entities/blog_item.dart';
import '../Providers/blog_provider.dart';
import '../Widgets/Details/blog-details-box.dart';
import '../Widgets/Details/heart-header.dart';

class BlogDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    String? id = ModalRoute.of(context)!.settings.arguments as String?;
    BlogItem items =
        Provider.of<BlogProvider>(context, listen: false).getSingleItem(id);
    // final _media = MediaQuery.of(context);
    // final double _deviceHeight = _media.size.height;
    // final double _deviceHeightBlockSize = _deviceHeight / 100;
    // final double _devicewidth = _media.size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: PreferredSize(
        child: SimpleAppbar('بازگشت'),
        preferredSize: Size(double.infinity, 40),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 0.3,
              right: 0.3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                HeartHeader(),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  // padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BlogDetailsBox(
                    items: items,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 40),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Html(
                      shrinkWrap: true,
                      data: items.content,
                      onLinkTap: (site, _, __, ___) async {
                        await launch(site!);
                      },
                      // onLinkTap: (link) async {
                      //   await launch(link);
                      // },
                      // style: {
                      //   'p': Style(
                      //     color: Colors.black,
                      //     // direction: TextDirection.rtl,
                      //     textAlign: TextAlign.end,
                      //   ),
                      // },
                    ),
                  ),
                ),
                // CommentsNavigator(
                //   commentsCount: items.commentsCount,
                //   id: items.id,
                //   type: 'article',
                // ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: NewPageNavigator(
                    title: 'نظرات کاربران',
                    // subtitle: 'نظر 2',
                    boxIcon: 'comments',
                    datas: items.id,
                    commentType: 'article',
                  ),
                ),
                Divider(height: 20, color: Colors.grey),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 20),
                //   child: SimpleHeader2('جدیدترین اخبار', 'LATEST NEWS'),
                // ),
                // HomeNewsSwiper(),
                SizedBox(
                  height: 50,
                ),
                // NewsSwiper(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
