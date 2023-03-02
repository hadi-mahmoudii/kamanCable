import 'package:flutter/material.dart';

import '../../../Cores/Widgets/header2.dart';
import '../Widgets/Filter/drop-down-box.dart';
class ProductsFilterScreen extends StatefulWidget {
  static const route = '/ProductsFilterScreen';
  @override
  _ProductsFilterScreenState createState() => _ProductsFilterScreenState();
}

class _ProductsFilterScreenState extends State<ProductsFilterScreen> {
  @override
  Widget build(BuildContext context) {
    // final _media = MediaQuery.of(context);
    // final double _devicewidth = _media.size.width;
    // final double _deviceBlockSize = _devicewidth / 100;
    return Scaffold(
      // appBar: PreferredSize(
      //   child: SimpleAppbar('دسته بندی محصولات'),
      //   preferredSize: Size(double.infinity, 12 * _deviceBlockSize),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SimpleHeader2('فیلتر محصولات', 'FILTERS'),
              ),
              FilterDropDownBox(values: ['تلفن همراه','رایانه'])
            ],
          ),
        ),
      ),
    );
  }
}
