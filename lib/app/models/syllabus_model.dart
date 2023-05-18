

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
