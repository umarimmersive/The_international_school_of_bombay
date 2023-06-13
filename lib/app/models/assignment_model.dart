
class AssignmentModel {
  int? id;
  String? title;
  String? assignment;

  AssignmentModel({this.id, this.title, this.assignment});

  AssignmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    assignment = json['assignment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['assignment'] = this.assignment;
    return data;
  }
}
