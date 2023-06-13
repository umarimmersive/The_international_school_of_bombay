

class Notice_bord_list_model {
  int? id;
  String? title;
  int? noticeType;
  String? noticeDate;
  String? image;
  String? content;
  String? date;
  String? time;

  Notice_bord_list_model(
      {this.id,
        this.title,
        this.noticeType,
        this.noticeDate,
        this.image,
        this.content,
        this.date,
        this.time});

  Notice_bord_list_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    noticeType = json['notice_type'];
    noticeDate = json['notice_date'];
    image = json['image'];
    content = json['content'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['notice_type'] = this.noticeType;
    data['notice_date'] = this.noticeDate;
    data['image'] = this.image;
    data['content'] = this.content;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
