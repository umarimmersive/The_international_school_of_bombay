class SDConstant {
  static String get isLogin => "false";

  static String get isDark => "false";

  static String get loginstatus => "false";

  static String get email => "email";

  static String get fullName => "fullName";

  static String get img => "img";

  static String get dob => "dob";

  static String get gender => "gender";

  static String get phone_number => "phone";

  static String get country_code => "country_code";

  static String get country_flag => "country_flag";

  static String get isProfileComplete => "isProfileComplete";

  static String get id => "id"; // login user

  static String get notification_id => "notification_id"; // login user

  static String get pharmacist_id => "pharmacist_id"; // either patient or pharmacist

  static String get address => "address";

  static String get driver_licence => "driver_licence";

  static String get ss => "ss";

  static String get balance => "balance";

  static String get pharmacist_licence_no => "pharmacist_licence_no";

  static String get education => "education";

  static String get experince => "experince";

  static String get token => "token";

  static String get isOnline => '1';

  static String get type => "type"; // 1= pharmacist, 0 = patient

  static String get order_id => "order_id"; //always store temp value
  static String get medicine_id => "medicine_id"; //always store temp value

//Who is the consultation for
  static String get CALL_FOR_REQ_PATIENT => "CALL_FOR_REQ_PATIENT";

  static String get FULL_NAME_REQ_PATIENT => "FULL_NAME_REQ_PATIENT";

  static String get DOB_REQ_PATIENT => "DOB_REQ_PATIENT";

  static String get GENDER_REQ_PATIENT => "GENDER_REQ_PATIENT";

  static String get PRAGNANT_BREASTFEEDING_REQ_PATIENT =>
      "PRAGNANT_BREASTFEEDING_REQ_PATIENT";

  static String get BODY_WEIGHT_REQ_PATIENT => "BODY_WEIGHT_REQ_PATIENT";

  static String get BODY_WEIGHT_UNIT_REQ_PATIENT =>
      "BODY_WEIGHT_UNIT_REQ_PATIENT";

  //Does the patient have any drug known allergies ?
  static String get ALLERGY_REQ_PATIENT => "ALLERGY_REQ_PATIENT";

  // static String get ALLERGY_MEDICINE_REQ_PATIENT => "ALLERGY_MEDICINE_REQ_PATIENT";
  static String get ALLERGY_RASH_REQ_PATIENT => "ALLERGY_RASH_REQ_PATIENT";

  static String get ALLERGY_SWOLLEN_REQ_PATIENT =>
      "ALLERGY_SWOLLEN_REQ_PATIENT";

  static String get ALLERGY_BREATH_REQ_PATIENT => "ALLERGY_BREATH_REQ_PATIENT";

  static String get ALLERGY_DESCRIPTION_REQ_PATIENT =>
      "ALLERGY_DESCRIPTION_REQ_PATIENT";

  //Does the patient have any known medical conditions that we should know about ?
  static String get MEDICAL_CONDITION_REQ_PATIENT =>
      "MEDICAL_CONDITION_REQ_PATIENT";

  static String get OTHER_CONDITION_REQ_PATIENT =>
      "OTHER_CONDITION_REQ_PATIENT";

  //Medical Conditions
  static String get MEDICAL_CONDITION_DESCRIBE_REQ_PATIENT =>
      "MEDICAL_CONDITION_DESCRIBE_REQ_PATIENT";

  //Service
  static String get SERVICE_SELECTED_REQ_PATIENT =>
      "SERVICE_SELECTED_REQ_PATIENT";

  static String get NO_DATA_FOUND => "No Data Found";

  static String get NOT_EMPTY_MSG => "";

  static String get DESCRIBE_MEDICAL_CONDITION_MSG =>
      "";

  static String get SELECT_SERVICE_TYPE_MSG => "Please select service type.";

  static String get PERMISSION =>
      "";

  static String get REQUEST_REJECTED =>
      "";

  static String get SORRY_MSG =>
      " ";
}
