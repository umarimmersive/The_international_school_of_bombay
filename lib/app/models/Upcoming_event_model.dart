
class Upcoming_event_model {
  int? id;
  String? image;
  String? title;
  String? short_description;
  String? content;
  String? date;
  String? year;
  String? time;

  Upcoming_event_model({this.id, this.image,this.title,this.short_description,this.content,this.date,this.time,this.year});

  factory Upcoming_event_model.fromJson(Map<String, dynamic> json) => Upcoming_event_model(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    title: json["title"] ?? "",
    short_description: json["short_description"] ?? "",
    content: json["content"] ?? "",
    time: json["time"] ?? "",
    year: json["year"] ?? "",
    date: json["date"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "short_description": short_description,
    "content": content,
    "year": year,
    "time": time,
    "date": date,
  };
}

/*
class Knowledge_base_details_model {
  int? id;
  String? image;
  String? title;
  String? short_description;
  String? content;

  Knowledge_base_details_model({this.id, this.image,this.title,this.short_description,this.content});

  factory Knowledge_base_details_model.fromJson(Map<String, dynamic> json) => Knowledge_base_details_model(
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



class Avd_model {
  String? image;
  Avd_model({this.image});
  factory Avd_model.fromJson(Map<String, dynamic> json) => Avd_model(
    image: json["image"] ?? "",
  );
  Map<String, dynamic> toJson() => {
    "image": image,
  };
}*/
