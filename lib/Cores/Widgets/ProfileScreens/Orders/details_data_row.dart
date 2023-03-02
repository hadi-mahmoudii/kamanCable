// import 'package:flutter/material.dart';

// class ProfileOrderDetailDataRow extends StatelessWidget {
//   const ProfileOrderDetailDataRow({
//     Key? key,
//     required Color mainFontColor,
//     required String label,
//     required String value,
//     Color backgroundColor = Colors.white,
//     String fontfamilly = 'montserrat',
//     String unit = '',
//   })  : _mainFontColor = mainFontColor,
//         _label = label,
//         _value = value,
//         _backgroundColor = backgroundColor,
//         _fontfamily = fontfamilly,
//         _unit = unit,
//         super(key: key);

//   final Color _mainFontColor;
//   final String _label;
//   final String _value;
//   final Color _backgroundColor;
//   final String _fontfamily;
//   final String _unit;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: _backgroundColor,
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: Container(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Container(
//                   width: MediaQuery.of(context).size.width * .5,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Container(
//                         padding: EdgeInsets.only(right: 20, bottom: 5, top: 5),
//                         decoration: BoxDecoration(
//                           border: Border(
//                             right: BorderSide(
//                               color: Colors.black12,
//                             ), // provides to left side
//                           ),
//                         ),
//                         width: MediaQuery.of(context).size.width * .45,
//                         child: _unit == ''
//                             ? Text(
//                                 //bedoone vahed
//                                 _value,
//                                 textDirection: TextDirection.rtl,
//                                 style: TextStyle(
//                                   color: _mainFontColor,
//                                   fontFamily: _fontfamily,
//                                 ),
//                               )
//                             : Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: <Widget>[
//                                   Text(
//                                     _unit,
//                                     textDirection: TextDirection.rtl,
//                                     style: TextStyle(
//                                       color: _mainFontColor,
//                                       fontFamily: 'iranyekan',
//                                       fontSize: 9,
//                                     ),
//                                   ),
//                                   Text(
//                                     _value,
//                                     textDirection: TextDirection.rtl,
//                                     style: TextStyle(
//                                       color: _mainFontColor,
//                                       fontFamily: _fontfamily,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * .35,
//               child: Text(
//                 _label,
//                 textDirection: TextDirection.rtl,
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
