import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../Cores/Config/urls.dart';
import '../../../Cores/Config/user.dart';
import '../Models/product.dart';

class ProductEntity {
  Future<ProductModel> getProduct(String? id) async {
    var response = await http.get(Uri.parse(Urls.getProduct(id)), headers: {
      'Authorization': User.token,
      'Module': 'crm',
      'origin': Urls.domain,
    });
    return parseRequest(response.body);
  }

  ProductModel parseRequest(String datas) {
    var resultData = json.decode(datas);
    ProductModel result;
    result = ProductModel.fromJson(resultData['data']);
    // print(resultData['data']);
    return result;
  }
}
