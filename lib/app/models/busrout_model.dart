
class BusRouteModel {
  int? id;
  String? file;

  BusRouteModel({this.id, this.file});

  BusRouteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file'] = this.file;
    return data;
  }
}
