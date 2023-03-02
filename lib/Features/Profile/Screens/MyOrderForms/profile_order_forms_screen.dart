// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../../Cores/Config/routes.dart';
// import '../../../../Cores/Models/my_order_model.dart';
// import '../../../../Cores/Providers/connectivity.dart';
// import '../../../../Cores/Widgets/global-appbar.dart';
// import '../../../../Cores/Widgets/header2.dart';
// import '../../../../Cores/Widgets/loading_widget.dart';
// import '../../Providers/profile.dart';


// class ProfileOrderFormScreen extends StatelessWidget {
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
//       body: Consumer<ConnectivityProvider>(
//         builder: (ctx, conProvider, _) => conProvider
//                 .conSt(conProvider.conStatus)
//             ? ListView(
//                 shrinkWrap: true,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: SimpleHeader2('فرم های سفارش من', 'MY ORDER FORMS'),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Consumer<ProfileProvider>(
//                     builder: (ctx, profProvider, _) => profProvider.isLoading
//                         ? LoadingWidget(mainFontColor: _mainFontColor)
//                         : Selector<ProfileProvider, List<MyOrderFormItem>>(
//                             builder: (ctx, items, _) => ListView.separated(
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (ctx, index) => OrderFormDataRow(
//                                 deviceBlockSize: _deviceBlockSize,
//                                 mainFontColor: _mainFontColor,
//                                 deviceHeightBlockSize: _deviceHeightBlockSize,
//                                 secondColor: _secondColor,
//                                 index: (index + 1).toString(),
//                                 item: items[index],
//                                 profProvider: profProvider,
//                               ),
//                               itemCount: items.length,
//                               separatorBuilder:
//                                   (BuildContext context, int index) => SizedBox(
//                                 height: 10,
//                               ),
//                             ),
//                             selector: (ctx, profileProvider) =>
//                                 profileProvider.myOrderFormItems,
//                           ),
//                   ),
//                   SizedBox(
//                     height: 100,
//                   ),
//                 ],
//               )
//             : Center(
//                 child: Text('عدم اتصال به اینترنت'),
//               ),
//       ),
//       floatingActionButton: AddFormButton(
//         mainFontColor: _mainFontColor,
//         deviceBlockSize: _deviceBlockSize,
//       ),
//     );
//   }
// }

// class OrderFormDataRow extends StatelessWidget {
//   const OrderFormDataRow({
//     Key key,
//     @required double deviceBlockSize,
//     @required Color mainFontColor,
//     @required double deviceHeightBlockSize,
//     @required Color secondColor,
//     @required String index,
//     @required MyOrderFormItem item,
//     @required ProfileProvider profProvider,
//   })  : _deviceBlockSize = deviceBlockSize,
//         _mainFontColor = mainFontColor,
//         _deviceHeightBlockSize = deviceHeightBlockSize,
//         _secondColor = secondColor,
//         _index = index,
//         _item = item,
//         _profileProvider = profProvider,
//         super(key: key);
//   final double _deviceBlockSize;
//   final Color _mainFontColor;
//   final double _deviceHeightBlockSize;
//   final Color _secondColor;
//   final String _index;
//   final MyOrderFormItem _item;
//   final ProfileProvider _profileProvider;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       margin: EdgeInsets.symmetric(horizontal: 20),
//       elevation: 5,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 7.5),
//         child: Row(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 3 * _deviceBlockSize,
//               ),
//               child: Column(
//                 children: <Widget>[
//                   InkWell(
//                     onTap: () async => Navigator.of(context).pushNamed(
//                       Routes.profileOrderFormUpdateScreen,
//                       arguments: {
//                         'id': _item.id,
//                         'title': _item.name,
//                         'description': _item.description,
//                         'media': _item.image,
//                       },
//                     ),
//                     child: Container(
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: _mainFontColor,
//                         boxShadow: [
//                           BoxShadow(
//                             color: _mainFontColor,
//                             spreadRadius: 0,
//                             blurRadius: 5,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Icon(
//                         Icons.edit,
//                         color: Colors.white,
//                         size: 5 * _deviceBlockSize,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: _deviceHeightBlockSize,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       _profileProvider.deleteMyOrderItems(_item.id);
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.red,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.red,
//                             spreadRadius: 0,
//                             blurRadius: 5,
//                             offset: Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                       ),
//                       child: Icon(
//                         Icons.delete,
//                         color: Colors.white,
//                         size: 5 * _deviceBlockSize,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               decoration: BoxDecoration(
//                 border: Border(
//                   right: BorderSide(
//                     color: Color.fromRGBO(220, 220, 220, 1),
//                   ),
//                   left: BorderSide(
//                     color: Color.fromRGBO(220, 220, 220, 1),
//                   ),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Container(
//                     width: _deviceBlockSize * 60,
//                     child: Text(
//                       _item.name,
//                       textDirection: TextDirection.rtl,
//                       style: TextStyle(
//                         fontSize: 4 * _deviceBlockSize,
//                       ),
//                       overflow: TextOverflow.clip,
//                     ),
//                   ),
//                   Text(
//                     _item.date,
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       fontSize: 3 * _deviceBlockSize,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   SizedBox(
//                     height: _deviceHeightBlockSize,
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       vertical: 5,
//                       horizontal: 10,
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(5),
//                         bottomLeft: Radius.circular(5),
//                         bottomRight: Radius.circular(5),
//                       ),
//                       color:
//                           _item.isProccessing ? _secondColor : _mainFontColor,
//                     ),
//                     child: Text(
//                       _item.isProccessing ? 'در حال پردازش' : 'قیمت دهی شد',
//                       textDirection: TextDirection.rtl,
//                       style: TextStyle(
//                         color: _mainFontColor,
//                         fontSize: 3 * _deviceBlockSize,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Text(
//                 '$_index',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: 'montserrat',
//                   fontSize: 8 * _deviceBlockSize,
//                   color: _mainFontColor,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AddFormButton extends StatelessWidget {
//   final Color mainFontColor;
//   final double deviceBlockSize;

//   const AddFormButton({Key key, this.mainFontColor, this.deviceBlockSize})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Container(
//         margin: EdgeInsets.only(left: 40),
//         child: CircleAvatar(
//           radius: 6 * deviceBlockSize,
//           backgroundColor: mainFontColor,
//           child: IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () async => await Navigator.of(context)
//                 .pushNamed(Routes.profileOrderFormAddScreen),
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
