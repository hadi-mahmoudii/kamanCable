// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../../../../Cores/Config/image_datas.dart';

// class ProductItemImageSwiper extends StatefulWidget {
//   @override
//   _SwiperPagingState createState() => _SwiperPagingState();
// }

// class _SwiperPagingState extends State<ProductItemImageSwiper> {
//   int _ind = 0;
//   final List<Map<String, String>> _datas = productItemImages;
//   SwiperController swpcontroller = new SwiperController();

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData _theme = Theme.of(context);
//     final Color _mainColor = _theme.primaryColor;
//     final _media = MediaQuery.of(context);
//     final double _devicewidth = _media.size.width;
//     final double _deviceBlockSize = _devicewidth / 100;
//     final double _pixelRatio = (_media.size.height / _media.size.width * 7 / 5);
//     return Column(children: <Widget>[
//       Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(35),
//           ),
//         ),
//         height: 80 * _deviceBlockSize,
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
//               ),
//             );
//           },
//           itemCount: 5,
//         ),
//       ),
//       Container(
//         height: 5 * _pixelRatio,
//         width: (MediaQuery.of(context).size.width - 40),
//         margin: EdgeInsets.only(bottom: 5 * _pixelRatio),
//         child: Container(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               GestureDetector(
//                 child: Icon(
//                   Icons.arrow_back_ios,
//                   size: 10 * _pixelRatio,
//                   color: _mainColor,
//                 ),
//                 onTap: () async {
//                   await swpcontroller.previous();
//                 },
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Icon(
//                       FontAwesomeIcons.solidCircle,
//                       color: _ind == 0 ? _mainColor : Colors.grey,
//                       size: 5.5 * _pixelRatio,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Icon(
//                       FontAwesomeIcons.solidCircle,
//                       color: _ind == 1 ? _mainColor : Colors.grey,
//                       size: 5.5 * _pixelRatio,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Icon(
//                       FontAwesomeIcons.solidCircle,
//                       color: _ind == 2 ? _mainColor : Colors.grey,
//                       size: 5.5 * _pixelRatio,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Icon(
//                       FontAwesomeIcons.solidCircle,
//                       color: _ind == 3 ? _mainColor : Colors.grey,
//                       size: 5.5 * _pixelRatio,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Icon(
//                       FontAwesomeIcons.solidCircle,
//                       color: _ind == 4 ? _mainColor : Colors.grey,
//                       size: 5.5 * _pixelRatio,
//                     ),
//                   ),
//                 ],
//               ),
//               GestureDetector(
//                 child: Icon(
//                   Icons.arrow_forward_ios,
//                   size: 10 * _pixelRatio,
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

// class HeaderImages extends StatefulWidget {
//   final String _image;
//   HeaderImages(this._image);
//   @override
//   _HeaderImagesState createState() => _HeaderImagesState();
// }

// class _HeaderImagesState extends State<HeaderImages> {
//   @override
//   Widget build(BuildContext context) {
//     // final _media = MediaQuery.of(context);
//     // final double _devicewidth = _media.size.width;
//     // final double _deviceBlockSize = _devicewidth / 100;
//     // final double _pixelRatio =
//     //     (_media.size.height / _media.size.width * 7 / 5).roundToDouble();
//     // var _image = "assets/Images/1.jpg";
//     return Container(
//       margin: EdgeInsets.only(
//         left: 20,
//         right: 20,
//         bottom: 10,
//       ),
//       decoration: BoxDecoration(
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.black12,
//         //     blurRadius: 8.0,
//         //     offset: Offset(
//         //       0.0,
//         //       2.5 * _pixelRatio,
//         //     ),
//         //   )
//         // ],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Card(
//         elevation: 5,
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           child: Image(
//             fit: BoxFit.fill,
//             image: AssetImage(widget._image),
//           ),
//         ),
//       ),
//       // ),
//       // 70 * _pixelRatio,
//     );
//   }
// }
