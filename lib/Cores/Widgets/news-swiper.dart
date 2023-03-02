// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../Config/image_datas.dart';
// import 'swiper-paging.dart';

// class NewsSwiper extends StatefulWidget {
//   // final Map _newsTitles;
//   // NewsSwiper(this._newsTitles);
//   @override
//   _NewsSwiperState createState() => _NewsSwiperState();
// }

// class _NewsSwiperState extends State<NewsSwiper> {
//   @override
//   Widget build(BuildContext context) {
//     final _media = MediaQuery.of(context);
//     final double _deviceHeight = _media.size.height;
//     final double _deviceHeightBlockSize = _deviceHeight / 100;
//     return Container(
//       margin: EdgeInsets.only(bottom: 15),
//       child: SwiperPaging(
//         Row(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(left: 20, bottom: _deviceHeightBlockSize),
//               child: ItemBox(),
//             ),
//             Container(
//               margin: EdgeInsets.only(right: 20, bottom:_deviceHeightBlockSize),
//               child: ItemBox(),
//             ),
//           ],
//         ),
//         300,
//       ),
//     );
//   }
// }

// class ItemBox extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData _theme = Theme.of(context);
//     final Color _mainFontColor = _theme.primaryColor;
//     final Color _secondColor = _theme.accentColor;
//     final _media = MediaQuery.of(context);
//     final double _devicewidth = _media.size.width;
//     final double _deviceWidthBlockSize = _devicewidth / 100;
//     final double _deviceHeight = _media.size.height;
//     final double _deviceHeightBlockSize = _deviceHeight / 100;
//     // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
//     final double _pageWidth = (_media.size.width - 60) / 2;
//     var _newsImage = newsImage;
//     var _newsTitle = 'اختراع جدید در سیستم برق';
//     var _newsWriter = 'بهزاد فرزانه';
//     var _newsDate = ' شنبه 12 اردیبهشت 99 - 12:39';
//     var _newsContent =
//         'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.';
//     var _newsLikes = '226';
//     var _newsComment = '12';
//     return GestureDetector(
//       // onTap: () => Navigator.of(context).pushNamed(Routes.blogDetailsScreen),
//       child: Container(
//         decoration: BoxDecoration(
//           // boxShadow: [
//           //   BoxShadow(
//           //     color: Colors.black12,
//           //     blurRadius: 8.0,
//           //     offset: Offset(
//           //       0.0,
//           //       2.5 * _pixelRatio,
//           //     ),
//           //   )
//           // ],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Card(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(4 * _deviceWidthBlockSize),
//           ),
//           child: Container(
//             width: _pageWidth,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius:
//                         BorderRadius.circular(4 * _deviceWidthBlockSize),
//                     child: Image(
//                       width: double.infinity,
//                       image: AssetImage(_newsImage),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 // SizedBox(height:_deviceHeightBlockSize),
//                 Padding(
//                   padding: EdgeInsets.all(3 * _deviceWidthBlockSize),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         _newsTitle,
//                         style: TextStyle(
//                           fontSize: 3.5 * _deviceWidthBlockSize,
//                           fontWeight: FontWeight.w700,
//                           color: _mainFontColor,
//                         ),
//                         // textScaleFactor: _pixelRatio,
//                         textDirection: TextDirection.rtl,
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(
//                             vertical: _deviceHeightBlockSize / 2),
//                         child: Divider(
//                           height: _deviceHeightBlockSize,
//                         ),
//                       ),
//                       Container(
//                         width: _pageWidth - 24,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             Container(
//                               width: _pageWidth - 28,
//                               child: Row(
//                                 children: <Widget>[
//                                   Expanded(
//                                     child: Text(
//                                       _newsDate,
//                                       style: TextStyle(
//                                         fontSize: 2.5 * _deviceWidthBlockSize,
//                                         color: _mainFontColor,
//                                       ),
//                                       // textScaleFactor: _pixelRatio,
//                                       overflow: TextOverflow.visible,
//                                       textDirection: TextDirection.rtl,
//                                     ),
//                                   ),
//                                   Container(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 1),
//                                     child: Icon(
//                                       FontAwesomeIcons.clock,
//                                       size: 2 * _deviceWidthBlockSize,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: _deviceHeightBlockSize,
//                             ),
//                             Container(
//                               width: _pageWidth - 28,
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Expanded(
//                                     child: Text(
//                                       _newsWriter,
//                                       style: TextStyle(
//                                         fontSize: 2.5 * _deviceWidthBlockSize,
//                                         color: _mainFontColor,
//                                       ),
//                                       overflow: TextOverflow.visible,
//                                       textDirection: TextDirection.rtl,
//                                       // textScaleFactor: _pixelRatio,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 1,
//                                     ),
//                                     child: Icon(
//                                       Icons.person,
//                                       size: 2 * _deviceWidthBlockSize,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 7),
//                         child: Text(
//                           _newsContent,
//                           style: TextStyle(
//                             fontSize: 3 * _deviceWidthBlockSize,
//                             color: _mainFontColor,
//                             height: 0.2 * _deviceHeightBlockSize,
//                           ),
//                           maxLines: 3,
//                           // textScaleFactor: _pixelRatio,
//                           overflow: TextOverflow.ellipsis,
//                           textDirection: TextDirection.rtl,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Text(
//                                 _newsLikes,
//                                 style: TextStyle(
//                                   fontFamily: 'montserrat',
//                                   fontSize: 3 * _deviceWidthBlockSize,
//                                   color: _secondColor,
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.symmetric(
//                                   horizontal: 2,
//                                   vertical: 5,
//                                 ),
//                                 padding: EdgeInsets.all(3),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(
//                                       5 * _deviceWidthBlockSize),
//                                   color: _secondColor,
//                                   boxShadow: [
//                                     BoxShadow(
//                                   color: _secondColor,
//                                       blurRadius: 3.0,
//                                       spreadRadius: 1.0,
//                                       offset: Offset(
//                                         00.0,
//                                         1.0,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(2.0),
//                                   child: Icon(
//                                     FontAwesomeIcons.solidHeart,
//                                     size: 4 * _deviceWidthBlockSize,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.symmetric(
//                                   horizontal: 2,
//                                   vertical: 5,
//                                 ),
//                                 padding: EdgeInsets.all(3),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(
//                                       5 * _deviceWidthBlockSize),
//                                   color: Color.fromRGBO(0x1B, 0x27, 0x49, 1),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color:
//                                           Color.fromRGBO(0x1B, 0x27, 0x49, 1),
//                                       blurRadius: 3.0,
//                                       spreadRadius: 1.0,
//                                       offset: Offset(
//                                         00.0,
//                                         1.0,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(2.0),
//                                   child: Icon(
//                                     Icons.share,
//                                     size: 4 * _deviceWidthBlockSize,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           GestureDetector(
//                             // onTap: () => Navigator.of(context)
//                             //     .pushNamed(Routes.commentScreen),
//                             child: Row(
//                               children: <Widget>[
//                                 Text(
//                                   _newsComment,
//                                   style: TextStyle(
//                                     fontFamily: 'montserrat',
//                                     fontSize: 3 * _deviceWidthBlockSize,
//                                     fontWeight: FontWeight.w700,
//                                     color: _mainFontColor,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: _deviceWidthBlockSize,
//                                 ),
//                                 SvgPicture.asset(
//                                   'assets/Icons/comment.svg',
//                                   height: 8 * _deviceWidthBlockSize,
//                                   width: 8 * _deviceWidthBlockSize,
//                                   color: _mainFontColor,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
