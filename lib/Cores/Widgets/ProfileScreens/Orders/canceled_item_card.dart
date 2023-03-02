// import 'package:flutter/material.dart';

// import '../../../Config/routes.dart';

// class CanceledItemCard extends StatelessWidget {
//   const CanceledItemCard({
//     Key? key,
//     required double deviceBlockSize,
//     required this.pName,
//     required this.eName,
//     required String colorLabel,
//     required Color colorValue,
//     required String date,
//   })  : _deviceBlockSize = deviceBlockSize,
//         _colorLabel = colorLabel,
//         _colorValue = colorValue,
//         _date = date,
//         super(key: key);

//   final double _deviceBlockSize;
//   final String pName;
//   final String eName;
//   final String _colorLabel;
//   final Color _colorValue;

//   final String _date;

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
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10, right: 2),
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
//                             fontSize: 1.5 * _deviceBlockSize,
//                           ),
//                           textDirection: TextDirection.rtl,
//                         ),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 6, vertical: 3),
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Text(
//                             'لغو شده',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 2 * _deviceBlockSize,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         Divider(
//                           color: Colors.grey,
//                           height: 5,
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
//                               'گارانتی 18 ماهه',
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
//                               color: Colors.grey,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: <Widget>[
//                             Text(
//                               _date,
//                               style: TextStyle(
//                                 fontSize: 3 * _deviceBlockSize,
//                               ),
//                               textDirection: TextDirection.rtl,
//                             ),
//                             SizedBox(
//                               width: 3 * _deviceBlockSize,
//                             ),
//                             Icon(
//                               Icons.watch_later,
//                               size: 2.5 * _deviceBlockSize,
//                               color: Colors.grey,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Image.asset(
//                   'assets/Images/5.jpg',
//                   height: 90,
//                   width: 90,
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
