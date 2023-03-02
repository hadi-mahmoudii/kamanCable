// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SwiperPaging extends StatefulWidget {
//   final Widget container;
//   final double heigth;
//   SwiperPaging(this.container, this.heigth);

//   @override
//   _SwiperPagingState createState() => _SwiperPagingState();
// }

// class _SwiperPagingState extends State<SwiperPaging> {
//   int _ind = 0;

//   SwiperController swpcontroller = new SwiperController();

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData _theme = Theme.of(context);
//     final Color _mainColor = _theme.primaryColor;
//     final _media = MediaQuery.of(context);
//     final double _devicewidth = _media.size.width;
//     final double _deviceWidthBlockSize = _devicewidth / 100;
//     return Column(children: <Widget>[
//       Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(35),
//           ),
//         ),
//         height: widget.heigth,
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
//               child: widget.container,
//             );
//           },
//           itemCount: 5,
//         ),
//       ),
//       Container(
//         height: 4 * _deviceWidthBlockSize,
//         width: (MediaQuery.of(context).size.width - 40),
//         margin: EdgeInsets.only(bottom: 4 * _deviceWidthBlockSize),
//         child: Container(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               GestureDetector(
//                 child: Icon(
//                   Icons.arrow_back_ios,
//                   size: 7 * _deviceWidthBlockSize,
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
//                       size: 4 * _deviceWidthBlockSize,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Icon(
//                       FontAwesomeIcons.solidCircle,
//                       color: _ind == 1 ? _mainColor : Colors.grey,
//                       size: 4 * _deviceWidthBlockSize,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Icon(
//                       FontAwesomeIcons.solidCircle,
//                       color: _ind == 2 ? _mainColor : Colors.grey,
//                       size: 4 * _deviceWidthBlockSize,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Icon(
//                       FontAwesomeIcons.solidCircle,
//                       color: _ind == 3 ? _mainColor : Colors.grey,
//                       size: 4 * _deviceWidthBlockSize,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: Icon(
//                       FontAwesomeIcons.solidCircle,
//                       color: _ind == 4 ? _mainColor : Colors.grey,
//                       size: 4 * _deviceWidthBlockSize,
//                     ),
//                   ),
//                 ],
//               ),
//               GestureDetector(
//                 child: Icon(
//                   Icons.arrow_forward_ios,
//                   size: 7 * _deviceWidthBlockSize,
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
