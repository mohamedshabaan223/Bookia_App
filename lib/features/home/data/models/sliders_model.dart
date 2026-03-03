class SlidersModel {
  SlidersData? data;
  String? message;
  int? statusCode;

  SlidersModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    statusCode = json["status"];
    data = json["data"] ==null ?null : SlidersData.fromJson(json["data"]);
  }
}

class SlidersData {
  List<SlidersImages>? sliders = [];
  SlidersData.fromJson(Map<String, dynamic> json) {
    if (json["sliders"] != null) {
      sliders = <SlidersImages>[];
      json["sliders"].forEach((e) {
        sliders?.add(SlidersImages.fromJson(e));
      });
    }
  }
}

class SlidersImages {
  String? image;
  SlidersImages.fromJson(Map<String, dynamic> json) {
    image = json["image"];
  }
}
