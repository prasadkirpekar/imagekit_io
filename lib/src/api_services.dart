import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:imagekit_io/src/model.dart';

// to received image file Uploading Status during ImageKit.io() Function Call.
typedef OnUploadProgress = void Function(double progressValue);

/// Add file from File Picker with `ImageKit.io` private api key.
class ImageKit {
  static Future<ImagekitResponse> io(
    List<int> filePath, {
    required OnUploadProgress onUploadProgress,
    required String privateKey,
    required String fileName,
    String? folder,
      bool? useUniqueFileName,
  }) async {
    String apiUrl = "https://upload.imagekit.io/api/v1/files/upload";
    String username = privateKey;
    String password = '';
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    // String fileName = file.name.split('/').last;
    var formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(filePath, filename: fileName),
      'fileName': fileName,
      'folder': folder ?? "flutter_imagekit",
      'useUniqueFileName': useUniqueFileName ?? true
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
      final data = ImagekitResponse.fromJson(response.data);
      if (kDebugMode) {
        print(data);
      }
      return data;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return ImagekitResponse();
  }
}
