
class Upcoming_event_model {
  int? id;
  String? title;
  String? image;
  String? eventDate;
  String? shortDescription;
  String? date;
  String? time;
  String? year;

  Upcoming_event_model(
      {this.id,
        this.title,
        this.image,
        this.eventDate,
        this.shortDescription,
        this.date,
        this.time,
        this.year});

  Upcoming_event_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    eventDate = json['event_date'];
    shortDescription = json['short_description'];
    date = json['date'];
    time = json['time'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['event_date'] = this.eventDate;
    data['short_description'] = this.shortDescription;
    data['date'] = this.date;
    data['time'] = this.time;
    data['year'] = this.year;
    return data;
  }
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
