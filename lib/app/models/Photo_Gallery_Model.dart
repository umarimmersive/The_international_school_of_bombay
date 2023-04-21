
class PhotoGalleryModel {
  int? id;
  String? image;
  String? title;
  String? item_type;
  String? item_value;

  PhotoGalleryModel({this.id, this.image,this.title,this.item_type,this.item_value});

  factory PhotoGalleryModel.fromJson(Map<String, dynamic> json) => PhotoGalleryModel(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    title: json["title"] ?? "",
    item_type: json["item_type"].toString() ?? "",
    item_value: json["item_value"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "item_type": item_type,
    "item_value": item_value,
  };
}

class PhotoGalleryDetailsModel {
  int? id;
  String? image;
  String? title;
  String? item_type;
  String? item_value;

  PhotoGalleryDetailsModel({this.id, this.image,this.title,this.item_type,this.item_value});

  factory PhotoGalleryDetailsModel.fromJson(Map<String, dynamic> json) => PhotoGalleryDetailsModel(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    title: json["title"] ?? "",
    item_type: json["item_type"].toString() ?? "",
    item_value: json["item_value"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "item_type": item_type,
    "item_value": item_value,
  };
}