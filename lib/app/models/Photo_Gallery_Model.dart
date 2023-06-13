
class PhotoGalleryModel {
  int? id;
  String? title;
  int? itemType;
  String? itemValue;
  String? videoThumb;
  String? channelThumb;

  PhotoGalleryModel(
      {this.id,
        this.title,
        this.itemType,
        this.itemValue,
        this.videoThumb,
        this.channelThumb});

  PhotoGalleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    itemType = json['item_type'];
    itemValue = json['item_value'];
    videoThumb = json['video_thumb'];
    channelThumb = json['channel_thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['item_type'] = this.itemType;
    data['item_value'] = this.itemValue;
    data['video_thumb'] = this.videoThumb;
    data['channel_thumb'] = this.channelThumb;
    return data;
  }
}



class PhotoGalleryDetailsModel {
  int? id;
  String? title;
  int? itemType;
  String? itemValue;

  PhotoGalleryDetailsModel({this.id, this.title, this.itemType, this.itemValue});

  PhotoGalleryDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    itemType = json['item_type'];
    itemValue = json['item_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['item_type'] = this.itemType;
    data['item_value'] = this.itemValue;
    return data;
  }
}

// class PhotoGalleryDetailsModel {
//   int? id;
//   String? image;
//   String? title;
//   String? item_type;
//   String? item_value;
//
//   PhotoGalleryDetailsModel({this.id, this.image,this.title,this.item_type,this.item_value});
//
//   factory PhotoGalleryDetailsModel.fromJson(Map<String, dynamic> json) => PhotoGalleryDetailsModel(
//     id: json["id"] ?? "",
//     image: json["image"] ?? "",
//     title: json["title"] ?? "",
//     item_type: json["item_type"].toString() ?? "",
//     item_value: json["item_value"] ?? "",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "image": image,
//     "title": title,
//     "item_type": item_type,
//     "item_value": item_value,
//   };
// }