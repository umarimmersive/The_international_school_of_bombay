

class Syllabus_Model {
  int? id;
  String? syllabus;

  Syllabus_Model({this.id, this.syllabus});

  Syllabus_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    syllabus = json['syllabus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['syllabus'] = this.syllabus;
    return data;
  }
}


class Time_Table_Model {
  int? id;
  String? timetable;

  Time_Table_Model({this.id, this.timetable});

  Time_Table_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timetable = json['timetable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timetable'] = this.timetable;
    return data;
  }
}


class Academic_Content_Model {
  int? id;
  String? content;

  Academic_Content_Model({this.id, this.content});

  Academic_Content_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    return data;
  }
}


