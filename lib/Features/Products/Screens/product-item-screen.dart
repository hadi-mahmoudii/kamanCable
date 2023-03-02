import 'package:flutter/material.dart';
import '../Widgets/ItemScreen/new-page-navigator.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../Entities/product.dart';
import '../Models/product.dart';
import '../Widgets/ItemScreen/attribute_variable.dart';
import '../Widgets/ItemScreen/item-details.dart';

class ProductItemScreen extends StatefulWidget {
  @override
  _ProductItemScreenState createState() => _ProductItemScreenState();
}

class _ProductItemScreenState extends State<ProductItemScreen> {
  ProductModel? product;
  String? id;
  bool isInit = true;
  // Map<String,Object> datas =
  // var _itemImage = 'assets/Images/5.jpg';
  // String _itemPersianName = 'کابل میکرو یو اس بی';
  // String _itemEnglishName = 'MICRO USB CABLE';
  // String _itemOrgPrice = '360.000';
  // String _itemOffPrice = '290.000';
  // String _itemDetails =
  //     'این صندلی علاوه بر اتاق نشیمن،علاوه بر اتاق های منزل،علاوه بر اتاق خالی،با یک طراحی در اواسط قرن،با زوایای بسیار عالی است.که مدرن راحت و شیک است و زیبا است';
  // String _itemitemOffPercent = '15';
  // double _itemStar = 5.0;
  // String _itemCommentsCount = '27';
  @override
  void didChangeDependencies() async {
    if (isInit) {
      id = ModalRoute.of(context)!.settings.arguments as String?;
      product = await ProductEntity().getProduct(id);
      setState(() {
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData _theme = Theme.of(context);
    // final Color _mainFontColor = _theme.primaryColor;
    // final Color _secondColor = _theme.accentColor;
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double User.deviceBlockSize = _devicewidth / 100;
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      // floatingActionButton: ShopFloatingButton(
      //   deviceWidthBlockSize: User.deviceBlockSize,
      //   deviceHeightBlockSize: _deviceHeightBlockSize,
      // ),
      appBar: PreferredSize(
        child: SimpleAppbar('بازگشت'),
        preferredSize: Size(double.infinity, 12 * User.deviceBlockSize),
      ),
      body: isInit
          ? Center(
              child: LoadingWidget(mainFontColor: Colors.black),
            )
          : SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: SimpleHeader2('جزئیات محصول', 'PRODUCT DETAILS'),
                    ),
                    // ProductItemImageSwiper(),
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 20,
                      ),
                      // height: User.deviceBlockSize * 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Card(
                        elevation: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(product!.image),
                            width: User.deviceWidth - 50,
                            height: User.deviceWidth - 50,
                          ),
                        ),
                      ),
                      // ),
                      // 70 * _pixelRatio,
                    ),
                    ProductsItemScreenDetails(
                      itemPersianName: product!.name,
                      itemEnglishName: product!.nameE,
                      itemDetails: product!.description,
                      itemStar: 3,
                      deviceBlockSize: User.deviceBlockSize,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                      child: Divider(
                        height: 10,
                        color: Colors.grey,
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) => AttributeVariableWidget(
                        attribute: product!.variablesAttribute[index],
                      ),
                      separatorBuilder: (ctx, index) => Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                        child: Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                      ),
                      itemCount: product!.variablesAttribute.length,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: NewPageNavigator(
                        title: 'مشخصات کالا',
                        // subtitle: 'مواد / ابعاد / رنگ',
                        boxIcon: 'details',
                        datas: product,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                      child: Divider(
                        height: 10,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: NewPageNavigator(
                        title: 'نظرات کاربران',
                        // subtitle: 'نظر 2',
                        boxIcon: 'comments',
                        datas: product!.id,
                      ),
                    ),
                    // ProductItemColorPicker(
                    //   deviceBlockSize: User.deviceBlockSize,
                    // ),
                    // ProductItemGuaranteeItem(),
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    //   child: Divider(
                    //     height: 10,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    // ProductItemPriceBox(
                    //   deviceBlockSize: User.deviceBlockSize,
                    //   itemOrgPrice: _itemOrgPrice,
                    //   itemOffPrice: _itemOffPrice,
                    //   itemOffPercent: _itemitemOffPercent,
                    //   mainColor: _mainFontColor,
                    //   secondColor: _secondColor,
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // NewPageNavigator(
                    //   title: 'مشخصات کالا',
                    //   subtitle: 'مواد / ابعاد / رنگ',
                    //   boxIcon: 'details',
                    // ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 20),
                    //   child: Divider(
                    //     height: 2,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    // NewPageNavigator(
                    //   title: 'نظرات کاربران',
                    //   subtitle: 'نظر 2',
                    //   boxIcon: 'comments',
                    // ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    //   child: Divider(
                    //     height: 2,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
