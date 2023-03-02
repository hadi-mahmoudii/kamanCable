import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../Widgets/Filter/filter-blog-box.dart';
import '../Widgets/Filter/filter-blog-header.dart';

class FilterBlogScreen extends StatelessWidget {
  static const route = '/FilterBlogScreen';
  @override
  Widget build(BuildContext context) {
    // final _media = MediaQuery.of(context);
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        appBar: PreferredSize(
          child: SimpleAppbar('خبر ها'),
          preferredSize: Size(double.infinity, 1 / 20 * User.deviceHeigth),
        ),
        body: Column(
          children: <Widget>[
            FilterBlogHeader(),
            FilterBlogBox(),
          ],
        ),
      ),
    );
  }
}
