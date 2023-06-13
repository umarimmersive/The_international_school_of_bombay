
class LeaveStatusModel {
  int? id;
  String? studentName;
  String? fatherName;
  String? classId;
  String? startDate;
  String? endDate;
  String? reasonForLeave;
  String? otherReason;
  String? application;
  String? extension;
  int? status;

  LeaveStatusModel(
      {this.id,
        this.studentName,
        this.fatherName,
        this.classId,
        this.startDate,
        this.endDate,
        this.reasonForLeave,
        this.otherReason,
        this.application,
        this.extension,
        this.status});

  LeaveStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['student_name'];
    fatherName = json['father_name'];
    classId = json['class_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    reasonForLeave = json['reason_for_leave'];
    otherReason = json['other_reason'];
    application = json['application'];
    extension = json['extension'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_name'] = this.studentName;
    data['father_name'] = this.fatherName;
    data['class_id'] = this.classId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['reason_for_leave'] = this.reasonForLeave;
    data['other_reason'] = this.otherReason;
    data['application'] = this.application;
    data['extension'] = this.extension;
    data['status'] = this.status;
    return data;
  }
}
