import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Cores/Config/routes.dart';
import '../../Entities/blog_item.dart';

class FeedOverview extends StatelessWidget {
  final BlogItem items;

  const FeedOverview({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceWidthBlockSize = _devicewidth / 100;
    // final double _deviceHeight = _media.size.height;
    // final double _deviceHeightBlockSize = _deviceHeight / 100;
    final double _pageWidth = _media.size.width - 40;
    String _newsTitle = items.title;
    String _newsWriter = items.user;
    String _newsDate = items.createdAt;
    String _newsContent = items.abs + '\n\n';
    // 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.';
    // String _newsLikes = items.likesCount;
    // String _newsComments = items.commentsCount;
    String _newsImage = items.thumbnail;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 20.0,
        //     offset: Offset(
        //       0.0,
        //       10,
        //     ),
        //   )
        // ],
        borderRadius: BorderRadius.circular(40),
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(Routes.blogDetailsScreen, arguments: items.id),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4 * _deviceWidthBlockSize),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: _pageWidth * .55,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 13.5, right: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            _newsTitle,
                            style: TextStyle(
                              fontSize: 4 * _deviceWidthBlockSize,
                              fontWeight: FontWeight.w700,
                              color: _mainFontColor,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            child: Divider(
                              height: _deviceWidthBlockSize,
                            ),
                          ),
                          Container(
                            // width: _pageWidth * .55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: _pageWidth * .65,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          _newsDate,
                                          style: TextStyle(
                                            fontSize: 3 * _deviceWidthBlockSize,
                                            color:
                                                _mainFontColor.withOpacity(.4),
                                          ),
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.right,
                                          // textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        child: Icon(
                                          FontAwesomeIcons.solidClock,
                                          size: 2.5 * _deviceWidthBlockSize,
                                          color: _mainFontColor.withOpacity(.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: _pageWidth * .65,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          _newsWriter,
                                          style: TextStyle(
                                            fontSize: 3 * _deviceWidthBlockSize,
                                            color:
                                                _mainFontColor.withOpacity(.4),
                                          ),
                                          textDirection: TextDirection.rtl,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(1),
                                        child: Icon(
                                          Icons.person,
                                          size: 3 * _deviceWidthBlockSize,
                                          color: _mainFontColor.withOpacity(.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 7),
                            // height: 12 * _deviceWidthBlockSize,
                            child: Text(
                              _newsContent,
                              style: TextStyle(
                                color: _mainFontColor,
                                fontSize: 3.5 * _deviceWidthBlockSize,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                              maxLines: 3,
                            ),
                            // child: Html(
                            //     data: _newsContent,
                            //     style: {
                            //       'textStyle': Style(
                            //         color: Colors.red,
                            //       ),
                            //     },
                            //   )
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 5),
                          //   child: Row(
                          //     // crossAxisAlignment: CrossAxisAlignment.start,
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: <Widget>[
                          //       Row(
                          //         // crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: <Widget>[
                          //           Text(
                          //             _newsLikes,
                          //             style: TextStyle(
                          //               fontFamily: 'montserrat',
                          //               color: _mainFontColor,
                          //               fontSize: 4 * _deviceWidthBlockSize,
                          //               // fontWeight: FontWeight.w700,
                          //             ),
                          //           ),
                          //           Container(
                          //             margin:
                          //                 EdgeInsets.symmetric(horizontal: 3),
                          //             decoration: BoxDecoration(
                          //               shape: BoxShape.circle,
                          //               boxShadow: [
                          //                 BoxShadow(
                          //                   color: _secondColor.withOpacity(.5),
                          //                   blurRadius: 6.0,
                          //                   spreadRadius: 1.0,
                          //                   offset: Offset(
                          //                     00.0,
                          //                     3.0,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             child: CircleAvatar(
                          //               radius: 4 * _deviceWidthBlockSize,
                          //               backgroundColor: _secondColor,
                          //               child: Icon(
                          //                 FontAwesomeIcons.solidHeart,
                          //                 size: 4 * _deviceWidthBlockSize,
                          //                 color: Colors.white,
                          //               ),
                          //             ),
                          //           ),
                          //           Container(
                          //             decoration: BoxDecoration(
                          //               shape: BoxShape.circle,
                          //               boxShadow: [
                          //                 BoxShadow(
                          //                   color: _mainFontColor.withOpacity(.5),
                          //                   blurRadius: 6.0,
                          //                   spreadRadius: 1.0,
                          //                   offset: Offset(
                          //                     00.0,
                          //                     3.0,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             child: CircleAvatar(
                          //               radius: 4 * _deviceWidthBlockSize,
                          //               backgroundColor: _mainFontColor,
                          //               child: Icon(
                          //                 Icons.share,
                          //                 size: 4 * _deviceWidthBlockSize,
                          //                 color: Colors.white,
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       GestureDetector(
                          //         onTap: () {
                          //           // var blogProviderObject =
                          //           //     Provider.of<BlogProvider>(context);
                          //           if (User.token == 'Bearer ') {
                          //             //user didnt login
                          //             showDialog(
                          //               context: context,
                          //               builder: (
                          //                 ctx,
                          //               ) =>
                          //                   AlertDialog(
                          //                 content: Text(
                          //                   'برای مشاهده کامنت ها به آیدی خود وارد شوید.',
                          //                   textDirection: TextDirection.rtl,
                          //                 ),
                          //                 actions: <Widget>[
                          //                   TextButton(
                          //                     onPressed: () =>
                          //                         Navigator.of(ctx).pop(),
                          //                     child: Text('Ok'),
                          //                   )
                          //                 ],
                          //               ),
                          //             );
                          //           } else {
                          //             Navigator.of(context).pushNamed(
                          //               Routes.commentScreen,
                          //               arguments: {
                          //                 'id': items.id,
                          //                 'type': 'article'
                          //               },
                          //             );
                          //           }
                          //         },
                          //         child: Row(
                          //           // crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: <Widget>[
                          //             Text(
                          //               _newsComments,
                          //               style: TextStyle(
                          //                 fontFamily: 'montserrat',
                          //                 fontSize: 4 * _deviceWidthBlockSize,
                          //                 color: _mainFontColor,
                          //                 // fontWeight: FontWeight.w700,
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               width: _deviceWidthBlockSize,
                          //             ),
                          //             SvgPicture.asset(
                          //               'assets/Icons/comment.svg',
                          //               width: 8 * _deviceWidthBlockSize,
                          //               height: 8 * _deviceWidthBlockSize,
                          //               color: _mainFontColor,
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(4 * _deviceWidthBlockSize),
                  child: Image(
                    // height: 25 * _deviceHeightBlockSize,
                    image: NetworkImage(
                      _newsImage,
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
