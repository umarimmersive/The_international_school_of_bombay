
class Slider_model {
  int? id;
  String? image;
  String? title;
  String? short_description;

  Slider_model({this.id, this.image,this.title,this.short_description});

  factory Slider_model.fromJson(Map<String, dynamic> json) => Slider_model(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    title: json["title"] ?? "",
    short_description: json["short_description"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "short_description": short_description,
  };
}