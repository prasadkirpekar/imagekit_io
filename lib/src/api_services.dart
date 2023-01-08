import 'dart:convert';
import 'dart:html';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// to received image file Uploading Status during ImageKit.io() Function Call.
typedef OnUploadProgress = void Function(double progressValue);

/// Add file from File Picker with `ImageKit.io` private api key.
class ImageKit {
  static Future io(
    File file, {
    required OnUploadProgress onUploadProgress,
    required String privateKey,
    String? folder,
  }) async {
    String apiUrl = "https://upload.imagekit.io/api/v1/files/upload";
    String username = privateKey;
    String password = '';
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    String fileName = file.name.split('/').last;
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.name, filename: fileName),
      'fileName': fileName,
      'folder': folder ?? "flutter_imagekit",
    });
    try {
      Response response = await Dio().post(
        apiUrl,
        data: formData,
        options: Options(headers: {'authorization': basicAuth}),
        onSendProgress: (count, total) {
          double progress = count / total;
          onUploadProgress(progress);
        },
      );
      final getApi = response.data;
      if (kDebugMode) {
        print(getApi["url"]);
      }
      return getApi;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  } 
}
