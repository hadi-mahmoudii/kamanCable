import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Cores/Config/user.dart';
import '../../Entities/blog_item.dart';

class BlogDetailsBox extends StatelessWidget {
  final BlogItem items;

  const BlogDetailsBox({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    // final _media = MediaQuery.of(context);
    // final double _pixelRatio =
    // (_media.size.height / _media.size.width * 7 / 5).roundToDouble();
    // final double _devicewidth = _media.size.width;
    // final double User.deviceBlockSize = _devicewidth / 100;
    var _newsImage = items.thumbnail;
    var _newsTitle = items.title;
    var _newsWriter = items.user;
    // print(_newsWriter);
    var _newsDate = items.createdAt;
    // var _newsContent = items.content;
    // 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.';
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 55 * User.deviceBlockSize,
            margin: EdgeInsets.symmetric(
              vertical: 3 * User.deviceBlockSize,
              horizontal: 20,
            ),
            padding: EdgeInsets.only(top: 6, left: 8, bottom: 5, right: 5),
            decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: Colors.grey),
            ),
            child: Image.network(
              _newsImage,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    _newsTitle,
                    style: TextStyle(
                      fontSize: 7 * User.deviceBlockSize,
                      fontWeight: FontWeight.w700,
                      color: _mainFontColor,
                    ),
                    // textScaleFactor: _pixelRatio,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  height: 3,
                ),
                SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            _newsWriter != ' '
                                ? Container(
                                    child: Text(
                                      _newsWriter,
                                      style: TextStyle(
                                        fontSize: 3 * User.deviceBlockSize,
                                        color: _mainFontColor.withOpacity(.4),
                                      ),
                                      // textScaleFactor: _pixelRatio,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  )
                                : Container(),
                            _newsWriter != ' '
                                ? Icon(
                                    Icons.person,
                                    size: 2.5 * User.deviceBlockSize,
                                    color: _mainFontColor.withOpacity(.4),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        // width: 80,
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                _newsDate,
                                style: TextStyle(
                                  fontSize: 3 * User.deviceBlockSize,
                                  color: _mainFontColor.withOpacity(.4),
                                ),
                                // textScaleFactor: _pixelRatio,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.right,
                                // textDirection: TextDirection.rtl,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(1),
                              child: Icon(
                                FontAwesomeIcons.solidClock,
                                size: 2.5 * User.deviceBlockSize,
                                color: _mainFontColor.withOpacity(.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
