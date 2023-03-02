import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Cores/Config/routes.dart';
import '../../Entities/blog_item.dart';

class FeedOverview2 extends StatelessWidget {
  final BlogItem items;

  const FeedOverview2({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final Color _mainFontColor = _theme.primaryColor;
    final _media = MediaQuery.of(context);
    final double _devicewidth = _media.size.width;
    final double _deviceWidthBlockSize = _devicewidth / 100;
    final double _pageWidth = _media.size.width - 40;
    String _newsTitle = items.title;
    String _newsWriter = items.user;
    String _newsDate = items.createdAt;
    String _newsContent = items.abs + '\n\n';
    // String _newsLikes = items.likesCount;
    // String _newsComments = items.commentsCount;
    String _newsImage = items.thumbnail;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
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
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 5),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: <Widget>[
                          //       Row(
                          //         children: <Widget>[
                          //           Text(
                          //             _newsLikes,
                          //             style: TextStyle(
                          //               fontFamily: 'montserrat',
                          //               color: _mainFontColor,
                          //               fontSize: 4 * _deviceWidthBlockSize,
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
                          //                   color:
                          //                       _mainFontColor.withOpacity(.5),
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
              Spacer(),
              Container(
                height: double.infinity,
                width: _pageWidth * .42,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(4 * _deviceWidthBlockSize),
                    topRight: Radius.circular(4 * _deviceWidthBlockSize),
                  ),
                  child: Image(
                    image: NetworkImage(
                      _newsImage,
                    ),
                    fit: BoxFit.fitHeight,
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
