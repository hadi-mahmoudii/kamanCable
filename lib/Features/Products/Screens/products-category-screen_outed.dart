// import 'package:flutter/material.dart';
// import 'package:kamancable/Cores/Config/user.dart';
// import 'package:kamancable/Cores/Widgets/loading_widget.dart';
// import 'package:kamancable/Features/Products/Entities/product.dart';
// import 'package:kamancable/Features/Products/Models/category_products.dart';
// import 'package:kamancable/Features/Products/Models/product.dart';
// import 'package:provider/provider.dart';

// import '../../../Cores/Widgets/global-appbar.dart';
// import '../../../Cores/Widgets/header2.dart';
// import '../Widgets/Category/products-category-navigation-box.dart';

// class ProductsCategoryScreen extends StatefulWidget {
//   // final String pHeader = 'کابل و سیم ها';
//   // final String eHeader = 'WIRES AND CABLES';
//   static const route = '/ProductsCategoryScreen';
//   @override
//   _ProductsCategoryScreenState createState() => _ProductsCategoryScreenState();
// }

// class _ProductsCategoryScreenState extends State<ProductsCategoryScreen> {
//   String pHeader;
//   String eHeader;
//   bool isInit = true;

//   List<CategoryProductsModel> datas = [];
//   @override
//   void didChangeDependencies() async {
//     List<String> args = ModalRoute.of(context).settings.arguments;
//     pHeader = args[0];
//     eHeader = args[1];
//     // datas = await ProductOverviewEntity().getProducts(args[2]);

//     setState(() {
//       isInit = false;
//     });
//     super.didChangeDependencies();
//   }
//   // @override
//   // void initState() {

//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> items = [
//       {
//         'pName': 'کابل های تخت',
//         'eName': 'WIRES AND CABLES',
//       },
//     ];
//     var sizes = MediaQuery.of(context).size;
//     Provider.of<User>(context, listen: false).setSizes(sizes);
//     // final _media = MediaQuery.of(context);
//     // final double _devicewidth = _media.size.width;
//     // final double _deviceBlockSize = _devicewidth / 100;
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xFFF9F9F9),
//         // floatingActionButton: ShopFloatingButton(
//         //   deviceWidthBlockSize: _deviceBlockSize,
//         //   deviceHeightBlockSize: _deviceHeightBlockSize,
//         // ),
//         appBar: PreferredSize(
//           child: SimpleAppbar('همه ی دسته بندی ها'),
//           preferredSize: Size(double.infinity, 40),
//         ),
//         body: isInit
//             ? Center(child: LoadingWidget(mainFontColor: Colors.black))
//             : SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
//                   child: Column(
//                     children: <Widget>[
//                       SimpleHeader2(pHeader, eHeader),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       ListView.separated(
//                         physics: NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemBuilder: (ctx, index) => ProductsCategoryBox(
//                           product: datas[index],
//                         ),
//                         separatorBuilder: (ctx, ind) => Container(
//                           margin: EdgeInsets.only(bottom: 7),
//                           child: Divider(
//                             height: 3,
//                           ),
//                         ),
//                         itemCount: datas.length,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }
