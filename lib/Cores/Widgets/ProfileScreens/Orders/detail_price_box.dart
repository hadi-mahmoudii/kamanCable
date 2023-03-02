// import 'package:flutter/material.dart';

// class ProfileOrderDetailPriceBox extends StatelessWidget {
//   const ProfileOrderDetailPriceBox({
//     Key? key,
//     required double deviceBlockSize,
//     required this.totalOrgPrice,
//     required this.totalOffPrice,
//     required this.totalBalancePrice,
//     required this.deviceWidth,
//     required this.offPercent,
//   })  : _deviceBlockSize = deviceBlockSize,
//         super(key: key);

//   final double _deviceBlockSize;
//   final String totalOrgPrice;
//   final String totalOffPrice;
//   final String totalBalancePrice;
//   final double deviceWidth;
//   final String offPercent;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Divider(
//           height: .1,
//           color: Colors.grey,
//         ),
//         Container(
//           color: Colors.white,
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: deviceWidth * .50,
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       decoration: BoxDecoration(
//                         border: Border(
//                           right: BorderSide(
//                             color: Colors.grey,
//                           ), // provides to left side
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: <Widget>[
//                           Container(
//                             padding: EdgeInsets.only(bottom: 3),
//                             child: Text(
//                               'تومان',
//                               style: TextStyle(
//                                 fontSize: 2.5 * _deviceBlockSize,
//                                 color: Color.fromRGBO(0, 0, 70, 2),
//                               ),
//                               textDirection: TextDirection.rtl,
//                             ),
//                           ),
//                           Container(
//                             child: Text(
//                               totalOrgPrice,
//                               style: TextStyle(
//                                 fontFamily: 'montserrat',
//                                 fontSize: 5 * _deviceBlockSize,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color.fromRGBO(0, 0, 70, 2),
//                               ),
//                               textDirection: TextDirection.rtl,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   width: deviceWidth * .35,
//                   child: Text(
//                     'مبلغ کل کالاها',
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Divider(
//           height: .05,
//           color: Colors.red,
//         ),
//         Container(
//           // color: Color.fromRGBO(235, 235, 235, 2),
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: deviceWidth * .50,
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       decoration: BoxDecoration(
//                         border: Border(
//                           right: BorderSide(
//                             color: Colors.grey,
//                           ), // provides to left side
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: <Widget>[
//                           Container(
//                             padding: EdgeInsets.only(bottom: 3),
//                             child: Text(
//                               'تومان',
//                               style: TextStyle(
//                                 fontSize: 2.5 * _deviceBlockSize,
//                                 color: Colors.red,
//                               ),
//                               textDirection: TextDirection.rtl,
//                             ),
//                           ),
//                           Container(
//                             child: Text(
//                               totalOffPrice,
//                               style: TextStyle(
//                                 fontFamily: 'montserrat',
//                                 fontSize: 5 * _deviceBlockSize,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.red,
//                               ),
//                               textDirection: TextDirection.rtl,
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(bottom: 5, left: 2),
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 2,
//                               vertical: 3,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(7),
//                                 topLeft: Radius.circular(7),
//                                 bottomRight: Radius.circular(7),
//                               ),
//                               color: Colors.redAccent,
//                             ),
//                             child: Text(
//                               '%$offPercent',
//                               style: TextStyle(
//                                 fontFamily: 'montserrat',
//                                 fontSize: 2.5 * _deviceBlockSize,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   width: deviceWidth * .35,
//                   child: Text(
//                     'تخفیف',
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Divider(
//           height: .1,
//           color: Color.fromRGBO(0, 0, 70, 2),
//         ),
//         Container(
//           color: Color.fromRGBO(0, 30, 60, 2),
//           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: deviceWidth * .50,
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       decoration: BoxDecoration(
//                         border: Border(
//                           right: BorderSide(
//                             color: Colors.grey,
//                           ), // provides to left side
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: <Widget>[
//                           Container(
//                             padding: EdgeInsets.only(bottom: 3),
//                             child: Text(
//                               'تومان',
//                               style: TextStyle(
//                                 fontSize: 2.5 * _deviceBlockSize,
//                                 color: Colors.white,
//                               ),
//                               textDirection: TextDirection.rtl,
//                             ),
//                           ),
//                           Container(
//                             child: Text(
//                               totalBalancePrice,
//                               style: TextStyle(
//                                 fontFamily: 'montserrat',
//                                 fontSize: 6 * _deviceBlockSize,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.white,
//                               ),
//                               textDirection: TextDirection.rtl,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   width: deviceWidth * .35,
//                   child: Text(
//                     'مبلغ کل',
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Divider(
//           height: .1,
//           color: Colors.grey,
//         ),
//       ],
//     );
//   }
// }