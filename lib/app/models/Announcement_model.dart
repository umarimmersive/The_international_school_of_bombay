
class Announcement_model {
  int? id;
  String? image;
  String? title;
  String? short_description;
  String? content;

  Announcement_model({this.id, this.image,this.title,this.short_description,this.content});

  factory Announcement_model.fromJson(Map<String, dynamic> json) => Announcement_model(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    title: json["title"] ?? "",
    short_description: json["short_description"] ?? "",
    content: json["content"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "short_description": short_description,
    "content": content,
  };
}