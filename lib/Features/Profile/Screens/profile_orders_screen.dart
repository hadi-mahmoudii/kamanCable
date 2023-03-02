// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../Cores/Widgets/ProfileScreens/Orders/awaiting_item_card.dart';
// import '../../../Cores/Widgets/ProfileScreens/Orders/canceled_item_card.dart';
// import '../../../Cores/Widgets/ProfileScreens/Orders/delivered_item_card.dart';
// import '../../../Cores/Widgets/ProfileScreens/Orders/proccessing_item_card.dart';
// import '../../../Cores/Widgets/global-appbar.dart';
// import '../../../Cores/Widgets/header2.dart';
// import '../../UserCard/Screens/user-card-list-screen.dart';

// class ProfileOrdersScreen extends StatefulWidget {
//   @override
//   _ProfileOrdersScreenState createState() => _ProfileOrdersScreenState();
// }

// class _ProfileOrdersScreenState extends State<ProfileOrdersScreen> {
//   int _curIndex = 1;
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData _theme = Theme.of(context);
//     final Color _mainFontColor = _theme.primaryColor;
//     final Color _secondColor = _theme.accentColor;
//     final _media = MediaQuery.of(context);
//     final double _devicewidth = _media.size.width;
//     final double _deviceBlockSize = _devicewidth / 100;
//     final double _deviceHeight = _media.size.height;
//     final double _deviceHeightBlockSize = _deviceHeight / 100;

//     return Scaffold(
//       appBar: PreferredSize(
//         child: SimpleAppbar('حساب کاربری من'),
//         preferredSize: Size(double.infinity, 7 * _deviceHeightBlockSize),
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: SimpleHeader2('سفارشات من', 'MY ORDERS'),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: 50,
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: Color.fromRGBO(200, 200, 200, 1),
//                 ),
//               ),
//             ),
//             child: Directionality(
//               textDirection: TextDirection.rtl,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     SizedBox(
//                       width: 5 * _deviceBlockSize,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           _curIndex = 1;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border(
//                             bottom: BorderSide(
//                               color: _curIndex == 1
//                                   ? _mainFontColor
//                                   : Color.fromRGBO(200, 200, 200, 1),
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             HeaderName(
//                               pName: 'در انتظار پرداخت',
//                               eName: 'AWAITING PAYMENT',
//                               mainFontColor: _mainFontColor,
//                               deviceBlockSize: _deviceBlockSize,
//                             ),
//                             SizedBox(width: _deviceBlockSize),
//                             Container(
//                               padding: EdgeInsets.all(_curIndex == 1 ? 6 : 0),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: _mainFontColor,
//                               ),
//                               child: Text(
//                                 _curIndex == 1 ? '2' : '',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'montserrat',
//                                   fontSize: 3 * _deviceBlockSize,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10 * _deviceBlockSize,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           _curIndex = 2;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border(
//                             bottom: BorderSide(
//                               color: _curIndex == 2
//                                   ? _mainFontColor
//                                   : Color.fromRGBO(200, 200, 200, 1),
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             HeaderName(
//                               pName: 'در حال پردازش',
//                               eName: 'PROGRESSIGN',
//                               mainFontColor: _mainFontColor,
//                               deviceBlockSize: _deviceBlockSize,
//                             ),
//                             SizedBox(width: _deviceBlockSize),
//                             Container(
//                               padding: EdgeInsets.all(_curIndex == 2 ? 6 : 0),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: _mainFontColor,
//                               ),
//                               child: Text(
//                                 _curIndex == 2 ? '2' : '',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'montserrat',
//                                   fontSize: 3 * _deviceBlockSize,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10 * _deviceBlockSize,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           _curIndex = 3;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border(
//                             bottom: BorderSide(
//                               color: _curIndex == 3
//                                   ? _mainFontColor
//                                   : Colors.black12,
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             HeaderName(
//                               pName: 'تحویل شده',
//                               eName: 'DELIVERED',
//                               mainFontColor: _mainFontColor,
//                               deviceBlockSize: _deviceBlockSize,
//                             ),
//                             SizedBox(width: _deviceBlockSize),
//                             Container(
//                               padding: EdgeInsets.all(_curIndex == 3 ? 6 : 0),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: _mainFontColor,
//                               ),
//                               child: Text(
//                                 _curIndex == 3 ? '2' : '',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'montserrat',
//                                   fontSize: 3 * _deviceBlockSize,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10 * _deviceBlockSize,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           _curIndex = 4;
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border(
//                             bottom: BorderSide(
//                               color: _curIndex == 4
//                                   ? _mainFontColor
//                                   : Colors.black12,
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             HeaderName(
//                               pName: 'لغو شده',
//                               eName: 'CANCELED',
//                               mainFontColor: _mainFontColor,
//                               deviceBlockSize: _deviceBlockSize,
//                             ),
//                             SizedBox(width: _deviceBlockSize),
//                             Container(
//                               padding: EdgeInsets.all(_curIndex == 4 ? 6 : 0),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: _mainFontColor,
//                               ),
//                               child: Text(
//                                 _curIndex == 4 ? '2' : '',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'montserrat',
//                                   fontSize: 3 * _deviceBlockSize,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5 * _deviceBlockSize,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (ctx, index) {
//               if (_curIndex == 1) {
//                 return AwaitingItemCard(
//                   deviceBlockSize: _deviceBlockSize,
//                   pName: 'کابل میکرو یو اس بی',
//                   eName: 'MICRO USB CABLE',
//                   colorLabel: 'قرمز',
//                   colorValue: Colors.red,
//                   itemOrgPrice: '360000',
//                   itemOffPrice: '240000',
//                   itemOffPercent: '15',
//                   secondColor: _secondColor,
//                 );
//               } else if (_curIndex == 2) {
//                 return ProcessingItemCard(
//                   deviceBlockSize: _deviceBlockSize,
//                   pName: 'کابل میکرو یو اس بی',
//                   eName: 'MICRO USB CABLE',
//                   colorLabel: 'قرمز',
//                   colorValue: Colors.red,
//                   secondColor: _secondColor,
//                   itemOrgPrice: '360000',
//                   itemOffPrice: '240000',
//                   itemOffPercent: '15',
//                   isSending: index % 2 == 0 ? true : false,
//                 );
//               } else if (_curIndex == 3) {
//                 return DeliveredItemCard(
//                   deviceBlockSize: _deviceBlockSize,
//                   pName: 'کابل میکرو یو اس بی',
//                   eName: 'MICRO USB CABLE',
//                   colorLabel: 'قرمز',
//                   colorValue: Colors.red,
//                   secondColor: _secondColor,
//                   itemOrgPrice: '360000',
//                   itemOffPrice: '240000',
//                   itemOffPercent: '15',
//                   date: '2020/02/02',
//                 );
//               } else {
//                 return CanceledItemCard(
//                   deviceBlockSize: _deviceBlockSize,
//                   pName: 'کابل میکرو یو اس بی',
//                   eName: 'MICRO USB CABLE',
//                   colorLabel: 'قرمز',
//                   colorValue: Colors.red,
//                   date: '2020/02/02',
//                 );
//               }
//             },
//             itemCount: 2,
//           ),
//           _curIndex == 1
//               ? InkWell(
//                   onTap: () =>
//                       Navigator.of(context).pushNamed(UserCardListScreen.route),
//                   child: Container(
//                     //sabade kharid
//                     margin: EdgeInsets.only(
//                         left: 20,
//                         right: _deviceBlockSize * 65,
//                         top: 10,
//                         bottom: 50),
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                       color: _mainFontColor,
//                       borderRadius: BorderRadius.circular(7),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           'سبد خرید',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         SvgPicture.asset(
//                           'assets/Icons/shop.svg',
//                           color: Colors.white,
//                           height: 5 * _deviceBlockSize,
//                           width: 5 * _deviceBlockSize,
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }

// class HeaderName extends StatelessWidget {
//   const HeaderName({
//     Key? key,
//     required String pName,
//     required String eName,
//     required Color mainFontColor,
//     required double deviceBlockSize,
//   })  : _eName = eName,
//         _pName = pName,
//         _mainFontColor = mainFontColor,
//         _deviceBlockSize = deviceBlockSize,
//         super(key: key);

//   final String _pName;
//   final String _eName;

//   final Color _mainFontColor;
//   final double _deviceBlockSize;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Text(
//           _pName,
//           textDirection: TextDirection.rtl,
//           style: TextStyle(
//             color: _mainFontColor,
//             fontSize: 3 * _deviceBlockSize,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         SizedBox(height: 3),
//         Text(
//           _eName,
//           style: TextStyle(
//             color: _mainFontColor,
//             fontSize: 1.5 * _deviceBlockSize,
//             fontFamily: 'montserrat',
//             letterSpacing: 1.5,
//           ),
//           textDirection: TextDirection.rtl,
//         ),
//         SizedBox(height: 3),
//       ],
//     );
//   }
// }
