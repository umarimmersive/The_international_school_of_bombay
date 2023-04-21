
class Event_list_model {
  int? id;
  String? image;
  String? title;
  String? short_description;
  String? date;

  Event_list_model({this.id, this.image,this.title,this.short_description,this.date});

  factory Event_list_model.fromJson(Map<String, dynamic> json) => Event_list_model(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    title: json["title"] ?? "",
    short_description: json["short_description"] ?? "",
    date: json["year"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "short_description": short_description,
    "date": date,
  };
}