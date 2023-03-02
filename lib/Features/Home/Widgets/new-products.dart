// import 'package:flutter/material.dart';

// import '../../../Cores/Config/image_datas.dart';
// import '../../../Cores/Widgets/swiper-paging.dart';

// class NewProducts extends StatelessWidget {
//   // final List<Map<String, Object>> _items = newProductsDatas;
//   // final Widget newProduct;
//   // NewProducts(this.newProduct);
//   @override
//   Widget build(BuildContext context) {
//     final _media = MediaQuery.of(context);
//     // final double _deviceWidth = _media.size.width;
//     // final double _deviceWidthBlockSize = _deviceWidth / 100;
//     final double _deviceHeight = _media.size.height;
//     final double _deviceHeightBlockSize = _deviceHeight / 100;
//     var _firstImage = threeBigImage[0];
//     var _secondImge = threeBigImage[1];
//     var _thirdImage = threeBigImage[2];
//     return Column(
//       children: <Widget>[
//         SwiperPaging(
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               // Container(
//               //   margin: EdgeInsets.only(
//               //     left: 20,
//               //     bottom: 8,
//               //   ),
//               //   child: ProductItemCard(_items[0]),
//               // ),
//               // Container(
//               //   margin: EdgeInsets.only(
//               //     right: 20,
//               //     bottom: 8,
//               //   ),
//               //   child: ProductItemCard(_items[1]),
//               // )
//             ],
//           ),
//           300,
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey, width: 0.5),
//           ),
//           margin: EdgeInsets.symmetric(vertical: 7),
//           height: 25 * _deviceHeightBlockSize,
//           width: MediaQuery.of(context).size.width - 46,
//           child: Image(
//             image: AssetImage(_firstImage),
//             fit: BoxFit.cover,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 0.5),
//                 ),
//                 height: 25 * _deviceHeightBlockSize,
//                 width: MediaQuery.of(context).size.width / 2 - 25,
//                 child: Image(
//                   image: AssetImage(_secondImge),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 0.5),
//                 ),
//                 height: 25 * _deviceHeightBlockSize,
//                 width: MediaQuery.of(context).size.width / 2 - 25,
//                 child: Image(
//                   image: AssetImage(_thirdImage),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
