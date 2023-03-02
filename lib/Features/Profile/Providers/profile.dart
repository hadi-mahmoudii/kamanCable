// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:dio/dio.dart' as di;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:multi_image_picker/multi_image_picker.dart';
// import 'package:provider/provider.dart';

// import '../../../Cores/Config/urls.dart';
// import '../../../Cores/Config/user.dart';
// import '../../../Cores/Models/my_order_model.dart';
// import '../../../Cores/Models/request_result.dart';

// class ProfileProvider extends ChangeNotifier with ReassembleHandler {
//   @override
//   void reassemble() {}
//   bool isLoading = false;
//   List<Uint8List> images = [];
//   List<Asset> catchImages = [];
//   List<dynamic> networkImages = [];
//   setImages() async {
//     images = [];
//     for (var image in catchImages) {
//       var result = await image.getByteData(quality: 50);
//       images.add(result.buffer
//           .asUint8List(result.offsetInBytes, result.lengthInBytes));
//     }
//     notifyListeners();
//   }

//   setCatchImages(List<Asset> images) {
//     catchImages = images;
//     notifyListeners();
//   }

//   removeImage(int index) {
//     catchImages.removeAt(index);
//     images.removeAt(index);
//     notifyListeners();
//   }

//   setNetowrkImage(List<dynamic> images) {
//     networkImages = images;
//     // notifyListeners();
//   }

//   resetLoading() {
//     isLoading = false;
//     images = [];
//     catchImages = [];
//     // notifyListeners();
//   }

//   // String _token;
//   // String get token => _token;
//   // void setToken(String token) {
//   //   _token = token;
//   // }

//   MyOrderFroms _myOrderFormsObject = new MyOrderFroms();
//   List<MyOrderFormItem> _myOrderFormsItems = [];
//   List<MyOrderFormItem> get myOrderFormItems => _myOrderFormsItems;
//   Future<RequestResult> getMyOrderItems(bool firstTime) async {
//     isLoading = true;
//     if (!firstTime) {
//       // in first time we cant nitigy it raised error
//       notifyListeners();
//     }
//     await _myOrderFormsObject.getItems().then(
//       (result) {
//         if (result == RequestResult.Accept) {
//           _myOrderFormsItems = _myOrderFormsObject.items;
//           isLoading = false;
//           images = [];
//           catchImages = [];
//           notifyListeners();
//           return RequestResult.Accept;
//         } else {
//           return RequestResult.Reject;
//         }
//       },
//     );
//     return RequestResult.Accept;
//   }

//   Future<RequestResult> addMyOrderItems(
//     String title,
//     String description,
//     String batchId,
//     // List<Uint8List> images,
//   ) async {
//     isLoading = true;
//     notifyListeners();
//     // print(title);
//     // print(description);
//     // print(batchId);
//     for (var image in images) {
//       await addMyOrderItemsImage(
//         batchId,
//         image,
//       );
//     }

//     RequestResult _result;
//     await _myOrderFormsObject
//         .addItem(
//       title,
//       description,
//       batchId,
//     )
//         .then(
//       (result) {
//         _result = result;
//         if (result == RequestResult.Accept) {
//           // _myOrderFormsItems.add(
//           //   MyOrderFormItem(
//           //     'test',
//           //     title,
//           //     description,
//           //     'چهارشنبه، 22 بهمن 98',
//           //     true,
//           //     ['image'],
//           //   ),
//           // );
//         }
//       },
//     );
//     return _result;
//   }

//   Future<RequestResult> updateMyOrderItems(
//       String id, String title, String description, String batchId) async {
//     isLoading = true;
//     notifyListeners();
//     // print(title);
//     // print(description);
//     // print(batchId);
//     for (var image in images) {
//       await addMyOrderItemsImage(
//         batchId,
//         image,
//       );
//     }
//     RequestResult _result;
//     await _myOrderFormsObject.updateItem(id, title, description, batchId).then(
//       (result) {
//         _result = result;
//         _myOrderFormsItems = [];
//         isLoading = false;
//         images = [];
//         catchImages = [];
//         networkImages = [];
//         notifyListeners();
//       },
//     );
//     return _result;
//   }

//   Future<RequestResult> deleteMyOrderItems(
//     String id,
//   ) async {
//     isLoading = true;
//     notifyListeners();
//     RequestResult _result;
//     await _myOrderFormsObject.deleteItem(id).then(
//       (result) {
//         _result = result;
//         _myOrderFormsItems.removeWhere((item) => item.id == id);
//         isLoading = false;
//         notifyListeners();
//       },
//     );
//     return _result;
//   }

//   Future<RequestResult> addMyOrderItemsImage(
//       String batchId, dynamic file) async {
//     await _myOrderFormsObject
//         .addImage(batchId, file)
//         .then((value) => RequestResult.Accept);
//     return RequestResult.Accept;
//   }

//   Future<RequestResult> removeMyOrderItemsImage(String id) async {
//     isLoading = true;
//     notifyListeners();
//     await _myOrderFormsObject.removeImage(id).then((value) {
//       networkImages.removeWhere((item) => item['id'].toString() == id);
//       isLoading = false;
//       notifyListeners();
//       return RequestResult.Accept;
//     });
//     return RequestResult.Accept;
//   }
// }

// class MyOrderFroms {
//   List<MyOrderFormItem> _items = [];
//   List<MyOrderFormItem> get items => _items;

//   Future<RequestResult> getItems() async {
//     _items = [];
//     var response = await http.get(Uri.parse(Urls.getMyOrderForms), headers: {
//       'Authorization': User.token,
//       'Module': 'crm',
//       'origin': Urls.domain,
//     });
//     var resultData = json.decode(response.body);
//     for (var item in resultData['data']) {
//       _items.add(
//         MyOrderFormItem(
//           item['id'].toString(),
//           item['title'].toString() != 'null' ? item['title'].toString() : '',
//           item['description'].toString() != 'null'
//               ? item['description'].toString()
//               : '',
//           item['created_at'].toString().substring(0, 10),
//           item['order_photo_status'] == null ? true : false,
//           item['media'],
//         ),
//       );
//       // print(item);
//     }

//     return RequestResult.Accept;
//   }

//   Future<RequestResult> addItem(
//     String title,
//     String description,
//     String batchId,
//   ) async {
//     await http.post(
//       Uri.parse(Urls.addMyOrderForms),
//       body: {
//         'title': title,
//         'description': description,
//         'file_batch_id': batchId,
//       },
//       headers: {
//         'Authorization': User.token,
//         'Module': 'crm',
//         'origin': Urls.domain,
//         'X-Requested-With': 'XMLHttpRequest'
//       },
//     );
//     // var resultData = json.decode(response.body);
//     // print(resultData);
//     return RequestResult.Accept;
//   }

//   Future<RequestResult> updateItem(
//     String id,
//     String title,
//     String description,
//     String batchId,
//   ) async {
//     await http.post(
//       Uri.parse(Urls.updateMyOrderForms(id)),
//       body: json.encode(
//         {
//           'title': title,
//           'description': description,
//           'file_batch_id': batchId,
//           '_method': 'put',
//         },
//       ),
//       headers: {
//         'Authorization': User.token,
//         'module': 'crm',
//         'origin': Urls.domain,
//         'X-Requested-With': 'XMLHttpRequest',
//         'Content-Type': 'application/json',
//       },
//     );
//     // var resultData = json.decode(response.body);
//     // print(resultData);
//     //add proccess

//     return RequestResult.Accept;
//   }

//   Future<RequestResult> deleteItem(String id) async {
//     var response = await http.delete(
//       Uri.parse(Urls.deleteMyOrderForms(id)),
//       headers: {
//         'Authorization': User.token,
//         'Module': 'crm',
//         'origin': Urls.domain,
//       },
//     );
//     var resultData = json.decode(response.body);
//     // print(resultData);
//     try {
//       if (resultData['message']['title'] == 'موفق') return RequestResult.Accept;
//     } catch (e) {}
//     return RequestResult.Reject;
//   }

//   Future<RequestResult> addImage(String batchId, dynamic file) async {
//     var imageListInt = file.cast<int>();
//     var dio = new di.Dio();
//     dio.options.headers = {
//       'Authorization': User.token,
//       'Module': 'crm',
//       'origin': Urls.domain,
//       'X-Requested-With': 'XMLHttpRequest'
//     };
//     di.FormData formData = new di.FormData.fromMap({
//       "batch_id": batchId,
//       "file": di.MultipartFile.fromBytes(imageListInt, filename: 'test.jpg')
//     });

//     await dio.post(
//       Urls.addImage,
//       data: formData,
//     );
//     // print(response.data);

//     return RequestResult.Accept;
//   }

//   Future<RequestResult> removeImage(String id) async {
//     await http.delete(
//       Uri.parse(Urls.removeImage(id)),
//       headers: {
//         'Authorization': User.token,
//         'Module': 'crm',
//         'origin': Urls.domain,
//         'X-Requested-With': 'XMLHttpRequest',
//         'Content-Type': 'application/json',
//       },
//     );
//     // var resultData = json.decode(response.body);
//     // print(resultData);
//     return RequestResult.Accept;
//   }
// }
