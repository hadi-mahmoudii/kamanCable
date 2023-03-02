// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:kamancable/Cores/Config/user.dart';

// import '../../../Cores/Config/image_datas.dart';
// import '../../../Cores/Config/routes.dart';

// class HeaderImageSwiper extends StatefulWidget {
//   @override
//   _SwiperPagingState createState() => _SwiperPagingState();
// }

// class _SwiperPagingState extends State<HeaderImageSwiper> {
//   int _ind = 0;
//   final List<Map<String, String>> _datas = homeHeaderImageSwiper;
//   SwiperController swpcontroller = new SwiperController();

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData _theme = Theme.of(context);
//     final Color _mainColor = _theme.primaryColor;
//     // final _media = MediaQuery.of(context);
//     // final double _deviceHeight = _media.size.height;
//     // final double _deviceHeightBlockSize = _deviceHeight / 100;
//     // final double User.deviceBlockSize = _media.size.width;
//     // final double User.deviceBlockSizeBlockSize = User.deviceBlockSize / 100;
//     return Column(children: <Widget>[
//       Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(35),
//           ),
//         ),
//         height: (User.deviceWidth - 40) / 2.1,
//         child: Swiper(
//           onIndexChanged: (ind) {
//             setState(() {
//               _ind = ind;
//             });
//           },
//           index: _ind,
//           controller: swpcontroller,
//           itemWidth: MediaQuery.of(context).size.width - 40,
//           itemBuilder: (BuildContext context, int index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 1),
//               child: HeaderImages(
//                 _datas[index]['image'],
//                 index == 1 ? Routes.toolsMainScreen : '',
//               ),
//             );
//           },
//           itemCount: homeHeaderImageSwiper.length,
//         ),
//       ),
//       Container(
//         height: User.deviceBlockSize * 4,
//         width: (MediaQuery.of(context).size.width - 40),
//         margin: EdgeInsets.only(bottom: 10),
//         child: Container(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               GestureDetector(
//                 child: Icon(
//                   Icons.arrow_back_ios,
//                   size: 5 * User.deviceBlockSize,
//                   color: _mainColor,
//                 ),
//                 onTap: () async {
//                   await swpcontroller.previous();
//                 },
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (ctx, index) => CircleView(
//                   ind: _ind,
//                   mainColor: _mainColor,
//                   pixelRatio: User.deviceBlockSize / 2,
//                   finalValue: index,
//                 ),
//                 itemCount: homeHeaderImageSwiper.length,
//               ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: <Widget>[
//               //     CircleView(
//               //       ind: _ind,
//               //       mainColor: _mainColor,
//               //       pixelRatio: _pixelRatio,
//               //     ),
//               //     Padding(
//               //       padding: const EdgeInsets.all(3.0),
//               //       child: Icon(
//               //         FontAwesomeIcons.solidCircle,
//               //         color: _ind == 1 ? _mainColor : Colors.grey,
//               //         size: 5.5 * _pixelRatio,
//               //       ),
//               //     ),
//               //     Padding(
//               //       padding: const EdgeInsets.all(3.0),
//               //       child: Icon(
//               //         FontAwesomeIcons.solidCircle,
//               //         color: _ind == 2 ? _mainColor : Colors.grey,
//               //         size: 5.5 * _pixelRatio,
//               //       ),
//               //     ),
//               //     Padding(
//               //       padding: const EdgeInsets.all(3.0),
//               //       child: Icon(
//               //         FontAwesomeIcons.solidCircle,
//               //         color: _ind == 3 ? _mainColor : Colors.grey,
//               //         size: 5.5 * _pixelRatio,
//               //       ),
//               //     ),
//               //     Padding(
//               //       padding: const EdgeInsets.all(3.0),
//               //       child: Icon(
//               //         FontAwesomeIcons.solidCircle,
//               //         color: _ind == 4 ? _mainColor : Colors.grey,
//               //         size: 5.5 * _pixelRatio,
//               //       ),
//               //     ),
//               //   ],
//               // ),
//               GestureDetector(
//                 child: Icon(
//                   Icons.arrow_forward_ios,
//                   size: 5 * User.deviceBlockSize,
//                   color: _mainColor,
//                 ),
//                 onTap: () async {
//                   await swpcontroller.next();
//                 },
//               ),
//             ],
//           ),
//         ),
//       )
//     ]);
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

// class HeaderImages extends StatefulWidget {
//   final String _image;
//   final String routeName;
//   HeaderImages(this._image, this.routeName);
//   @override
//   _HeaderImagesState createState() => _HeaderImagesState();
// }

// class _HeaderImagesState extends State<HeaderImages> {
//   @override
//   Widget build(BuildContext context) {
//     // final _media = MediaQuery.of(context);
//     // final double _pixelRatio =
//     //     (_media.size.height / _media.size.width * 7 / 5).roundToDouble();
//     // var _image = "assets/Images/1.jpg";
//     return GestureDetector(
//       onTap: () => widget.routeName != ''
//           ? Navigator.of(context).pushNamed(widget.routeName)
//           : print('empty'),
//       child: Container(
//         margin: EdgeInsets.only(
//           left: 20,
//           right: 20,
//           bottom: 3 * User.deviceBlockSize,
//         ),
//         // decoration: BoxDecoration(
//         //   boxShadow: [
//         //     BoxShadow(
//         //       color: Colors.black12,
//         //       blurRadius: 8.0,
//         //       offset: Offset(
//         //         0.0,
//         //         2.5 * _pixelRatio,
//         //       ),
//         //     )
//         //   ],
//         //   borderRadius: BorderRadius.circular(12),
//         // ),
//         child: Card(
//           elevation: 7,
//           child: ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(5)),
//             child: Image(
//               fit: BoxFit.cover,
//               image: AssetImage(widget._image),
//             ),
//           ),
//         ),
//         // ),
//         // 70 * _pixelRatio,
//       ),
//     );
//   }
// }
