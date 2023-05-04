

class Section_details_model {
  int? id;
  String? title;
  int? bgType;
  String? bgValue;
  List<Extra>? extra;

  Section_details_model({this.id, this.title, this.bgType, this.bgValue, this.extra});

  Section_details_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bgType = json['bg_type'];
    bgValue = json['bg_value'];
    if (json['extra'] != null) {
      extra = <Extra>[];
      json['extra'].forEach((v) {
        extra!.add(new Extra.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['bg_type'] = this.bgType;
    data['bg_value'] = this.bgValue;
    if (this.extra != null) {
      data['extra'] = this.extra!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Extra {
  String? lineColor;
  String? appIcon;

  Extra({this.lineColor, this.appIcon});

  Extra.fromJson(Map<String, dynamic> json) {
    lineColor = json['line_color'];
    appIcon = json['app_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line_color'] = this.lineColor;
    data['app_icon'] = this.appIcon;
    return data;
  }
}
