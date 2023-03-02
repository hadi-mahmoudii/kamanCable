// import 'package:persian_date/persian_date.dart';

import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class GlobalEntity {
  // Future<bool> addFiles(UserDetailsObject user, List<File> files) async {
  //   final batchId = randomString(50);
  //   for (var file in files) {
  //     await addImage(batchId, file.readAsBytesSync());
  //   }
  //   var dio = new di.Dio();
  //   dio.options.headers = {
  //     'Authorization': AppSession.token,
  //     // 'X-Requested-With': 'XMLHttpRequest'
  //   };
  //   var response = await http.put(
  //     Urls.updateClient(user.id),
  //     headers: {
  //       'Authorization': AppSession.token,
  //       'Module': 'crm',
  //       'origin': Urls.domain,
  //       'X-Requested-With': 'XMLHttpRequest'
  //     },
  //     body: {'file_batch_id': batchId, 'cell_number': '3226'},
  //   );
  //   // print(response.body);
  //   return true;
  // }

  // Future<bool> taskAddFiles(ClientTaskObject task, List<File> files) async {
  //   final batchId = randomString(50);
  //   for (var file in files) {
  //     await addImage(batchId, file.readAsBytesSync());
  //   }
  //   var dio = new di.Dio();
  //   dio.options.headers = {
  //     'Authorization': AppSession.token,
  //     // 'X-Requested-With': 'XMLHttpRequest'
  //   };
  //   var response = await http.put(
  //     Urls.tasks + '/${task.id}',
  //     headers: {
  //       'Authorization': AppSession.token,
  //       'Module': 'crm',
  //       'origin': Urls.domain,
  //       'X-Requested-With': 'XMLHttpRequest'
  //     },
  //     body: {'file_batch_id': batchId, 'cell_number': '3226'},
  //   );
  //   // print(response.body);
  //   return true;
  // }

  // Future<String> addImage(String batchId, dynamic file) async {
  //   var imageListInt = file.cast<int>();
  //   var dio = new di.Dio();
  //   dio.options.headers = {
  //     'Authorization': AppSession.token,
  //     'Module': 'crm',
  //     'origin': Urls.domain,
  //     'X-Requested-With': 'XMLHttpRequest'
  //   };
  //   di.FormData formData = new di.FormData.fromMap({
  //     "batch_id": batchId,
  //     "file": di.MultipartFile.fromBytes(imageListInt, filename: 'test.jpg')
  //   });

  //   var response = await dio.post(
  //     Urls.addImage,
  //     data: formData,
  //   );
  //   // print(response.data);

  //   return 'true';
  // }

  // Future<List<Map<String, Object>>> downloadMedias(List<String> medias) async {
  //   List<Map<String, Object>> files = [];
  //   for (var media in medias) {
  //     await http.get(media).then(
  //           (value) => files.add(
  //             {
  //               'file': value.bodyBytes,
  //               'isNewFile': false,
  //             },
  //           ),
  //         );
  //   }
  //   return files;
  // }

  static String dataFilter(String data, {String replacement = ''}) {
    if (data == 'null' ||
        data == 'NULL' ||
        data == '[]' ||
        data == '{}' ) {
      return replacement;
    } else {
      return data;
    }
  }

  String dateConvert(String date) {
   try {
      DateTime dat = DateTime.parse(date);
      Jalali g = Jalali.fromDateTime(dat);
      return g.formatFullDate();
    } catch (e) {
      return '-';
    }
  }

  // String paymentTranslate(String payment) {
  //   if (payment == 'cash') {
  //     return 'نقد';
  //   } else if (payment == 'pos') {
  //     return 'کارت خوان';
  //   } else if (payment == 'bank-transaction') {
  //     return 'انتقال بانکی';
  //   } else {
  //     return 'چک';
  //   }
  // }
}
