// import 'package:flutter/material.dart';

// import '../../../Config/routes.dart';

// class AwaitingItemCard extends StatelessWidget {
//   const AwaitingItemCard({
//     Key? key,
//     required double deviceBlockSize,
//     required this.pName,
//     required this.eName,
//     required String colorLabel,
//     required Color colorValue,
//     required Color secondColor,
//     required String itemOrgPrice,
//     required String itemOffPrice,
//     required String itemOffPercent,
//   })  : _deviceBlockSize = deviceBlockSize,
//         _itemOrgPrice = itemOrgPrice,
//         _itemOffPrice = itemOffPrice,
//         _itemOffPercent = itemOffPercent,
//         _colorLabel = colorLabel,
//         _colorValue = colorValue,
//         _secondColor = secondColor,
//         super(key: key);

//   final double _deviceBlockSize;
//   final String pName;
//   final String eName;
//   final String _colorLabel;
//   final Color _colorValue;
//   final Color _secondColor;
//   final String _itemOrgPrice;
//   final String _itemOffPrice;
//   final String _itemOffPercent;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 15.0,
//             spreadRadius: 1,
//             offset: Offset(
//               0.0,
//               10,
//             ),
//           )
//         ],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: InkWell(
//         onTap: () =>
//             Navigator.of(context).pushNamed(Routes.profileOrderDetailsScreen),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Container(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: <Widget>[
//                 Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 4,
//                       horizontal: 6,
//                     ),
//                     child: Column(
//                       children: <Widget>[
//                         Icon(
//                           Icons.add,
//                           size: 4 * _deviceBlockSize,
//                         ),
//                         Text(
//                           '1',
//                           style: TextStyle(
//                             fontFamily: 'montserrat',
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black54,
//                             fontSize: 5 * _deviceBlockSize,
//                           ),
//                         ),
//                         Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                           size: 4 * _deviceBlockSize,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 2),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: <Widget>[
//                         Text(
//                           pName,
//                           style: TextStyle(
//                             fontSize: 3 * _deviceBlockSize,
//                             fontWeight: FontWeight.w700,
//                             // color: _mainFontColor,
//                           ),
//                           textDirection: TextDirection.rtl,
//                           // textScaleFactor: _pixelRatio,
//                         ),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         Text(
//                           eName,
//                           style: TextStyle(
//                             fontFamily: 'montserrat',
//                             letterSpacing: 3,
//                             // color: _secondFontColor,
//                             fontSize: 1.5 * _deviceBlockSize,
//                           ),
//                           textDirection: TextDirection.rtl,
//                           // textScaleFactor: _pixelRatio,
//                         ),
//                         Divider(
//                           color: Colors.grey,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: <Widget>[
//                             Text(
//                               _colorLabel,
//                               style: TextStyle(
//                                 fontSize: 3 * _deviceBlockSize,
//                               ),
//                               textDirection: TextDirection.rtl,
//                             ),
//                             SizedBox(
//                               width: 3 * _deviceBlockSize,
//                             ),
//                             Container(
//                               width: 2.5 * _deviceBlockSize,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: _colorValue,
//                               ),
//                               child: Text(' '),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: <Widget>[
//                             Text(
//                               '?????????????? 18 ????????',
//                               style: TextStyle(
//                                 fontSize: 3 * _deviceBlockSize,
//                               ),
//                               textDirection: TextDirection.rtl,
//                             ),
//                             SizedBox(
//                               width: 3 * _deviceBlockSize,
//                             ),
//                             Icon(
//                               Icons.verified_user,
//                               size: 2.5 * _deviceBlockSize,
//                             ),
//                           ],
//                         ),
//                         Divider(
//                           color: Colors.grey,
//                         ),
//                         Container(
//                           alignment: Alignment.centerLeft,
//                           width: 43 * _deviceBlockSize,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: <Widget>[
//                               Container(
//                                 height: _itemOffPrice != '0.0'
//                                     ? 9 * _deviceBlockSize
//                                     : 4.5 * _deviceBlockSize,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: <Widget>[
//                                     Text(
//                                       '??????????',
//                                       style: TextStyle(
//                                         fontSize: 2.5 * _deviceBlockSize,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 height: 12 * _deviceBlockSize,
//                                 child: Column(
//                                   children: <Widget>[
//                                     Spacer(),
//                                     _itemOffPrice != '0.0'
//                                         ? Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               Text(
//                                                 _itemOrgPrice,
//                                                 style: TextStyle(
//                                                   fontFamily: 'montserrat',
//                                                   fontSize:
//                                                       3.5 * _deviceBlockSize,
//                                                   decoration: TextDecoration
//                                                       .lineThrough,
//                                                   color: Colors.black,
//                                                 ),
//                                               ),
//                                               Container(
//                                                 margin:
//                                                     EdgeInsets.only(left: 1),
//                                                 padding: EdgeInsets.symmetric(
//                                                   horizontal: 2,
//                                                   vertical: 2,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.only(
//                                                     topRight:
//                                                         Radius.circular(10),
//                                                     topLeft:
//                                                         Radius.circular(10),
//                                                     bottomRight:
//                                                         Radius.circular(10),
//                                                   ),
//                                                   color: _secondColor,
//                                                 ),
//                                                 child: Text(
//                                                   '%$_itemOffPercent',
//                                                   style: TextStyle(
//                                                     fontFamily: 'montserrat',
//                                                     fontSize:
//                                                         2.2 * _deviceBlockSize,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                               )
//                                             ],
//                                           )
//                                         : Container(),
//                                     Row(
//                                       children: <Widget>[
//                                         Container(
//                                           child: Text(
//                                             _itemOffPrice != '0.0'
//                                                 ? _itemOffPrice
//                                                 : _itemOrgPrice,
//                                             style: TextStyle(
//                                               fontFamily: 'montserrat',
//                                               color: Colors.black,
//                                               fontSize: 5 * _deviceBlockSize,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Spacer(),
//                                   ],
//                                 ),
//                               ),
//                               Spacer()
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Image.asset(
//                   'assets/Images/5.jpg',
//                   height: 100,
//                   width: 100,
//                   fit: BoxFit.fill,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }