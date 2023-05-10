

class Section_List_model {
  int? id;
  String? title;
  int? bgType;
  String? bgValue;
  List<Extra>? extra;
  String? titleColor;
  String? subTitle;
  String? subTitleColor;

  Section_List_model(
      {this.id,
        this.title,
        this.bgType,
        this.bgValue,
        this.extra,
        this.titleColor,
        this.subTitle,
        this.subTitleColor});

  Section_List_model.fromJson(Map<String, dynamic> json) {
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
    titleColor = json['title_color'];
    subTitle = json['sub_title'];
    subTitleColor = json['sub_title_color'];
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
    data['title_color'] = this.titleColor;
    data['sub_title'] = this.subTitle;
    data['sub_title_color'] = this.subTitleColor;
    return data;
  }
}

class Extra {
  String? lineColor;
  String? appIcon;
  String? titleColor;
  String? subTitle;
  String? subTitleColor;
  int? id;
  String? title;
  String? image;
  String? shortDescription;
  String? boxColor;
  String? redirection;
  String? icon;
  String? iconColor;
  String? btnColor;
  String? btnTextColor;
  String? date;
  String? time;
  String? year;
  String? redirectionUrl;
  String? thumbnail;

  Extra(
      {this.lineColor,
        this.appIcon,
        this.titleColor,
        this.subTitle,
        this.subTitleColor,
        this.id,
        this.title,
        this.image,
        this.shortDescription,
        this.boxColor,
        this.redirection,
        this.icon,
        this.iconColor,
        this.btnColor,
        this.btnTextColor,
        this.date,
        this.time,
        this.year,
        this.redirectionUrl,
        this.thumbnail});

  Extra.fromJson(Map<String, dynamic> json) {
    lineColor = json['line_color'];
    appIcon = json['app_icon'];
    titleColor = json['title_color'];
    subTitle = json['sub_title'];
    subTitleColor = json['sub_title_color'];
    id = json['id'];
    title = json['title'];
    image = json['image'];
    shortDescription = json['short_description'];
    boxColor = json['box_color'];
    redirection = json['redirection'];
    icon = json['icon'];
    iconColor = json['icon_color'];
    btnColor = json['btn_color'];
    btnTextColor = json['btn_text_color'];
    date = json['date'];
    time = json['time'];
    year = json['year'];
    redirectionUrl = json['redirection_url'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line_color'] = this.lineColor;
    data['app_icon'] = this.appIcon;
    data['title_color'] = this.titleColor;
    data['sub_title'] = this.subTitle;
    data['sub_title_color'] = this.subTitleColor;
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['short_description'] = this.shortDescription;
    data['box_color'] = this.boxColor;
    data['redirection'] = this.redirection;
    data['icon'] = this.icon;
    data['icon_color'] = this.iconColor;
    data['btn_color'] = this.btnColor;
    data['btn_text_color'] = this.btnTextColor;
    data['date'] = this.date;
    data['time'] = this.time;
    data['year'] = this.year;
    data['redirection_url'] = this.redirectionUrl;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
