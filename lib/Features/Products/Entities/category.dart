import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../Cores/Config/urls.dart';
import '../../../Cores/Config/user.dart';
import '../Models/category.dart';

class CategoryEntity {
  Future<List<CategoryModel>> getCategories(String id) async {
    var response = await http.get(Uri.parse(Urls.getCategories(id)), headers: {
      'Authorization': User.token,
      'Module': 'crm',
      'origin': Urls.domain,
    });
    // print(response.body);
    return parseRequest(response.body);
  }

  List<CategoryModel> parseRequest(String datas) {
    var resultData = json.decode(datas);
    List<CategoryModel> results = [];
    resultData['data'].forEach((element) {
      // print(element);
      results.add(CategoryModel.fromJson(element));
    });
    return results;
  }
}
