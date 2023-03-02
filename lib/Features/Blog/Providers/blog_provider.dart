import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/urls.dart';
import '../../../Cores/Models/date-convertor.dart';
import '../../../Cores/Models/request.dart';
import '../Entities/blog_item.dart';

class BlogProvider extends ChangeNotifier with ReassembleHandler {
  bool isLoading = false;
  List<BlogItem> items = [];
  BlogEntity blogEntity = new BlogEntity();
  // String _token;
  // String get token => _token;
  // void setToken(String token) {
  //   _token = token;
  // }

  getItems(bool secondTime, {int page = 1, bool reset = false}) async {
    isLoading = true;
    if (reset) {
      items = [];
    }
    if (secondTime) {
      notifyListeners();
    }
    if (page == 1) {
      items = await blogEntity.getItems(page.toString());
    } else {
      items += await blogEntity.getItems(page.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  BlogItem getSingleItem(String? id) {
    return items.firstWhere((element) => element.id == id);
  }

  @override
  void reassemble() {}
}

class BlogEntity {
  ServerRequest serverRequest = new ServerRequest();
  Future<List<BlogItem>> getItems(String page) async {
    var requestResult = await serverRequest.get(
      Urls.getBlogItems + '&page=$page',
      {
        // 'Authorization': 'Bearer ' + token,
        'Module': 'blog',
        'origin': Urls.domain,
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/json',
      },
    );
    // print(requestResult);
    return parseGottenItems(requestResult);
  }

  List<BlogItem> parseGottenItems(dynamic datas) {
    List<BlogItem> items = [];
    try {
      for (var item in datas['data']) {
        // print(DateConvertor(item['created_at'].toString()).convert());
        // var val = pdate.parse(item['created_at'].toString());

        items.add(
          BlogItem(
            item['id'].toString(),
            item['scheme'].toString(),
            item['title'].toString(),
            item['abstract'].toString(),
            item['content'].toString(),
            DateConvertor(item['created_at'].toString()).convert(),
            item['thumbnail'].toString(),
            item['user']['name'].toString(),
            item['comments_count'].toString(),
            item['likes_count'].toString(),
          ),
        );
      }
    } catch (e) {}

    // for (var item in items) {
    //   print(item.content);
    // }
    return items;
  }
}
