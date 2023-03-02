import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Cores/Widgets/global-appbar.dart';
import '../../../Cores/Widgets/header2.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/urls.dart';
import '../../../Cores/Config/user.dart';
import '../../../Cores/Widgets/loading_widget.dart';
import '../../Home/Widgets/product.dart';
import '../Models/category.dart';
import '../Models/category_products.dart';

class CategoryProductsScreen extends StatelessWidget {
  static const route = '/ProductsCategoryListsScreen';

  const CategoryProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductListProvider>(
      create: (ctx) => ProductListProvider(
          ModalRoute.of(context)!.settings.arguments as CategoryModel?),
      child: const CategoryProductsScreenTile(),
    );
  }
}

class CategoryProductsScreenTile extends StatefulWidget {
  const CategoryProductsScreenTile({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryProductsScreenTileState createState() =>
      _CategoryProductsScreenTileState();
}

class _CategoryProductsScreenTileState
    extends State<CategoryProductsScreenTile> {
  @override
  initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<ProductListProvider>(context, listen: false)
          .getDatas(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListProvider>(
      builder: (ctx, provider, _) => Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        appBar: PreferredSize(
          child: SimpleAppbar('بازگشت'),
          preferredSize: Size(double.infinity, 40),
        ),
        body: provider.isLoading
            ? const Center(
                child: LoadingWidget(
                  mainFontColor: Colors.black,
                ),
              )
            : NotificationListener(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    if (provider.scrollController.position.pixels >
                            provider.scrollController.position.maxScrollExtent -
                                30 &&
                        !provider.isLoadingMore) {
                      provider.getDatas(context);
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async =>
                      provider.getDatas(context, resetPage: true),
                  child: ListView(
                    controller: provider.scrollController,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: SimpleHeader2(provider.parentCategory!.name,
                            provider.parentCategory!.nameE),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        // height: User.deviceHeigth,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 5 / 6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (ctx, ind) => ProductItemCard(
                            provider.products[ind],
                          ),
                          itemCount: provider.products.length,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class ProductListProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();

  int currentPage = 1;
  List<CategoryProductsModel> products = [];
  final CategoryModel? parentCategory;

  bool lockPage = false;

  ProductListProvider(this.parentCategory);

  getDatas(BuildContext context, {bool resetPage = false}) async {
    if (resetPage) {
      currentPage = 1;
      lockPage = false;
    }
    if (lockPage) return;
    if (currentPage == 1) {
      products = [];
      isLoading = true;
      // scrollController.jumpTo(0);
      notifyListeners();
    } else {
      isLoadingMore = true;
      notifyListeners();
    }
    print(currentPage);
    var response = await http.get(
        Uri.parse(Urls.getProducts(parentCategory!.id, currentPage.toString())),
        headers: {
          'Authorization': User.token,
          'Module': 'crm',
          'origin': Urls.domain,
        });
    var result = json.decode(response.body);
    try {
      result['data'].forEach((element) {
        products.add(CategoryProductsModel.fromJson(element));
        // print(result['children']);
      });
      if (currentPage == 1) {
        currentPage += 1;
        isLoading = false;
        notifyListeners();
      } else {
        if (result['data'].length > 0) {
          currentPage += 1;
        } else {
          lockPage = true;
        }
        isLoadingMore = false;
        notifyListeners();
      }
    } catch (e) {}
  }

  @override
  void reassemble() {}
}
