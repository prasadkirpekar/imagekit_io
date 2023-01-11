import 'dart:html';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagekit_io/imagekit_io.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double linearProgress = 0.0;
  Uint8List? file;
  String? fileName;
  Future pickImage() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null) return;
      final Uint8List imageTemp = result.files.first.bytes!;
      setState(() {
        fileName = result.files.first.name;
        file = imageTemp;
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  /// please use File Picker or Image Picker
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImageKit.io"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (file != null)
                Card(
                  child: Image.memory(
                    file!,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
              Text("FileName: $fileName"),
              const SizedBox(height: 10),
              LinearProgressIndicator(value: linearProgress),
              const SizedBox(height: 10),
              const Text(
                'ImageKit.io Upload Progress',
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text("Select Image"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ImageKit.io(
            file!,
            fileName: fileName!,
            privateKey: "PrivateKey", // (Keep Confidential)
            onUploadProgress: (progressValue) {
              if (kDebugMode) {
                print(progressValue);
              }
              setState(() {
                linearProgress = progressValue;
              });
            },
          ).then((url) {
            /// Get your uploaded Image file link from [ImageKit.io]
            /// then save it anywhere you want. For Example- [Firebase, MongoDB] etc.
            if (kDebugMode) {
              print(url.url!);
            }
          });
        },
        tooltip: 'Submit',
        child: const Icon(Icons.add),
      ),
    );
  }
}
