// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:random_string/random_string.dart';

// import '../../../../Cores/Models/request_result.dart';
// import '../../../../Cores/Providers/connectivity.dart';
// import '../../../../Cores/Widgets/alert_dialog.dart';
// import '../../../../Cores/Widgets/global-appbar.dart';
// import '../../../../Cores/Widgets/header2.dart';
// import '../../../../Cores/Widgets/loading_widget.dart';
// import '../../Providers/profile.dart';

// // import '../../Models/request_result.dart';
// // import '../../Providers/profile.dart';
// // import '../../Widgets/Global/global-appbar.dart';
// // import '../../Widgets/Global/header2.dart';
// // import '../../Widgets/Global/loading_widget.dart';

// class ProfileOrderFormAddScreen extends StatefulWidget {
//   @override
//   _ProfileOrderFormAddScreenState createState() =>
//       _ProfileOrderFormAddScreenState();
// }

// class _ProfileOrderFormAddScreenState extends State<ProfileOrderFormAddScreen> {
//   final batchId = randomString(50);
//   final TextEditingController _titleCtrl = new TextEditingController();
//   final TextEditingController _descriptionCtrl = new TextEditingController();
//   Future<void> loadAssets(BuildContext context) async {
//     var profileProviderObject =
//         Provider.of<ProfileProvider>(context, listen: false);
//     List<Asset> resultList = List<Asset>();
//     try {
//       resultList = await MultiImagePicker.pickImages(
//         maxImages: 5,
//         selectedAssets: profileProviderObject.catchImages,
//         materialOptions: MaterialOptions(
//           useDetailsView: false,
//         ),
//         enableCamera: true,
//       );
//     } catch (_) {}
//     profileProviderObject.setCatchImages(resultList);
//     profileProviderObject.setImages();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Provider.of<ProfileProvider>(context, listen: false).resetLoading();
//     final ThemeData _theme = Theme.of(context);
//     final Color _mainFontColor = _theme.primaryColor;
//     final Color _secondColor = _theme.accentColor;
//     final _media = MediaQuery.of(context);
//     final double _devicewidth = _media.size.width;
//     final double _deviceBlockSize = _devicewidth / 100;
//     final double _deviceHeight = _media.size.height;
//     final double _deviceHeightBlockSize = _deviceHeight / 100;

//     return Scaffold(
//         appBar: PreferredSize(
//           child: SimpleAppbar('?????? ?????? ?????????? ????'),
//           preferredSize: Size(double.infinity, 7 * _deviceHeightBlockSize),
//         ),
//         body: Consumer<ConnectivityProvider>(
//           builder: (ctx, conProvider, _) => conProvider
//                   .conSt(conProvider.conStatus)
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: <Widget>[
//                       SimpleHeader2('?????? ?????????? ????????', 'NEW ORDER'),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Consumer<ProfileProvider>(
//                         builder: (ctx, profProvider, _) => profProvider
//                                 .isLoading
//                             ? LoadingWidget(mainFontColor: _mainFontColor)
//                             : Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: <Widget>[
//                                   Directionality(
//                                     textDirection: TextDirection.rtl,
//                                     child: TextFormField(
//                                       controller: _titleCtrl,
//                                       decoration: InputDecoration(
//                                         icon: SizedBox(
//                                           width: 10,
//                                           height: 10,
//                                           child: Icon(
//                                             FontAwesomeIcons.tag,
//                                             size: 5 * _deviceBlockSize,
//                                           ),
//                                         ),
//                                         labelText: '?????????? ??????????',
//                                         isDense: true,
//                                       ),
//                                       textDirection: TextDirection.rtl,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: _deviceHeightBlockSize,
//                                   ),
//                                   Directionality(
//                                     textDirection: TextDirection.rtl,
//                                     child: TextFormField(
//                                       controller: _descriptionCtrl,
//                                       decoration: InputDecoration(
//                                         alignLabelWithHint: true,
//                                         icon: SizedBox(
//                                           width: 10,
//                                           height: 10,
//                                           child: Icon(
//                                             FontAwesomeIcons.quoteRight,
//                                             size: 5 * _deviceBlockSize,
//                                           ),
//                                         ),
//                                         labelText: '?????????????? ??????????',
//                                         isDense: true,
//                                       ),
//                                       minLines: 7,
//                                       maxLines: 7,
//                                       textDirection: TextDirection.rtl,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5 * _deviceHeightBlockSize,
//                                   ),
//                                   Container(
//                                     height: 70,
//                                     child: Directionality(
//                                       textDirection: TextDirection.rtl,
//                                       child: SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: <Widget>[
//                                             ImageBox(
//                                               deviceBlockSize: _deviceBlockSize,
//                                               profileProvider: profProvider,
//                                             ),
//                                             SizedBox(
//                                               width:
//                                                   profProvider.images.length !=
//                                                           0
//                                                       ? 3 * _deviceBlockSize
//                                                       : 0,
//                                             ),
//                                             InkWell(
//                                               onTap: () async {
//                                                 await loadAssets(context);
//                                               },
//                                               child: Container(
//                                                 width: 60,
//                                                 height: 60,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(5),
//                                                   color: _secondColor,
//                                                 ),
//                                                 child: Icon(
//                                                   Icons.camera_alt,
//                                                   size: 30,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   InkWell(
//                                     onTap: () async {
//                                       if (profProvider.networkImages.length +
//                                                 profProvider.images.length ==
//                                             0) {
//                                           await showDialog(
//                                             context: context,
//                                             builder: (ctx) => GlobalAlertDialog(
//                                               title: '??????',
//                                               content:
//                                                   '???????? ?????????? ???? ?????? ???? ???????????? ????????!',
//                                             ),
//                                           );
//                                           return;
//                                         }
//                                         if (_titleCtrl.text.length == 0) {
//                                           await showDialog(
//                                             context: context,
//                                             builder: (ctx) => GlobalAlertDialog(
//                                               title: '??????',
//                                               content:
//                                                   '?????????? ?????? ?????????? ???????? ????????!',
//                                             ),
//                                           );
//                                           return;
//                                         }
//                                       await Provider.of<ProfileProvider>(
//                                               context,
//                                               listen: false)
//                                           .addMyOrderItems(
//                                         _titleCtrl.text,
//                                         _descriptionCtrl.text,
//                                         batchId,
//                                       )
//                                           .then(
//                                         (result) async {
//                                           if (result == RequestResult.Accept) {
//                                             await Provider.of<ProfileProvider>(
//                                                     context,
//                                                     listen: false)
//                                                 .getMyOrderItems(true);
//                                             Navigator.of(context).pop();
//                                             await showDialog(
//                                               context: context,
//                                               builder: (ctx) =>
//                                                   GlobalAlertDialog(
//                                                 title: '',
//                                                 content:
//                                                     '?????????? ???????????????? ?????????? ????.',
//                                               ),
//                                             );
//                                           } else {
//                                             await showDialog(
//                                               context: context,
//                                               builder: (ctx) =>
//                                                   GlobalAlertDialog(
//                                                 title: '??????',
//                                                 content:
//                                                     '?????????? ???? ???????? ??????.???????????? ???????????? ????????.',
//                                               ),
//                                             );
//                                           }
//                                         },
//                                       );
//                                     },
//                                     child: Container(
//                                       margin: EdgeInsets.only(
//                                         top: 8 * _deviceHeightBlockSize,
//                                         bottom: 4 * _deviceHeightBlockSize,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: _mainFontColor,
//                                       ),
//                                       height: 40,
//                                       width: double.infinity,
//                                       child: Center(
//                                         child: Text(
//                                           '?????? ??????????',
//                                           textDirection: TextDirection.rtl,
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                       )
//                     ],
//                   ),
//                 )
//               : Center(
//                   child: Text('?????? ?????????? ???? ??????????????'),
//                 ),
//         ));
//   }
// }

// class ImageBox extends StatelessWidget {
//   const ImageBox({
//     Key key,
//     @required double deviceBlockSize,
//     @required ProfileProvider profileProvider,
//   })  : _deviceBlockSize = deviceBlockSize,
//         _profileProvider = profileProvider,
//         super(key: key);

//   final double _deviceBlockSize;
//   final ProfileProvider _profileProvider;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (ctx, index) => ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Container(
//           width: 60,
//           height: 60,
//           child: Stack(
//             children: <Widget>[
//               Positioned(
//                 top: 10,
//                 left: 0,
//                 child: GestureDetector(
//                   onTap: () => Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (_) => Container(
//                         color: Colors.white,
//                         child: Center(
//                           child: Image.memory(
//                             _profileProvider.images[index],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   child: Image.memory(
//                     _profileProvider.images[index],
//                     // asset: _images[index],
//                     width: 60,
//                     height: 60,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 child: GestureDetector(
//                   onTap: () {
//                     // setState(() {
//                     _profileProvider.removeImage(index);
//                     // });
//                   },
//                   child: CircleAvatar(
//                     backgroundColor: Colors.red,
//                     radius: 10,
//                     child: Icon(
//                       Icons.close,
//                       size: 12,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       itemCount: _profileProvider.images.length,
//       separatorBuilder: (BuildContext context, int index) => SizedBox(
//         width: 3 * _deviceBlockSize,
//       ),
//     );
//   }
// }
