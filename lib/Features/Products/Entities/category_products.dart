import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../Cores/Config/urls.dart';
import '../../../Cores/Config/user.dart';
import '../Models/category_products.dart';

class CategoryProductsEntity {
  Future<List<CategoryProductsModel>> getProducts(String id,String page) async {
    var response = await http.get(Uri.parse(Urls.getProducts(id,page)), headers: {
      'Authorization': User.token,
      'Module': 'crm',
      'origin': Urls.domain,
    });
    // print(response.body);
    return parseRequest(response.body);
  }

  List<CategoryProductsModel> parseRequest(String datas) {
    var resultData = json.decode(datas);
    List<CategoryProductsModel> results = [];
    resultData['data'].forEach((element) {
      // print(element);
      results.add(CategoryProductsModel.fromJson(element));
    });
    return results;
  }
}
