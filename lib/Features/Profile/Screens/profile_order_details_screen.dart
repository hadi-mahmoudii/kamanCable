// import 'package:flutter/material.dart';

// import '../../../Cores/Widgets/ProfileScreens/Orders/detail_item_card.dart';
// import '../../../Cores/Widgets/ProfileScreens/Orders/detail_price_box.dart';
// import '../../../Cores/Widgets/ProfileScreens/Orders/details_data_row.dart';
// import '../../../Cores/Widgets/global-appbar.dart';
// import '../../../Cores/Widgets/header2.dart';
// class ProfileOrderDetailsScreen extends StatelessWidget {
//   final String _reciever = 'مهدیه بیگی';
//   final String _date = '2020/02/02';
//   final String _callNumber = '09031234567';
//   final String _price = '290000';
//   final String _payment = 'پرداخت اینترنتی';
//   final String _id = 'DKC 631705';
//   final String _address = 'قم ، بلوارامین ، نبش کوچه 35 ، سمت راست پلاک 54';
//   final String totalOrgPrice = '680000';
//   final String totalOffPrice = '20000';
//   final String totalBalancePrice = '660000';
//   final String offPercent = '15';
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
//         child: SimpleAppbar('سفارشات من'),
//         preferredSize: Size(double.infinity, 7 * _deviceHeightBlockSize),
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: SimpleHeader2('جزئیات سفارش', 'ORDER DETAILS'),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Divider(
//             height: .1,
//             color: Colors.grey,
//           ),
//           ProfileOrderDetailDataRow(
//             mainFontColor: _mainFontColor,
//             label: 'تحویل گیرنده',
//             value: _reciever,
//             fontfamilly: 'iranyekan',
//           ),
//           Divider(
//             height: .1,
//             color: Colors.grey,
//           ),
//           ProfileOrderDetailDataRow(
//             mainFontColor: _mainFontColor,
//             label: 'تاریخ ثبت سفارش',
//             value: _date,
//             backgroundColor: Color.fromRGBO(245, 245, 245, 1),
//           ),
//           Divider(
//             height: .1,
//             color: Colors.grey,
//           ),
//           ProfileOrderDetailDataRow(
//             mainFontColor: _mainFontColor,
//             label: 'شماره تماس',
//             value: _callNumber,
//           ),
//           Divider(
//             height: .1,
//             color: Colors.grey,
//           ),
//           ProfileOrderDetailDataRow(
//             mainFontColor: _mainFontColor,
//             label: 'مبلغ کل',
//             value: _price,
//             backgroundColor: Color.fromRGBO(245, 245, 245, 1),
//             unit: ' تومان',
//           ),
//           Divider(
//             height: .1,
//             color: Colors.grey,
//           ),
//           ProfileOrderDetailDataRow(
//             mainFontColor: _mainFontColor,
//             label: 'نحوه پرداخت',
//             value: _payment,
//             fontfamilly: 'iranyekan',
//           ),
//           Divider(
//             height: .1,
//             color: Colors.grey,
//           ),
//           ProfileOrderDetailDataRow(
//             mainFontColor: _mainFontColor,
//             label: 'کد سفارش',
//             value: _id,
//             backgroundColor: Color.fromRGBO(245, 245, 245, 1),
//           ),
//           Divider(
//             height: .1,
//             color: Colors.grey,
//           ),
//           ProfileOrderDetailDataRow(
//             mainFontColor: _mainFontColor,
//             label: 'ارسال به',
//             value: _address,
//             fontfamilly: 'iranyekan',
//           ),
//           Divider(
//             height: .1,
//             color: Colors.grey,
//           ),
//           SizedBox(height: 10),
//           ProfileOrderDetailItemCard(
//             deviceBlockSize: _deviceBlockSize,
//             pName: 'کابل میکرو یو اس بی',
//             eName: 'MICRO USB CABLE',
//             colorLabel: 'قرمز',
//             colorValue: Colors.red,
//             itemOrgPrice: '360000',
//             itemOffPrice: '240000',
//             itemOffPercent: '15',
//             secondColor: _secondColor,
//           ),
//           SizedBox(height: 20),
//           ProfileOrderDetailPriceBox(
//             deviceBlockSize: _deviceBlockSize,
//             totalOrgPrice: totalOrgPrice,
//             totalOffPrice: totalOffPrice,
//             totalBalancePrice: totalBalancePrice,
//             deviceWidth: _devicewidth,
//             offPercent: offPercent,
//           ),
//           SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
