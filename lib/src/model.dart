class ImagekitResponse {
  String? fileId;
  String? name;
  int? size;
  VersionInfo? versionInfo;
  String? filePath;
  String? url;
  String? fileType;
  int? height;
  int? width;
  String? thumbnailUrl;
  List<AITags>? aITags;

  ImagekitResponse(
      {this.fileId,
      this.name,
      this.size,
      this.versionInfo,
      this.filePath,
      this.url,
      this.fileType,
      this.height,
      this.width,
      this.thumbnailUrl,
      this.aITags});

  ImagekitResponse.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    name = json['name'];
    size = json['size'];
    versionInfo = json['versionInfo'] != null
        ? VersionInfo.fromJson(json['versionInfo'])
        : null;
    filePath = json['filePath'];
    url = json['url'];
    fileType = json['fileType'];
    height = json['height'];
    width = json['width'];
    thumbnailUrl = json['thumbnailUrl'];
    if (json['AITags'] != null) {
      aITags = <AITags>[];
      json['AITags'].forEach((v) {
        aITags!.add(AITags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fileId'] = fileId;
    data['name'] = name;
    data['size'] = size;
    if (versionInfo != null) {
      data['versionInfo'] = versionInfo!.toJson();
    }
    data['filePath'] = filePath;
    data['url'] = url;
    data['fileType'] = fileType;
    data['height'] = height;
    data['width'] = width;
    data['thumbnailUrl'] = thumbnailUrl;
    if (aITags != null) {
      data['AITags'] = aITags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VersionInfo {
  String? id;
  String? name;

  VersionInfo({this.id, this.name});

  VersionInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class AITags {
  String? name;
  double? confidence;
  String? source;

  AITags({this.name, this.confidence, this.source});

  AITags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    confidence = json['confidence'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['confidence'] = confidence;
    data['source'] = source;
    return data;
  }
}
