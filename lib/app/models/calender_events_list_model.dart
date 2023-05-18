//
// class Calender_Events_List_Model {
//   List<String>? l20230511;
//   List<String>? l20230512;
//
//   Calender_Events_List_Model({this.l20230511, this.l20230512});
//
//   Calender_Events_List_Model.fromJson(Map<String, dynamic> json) {
//     l20230511 = json['2023-05-11'].cast<String>();
//     l20230512 = json['2023-05-12'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['2023-05-11'] = this.l20230511;
//     data['2023-05-12'] = this.l20230512;
//     return data;
//   }
// }
// class Calender_Events_List_Model {
//   String? date;
//   String? title;
//
//   Calender_Events_List_Model({this.date, this.title});
//
//   Calender_Events_List_Model.fromJson(Map<String, dynamic> json) {
//     date = json['date'] ??"";
//     title = json['title'] ?? "";
//   }
//
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['date'] = this.date;
//   //   data['title'] = this.title;
//   //   return data;
//   // }
//
//   Map<String, dynamic> toJson() => {
//     "date": date,
//     "title": title,
//   };
// }

class CalendarEvent {
  String? date;
  String? title;

  CalendarEvent({this.date, this.title});

  CalendarEvent.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['title'] = this.title;
    return data;
  }
}