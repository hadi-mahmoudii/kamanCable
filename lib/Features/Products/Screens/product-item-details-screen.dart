import 'package:flutter/material.dart';
import '../Models/product.dart';

import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';
import '../Widgets/ItemDetails/product-item-details-table.dart';

class ProductItemDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: PreferredSize(
        child: SimpleAppbar('جزئیات محصول'),
        preferredSize: Size(double.infinity, 28),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SimpleHeader2('مشخصات کالا', 'PRODUCT DETAILS'),
            ),
            SizedBox(height: 10),
            ProductItemDetailsTable(
              datas: ModalRoute.of(context)!.settings.arguments as ProductModel,
              // properties:
              //     'مقاوم در برابر ضربه،دسترسی آسان به درگاه ،انعطاف پذیر،دارای پوشش نرم',
              // structure: 'مات',
              // type: 'پلاستیک',
            ),
          ],
        ),
      ),
    );
  }
}
