// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// import '../../../Cores/Config/image_datas.dart';
// import '../../../Cores/Config/user.dart';
// import '../../../Cores/Widgets/loading_widget.dart';
// import '../../Blog/Providers/blog_provider.dart';
// import '../../Blog/Widgets/Main/feed-overview2.dart';

// class HomeNewsSwiper extends StatefulWidget {
//   // final Widget container;
//   // final double heigth;
//   // HomeNewsSwiper(this.container, this.heigth);

//   @override
//   _HomeNewsSwiperState createState() => _HomeNewsSwiperState();
// }

// class _HomeNewsSwiperState extends State<HomeNewsSwiper> {
//   int _ind = 0;
//   bool isInit = true;
//   SwiperController swpcontroller = new SwiperController();
//   @override
//   void didChangeDependencies() async {
//     if (isInit) {
//       var blogProvider = Provider.of<BlogProvider>(context);
//       await blogProvider.getItems(false, page: 1);
//       isInit = false;
//     }

//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData _theme = Theme.of(context);
//     final Color _mainColor = _theme.primaryColor;
//     var sizes = MediaQuery.of(context).size;
//     Provider.of<User>(context, listen: false).setSizes(sizes);
//     // final _media = MediaQuery.of(context);
//     // final double User.deviceWidth = _media.size.width;
//     // final double User.deviceBlockSize = User.deviceWidth / 100;
//     // final double _deviceHeight = _media.size.height;
//     // final double _deviceHeightBlockSize = _deviceHeight / 100;
//     return isInit
//         ? LoadingWidget(mainFontColor: _mainColor)
//         : Consumer<BlogProvider>(
//             builder: (ctx, blogItems, _) => Container(
//               // height: 32 * _deviceHeightBlockSize,
//               height: (User.deviceWidth - 40) / 1.6,
//               margin: EdgeInsets.only(bottom: 40),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Flexible(
//                     flex: 10,
//                     // height: 250,
//                     child: Container(
//                       // color: Colors.red,
//                       child: Swiper(
//                         onIndexChanged: (ind) {
//                           setState(() {
//                             _ind = ind;
//                           });
//                         },
//                         index: _ind,
//                         controller: swpcontroller,
//                         itemWidth: User.deviceWidth - 40,
//                         itemBuilder: (BuildContext context, int index) =>
//                             Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           child: FeedOverview2(items: blogItems.items[_ind]),
//                           // Spacer()
//                         ),
//                         itemCount: blogItems.items.length,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     // height: _deviceHeightBlockSize,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           GestureDetector(
//                             child: Icon(
//                               Icons.arrow_back_ios,
//                               size: 5 * User.deviceBlockSize,
//                               color: _mainColor,
//                             ),
//                             onTap: () async {
//                               await swpcontroller.previous();
//                             },
//                           ),
//                           ListView.builder(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (ctx, index) => CircleView(
//                               ind: _ind,
//                               mainColor: _mainColor,
//                               pixelRatio: User.deviceBlockSize / 2,
//                               finalValue: index,
//                             ),
//                             itemCount: blogItems.items.length,
//                           ),
//                           GestureDetector(
//                             child: Icon(
//                               Icons.arrow_forward_ios,
//                               size: 5 * User.deviceBlockSize,
//                               color: _mainColor,
//                             ),
//                             onTap: () async {
//                               await swpcontroller.next();
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//   }
// }

// class CircleView extends StatelessWidget {
//   const CircleView(
//       {Key key,
//       @required int ind,
//       @required Color mainColor,
//       @required double pixelRatio,
//       @required int finalValue})
//       : _ind = ind,
//         _mainColor = mainColor,
//         _pixelRatio = pixelRatio,
//         _finalValue = finalValue,
//         super(key: key);

//   final int _ind;
//   final int _finalValue;
//   final Color _mainColor;
//   final double _pixelRatio;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(3.0),
//       child: Icon(
//         FontAwesomeIcons.solidCircle,
//         color: _ind == _finalValue ? _mainColor : Colors.grey,
//         size: 5.5 * _pixelRatio,
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
//     // final _media = MediaQuery.of(context);
//     // final double User.deviceWidth = _media.size.width;
//     // final double User.deviceBlockSize = User.deviceWidth / 100;
//     // final double _deviceHeight = _media.size.height;
//     // final double _deviceHeightBlockSize = _deviceHeight / 100;
//     // final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
//     final double _pageWidth = (User.deviceWidth - 60) / 2;
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
//           elevation: 7,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(4 * User.deviceBlockSize),
//           ),
//           child: Container(
//             width: _pageWidth,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius:
//                         BorderRadius.circular(4 * User.deviceBlockSize),
//                     child: Image(
//                       width: double.infinity,
//                       image: AssetImage(_newsImage),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 // SizedBox(height:_deviceHeightBlockSize),
//                 Padding(
//                   padding: EdgeInsets.all(3 * User.deviceBlockSize),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         _newsTitle,
//                         style: TextStyle(
//                           fontSize: 3.5 * User.deviceBlockSize,
//                           fontWeight: FontWeight.w700,
//                           color: _mainFontColor,
//                         ),
//                         // textScaleFactor: _pixelRatio,
//                         textDirection: TextDirection.rtl,
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Divider(
//                           height: 5,
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
//                                         fontSize: 2.5 * User.deviceBlockSize,
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
//                                       size: 2 * User.deviceBlockSize,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 5,
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
//                                         fontSize: 2.5 * User.deviceBlockSize,
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
//                                       size: 2 * User.deviceBlockSize,
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
//                             fontSize: 3 * User.deviceBlockSize,
//                             color: _mainFontColor,
//                             height: 1.1,
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
//                                   fontSize: 3 * User.deviceBlockSize,
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
//                                       5 * User.deviceBlockSize),
//                                   color: _secondColor,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: _secondColor,
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
//                                     size: 4 * User.deviceBlockSize,
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
//                                       5 * User.deviceBlockSize),
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
//                                     size: 4 * User.deviceBlockSize,
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
//                                     fontSize: 3 * User.deviceBlockSize,
//                                     fontWeight: FontWeight.w700,
//                                     color: _mainFontColor,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: User.deviceBlockSize,
//                                 ),
//                                 SvgPicture.asset(
//                                   'assets/Icons/comment.svg',
//                                   height: 8 * User.deviceBlockSize,
//                                   width: 8 * User.deviceBlockSize,
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
