![Logo](https://ik.imgkit.net/ikmedia/logo/light_T4buIzohVH.svg)

## Usage

``` 
  Those who love [Dio](https://pub.dev/packages/dio) and Build App for Web
```
```http
  Only ImageKit.io Private Key Required. 
```

Lets take a look at how to use [ImageKit.io](https://imagekit.io/registration?code=u4su4947) Flutter Package.

```dart
  ImageKit.io(
    file,
    //  folder: "folder_name/nested_folder", (Optional)
    privateKey: "PrivateKey", // (Keep Confidential)
    onUploadProgress: (progressValue) {
      if (kDebugMode) {
        print(progressValue);
      }
    },

  ).then((String url) {
    // Get your uploaded Image file link from ImageKit.io
    //then save it anywhere you want. For Example- Firebase, MongoDB etc.
    if (kDebugMode) {
      print(url); // your Uploaded Image/Video Link From Imagekit
    }
  });
```
You can also use image/video link to Upload on [ImageKit.io](https://imagekit.io/registration?code=u4su4947).

```dart
  ImageKit.url(
    url,
    //  folder: "folder_name/nested_folder", (Optional)
    privateKey: "PrivateKey", // (Keep Confidential)
    onUploadProgress: (progressValue) {
      if (kDebugMode) {
        print(progressValue);
      }
    },

  ).then((String url) {
    // Get your uploaded Image file link from ImageKit.io
    //then save it anywhere you want. For Example- Firebase, MongoDB etc.
    if (kDebugMode) {
      print(url); // your Uploaded Image/Video Link From Imagekit
    }
  });
```

## Package Maintainer's
- [Deepjyoti Baishya](https://www.instagram.com/deepjyoti_sam/)
#### Thank you