import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Cores/Config/urls.dart';
import '../../../Cores/Config/user.dart';
import '../../../Cores/Models/date-convertor.dart';
import '../../../Cores/Models/request.dart';
import '../../../Cores/Models/request_result.dart';
import '../Entities/comment_item.dart';

class CommentProvider extends ChangeNotifier with ReassembleHandler {
  @override
  void reassemble() {}
  bool isLoading = false;
  List<CommentItem> items = [];
  CommentEntity commentEntity = new CommentEntity();
  // String _token;
  // String get token => _token;
  // void setToken(String token) {
  //   _token = token;
  // }

  getItems(String? id, String? type, bool secondTime, {int page = 1}) async {
    //when use function for second time in a page need notify
    isLoading = true;
    if (secondTime) {
      notifyListeners();
    }
    // print(page);
    if (page == 1) {
      items = await commentEntity.getItems(id, type, page.toString());
    } else {
      items += await commentEntity.getItems(id, type, page.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  sendComment(String? id, String? type, String content) async {
    isLoading = true;
    notifyListeners();
    await commentEntity.sendComment(id, type, content);
    isLoading = false;
    notifyListeners();
  }
}

class CommentEntity {
  ServerRequest serverRequest = new ServerRequest();
  Future<List<CommentItem>> getItems(
    String? id,
    String? type,
    String page,
  ) async {
    var result = await serverRequest.get(
      Urls.getComments(id, type) + '&page=$page',
      {
        'Authorization': User.token,
        'Module': type == 'product' ? 'product' : 'blog',
        'origin': Urls.domain,
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/json'
      },
    );
    // print(result);
    return parseGottenItems(result);
  }

  List<CommentItem> parseGottenItems(dynamic datas) {
    List<CommentItem> items = [];
    try {
      for (var item in datas['data']) {
        items.add(
          CommentItem(
            item['id'].toString(),
            item['scheme'].toString(),
            item['message'].toString(),
            DateConvertor(item['created_at'].toString()).convert(),
            item['user']['name'].toString(),
          ),
        );
      }
    } catch (e) {}

    return items;
  }

  Future<RequestResult> sendComment(
      String? id, String? type, String content) async {
    await serverRequest.post(
      Urls.sendComment,
      {
        'Authorization': User.token,
        'Module': type == 'product' ? 'product' : 'blog',
        'origin': Urls.domain,
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/json'
      },
      {
        'message': content,
        'rel_id': id,
        'rel_type': type,
      },
    );
    // print('done');
    return RequestResult.Accept;
  }
}
