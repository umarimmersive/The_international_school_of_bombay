
class Notice_bord_list_model {
  int? id;
  String? image;
  String? title;
  String? short_description;
  String? content;
  String? date;
  String? time;

  Notice_bord_list_model({this.id, this.image,this.title,this.short_description,this.content,this.date,this.time});

  factory Notice_bord_list_model.fromJson(Map<String, dynamic> json) => Notice_bord_list_model(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    title: json["title"] ?? "",
    short_description: json["short_description"] ?? "",
    content: json["content"] ?? "",
    date: json["date"] ?? "",
    time: json["time"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "short_description": short_description,
    "content": content,
  };
}