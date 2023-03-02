import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/five_navigation_button.dart';
import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../Entities/category.dart';
import '../Models/category.dart';
import '../Widgets/Main/category-navigation-box.dart';

class CategoryScreen extends StatefulWidget {
  static const route = '/CategoryScreen';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isInit = true;
  List<CategoryModel> datas = [];
  CategoryModel? parentDatas;
  // List<Map<String, String>> items = [
  //   {
  //     'pName': 'کابل و سیم ها',
  //     'eName': 'WIRES AND CABLES',
  //     'count': '12',
  //   },
  // ];
  @override
  void didChangeDependencies() async {
    if (isInit) {
      parentDatas = ModalRoute.of(context)!.settings.arguments as CategoryModel?;
      datas = await CategoryEntity().getCategories(parentDatas!.id);
      setState(() {
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    Provider.of<User>(context, listen: false).setSizes(sizes);
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      // floatingActionButton: ShopFloatingButton(deviceWidthBlockSize: _deviceWidthBlockSize, deviceHeightBlockSize: _deviceHeightBlockSize),
      appBar: PreferredSize(
        child: SimpleAppbar('بازگشت'),
        preferredSize: Size(double.infinity, 40),
      ),
      body: isInit
          ? Center(
              child: LoadingWidget(mainFontColor: Colors.black),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SimpleHeader2(parentDatas!.name, parentDatas!.nameE),
                    SizedBox(height: 20),
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) => CategoryNavigationBox(
                              category: datas[index],
                            ),
                        separatorBuilder: (ctx, ind) => Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Divider(
                                height: 3,
                              ),
                            ),
                        itemCount: datas.length),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: FiveNavigationButton(
        curIndex: 2,
        mainFontColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
