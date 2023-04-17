//{status: true, message: Student sibling list, data: [{id: 2455, token: 2455, full_name: Ayan  Ali, lastname: Ali, class: Class I, shift: Afternoon, father_name: Irfan Ali, mother_name: Amreen Ali, father_mobile: 9826091559, section: A, profile_image: }]}




class Sibling_model {
  String id;
  String full_name;
  String token;
  String father_mobile;
  String profile_image;
  String lastname;
  String Class;
  String father_name;
  String mother_name;
  String section;
  Map fullData;

  Sibling_model({
    required this.id,
    required this.token,
    required this.father_mobile,
    required this.profile_image,
    required this.Class,
    required this.full_name,
    required this.lastname,
    required this.father_name,
    required this.mother_name,
    required this.section,
    required this.fullData
  });

  factory Sibling_model.fromJson(Map userMap) {
    return Sibling_model(
      id: userMap['id'].toString()??'0',
      token: userMap['token'].toString()??'0',
      full_name: userMap['full_name'].toString()??'NA',
      lastname: userMap['lastname'].toString()??'NA',
      Class: userMap['class'].toString()??"",
      father_mobile: userMap['father_mobile'].toString()??'',
      profile_image: userMap['profile_image'].toString()??'null',
      father_name: userMap['father_name'].toString()??'',
      mother_name: userMap['mother_name'].toString()??'',
      section: userMap['section'].toString()??'',
      fullData: userMap,
    );
  }



}


/*      SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("is_login", "true");
          prefs.setString("user_id", response['data']['id'].toString());
          prefs.setString("phone", response['data']['phone'].toString());
          prefs.setString("name", response['data']['name'].toString());
          prefs.setString("email", response['data']['email'].toString());
          prefs.setString("profile_img", response['data']['profile_img'].toString());*/