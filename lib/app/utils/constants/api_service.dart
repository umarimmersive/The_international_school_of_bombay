import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_international_school_of_bombay/app/modules/OurPhilosypher/bindings/our_philosypher_binding.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/globle_var.dart';

class ApiService {
  static late final BuildContext context;

  static final String BASE_URL = "http://mobile.theisb.in/api/";
  static final String IMAGE_URL = "http://mobile.theisb.in/";

  //use
  static final String LOGIN = "auth/login";
  static final String get_profile = "getProfile";
  static final String about = "aboutUs";
  static final String ourPhilosopher = "ourPhilosopher";
  static final String dashboardSection = "dashboardSection";
  static final String SLIDER = "slider";
  static final String SLIDER_DEAILS = "sliderDetails";
  static final String schoolRules = "schoolRules";
  static final String siblingsList = "siblingsList";
  static final String submitQuery = "submitQuery";
  static final String announcementList = "announcementList";
  static final String galleries = "galleries";
  static final String noticeBoardList = "noticeBoardList";
  static final String noticeBoardDetails = "noticeBoardDetails";
  static final String galleryDetails = "galleryDetails";
  static final String knowledgeBaseList = "knowledgeBaseList";
  static final String knowledgeBaseDetails = "knowledgeBaseDetails";
  static final String alertNotice = "alertNotice";
  static final String eventsList = "eventsList";
  static final String eventDetails = "eventDetails";
  static final String advertisement = "advertisement";



  static final String term_condition = "termsOfUse";
  static final String PRIVECY_POLICY = "privacyPolicy";

  static final String FORGOT_PASSWORD  = "forgotPassword";
  static final String UPDATE_PROFILE  = "updateProfile";
  static final String BOOKING_STATUS  = "marinaDashboard";
  static final String CONTECT_US = "contactUs";
  static final String MARINA_BOOKING = "marinaBookingList";
  static final String SEND_ANNOOUCEMENTS = "sendAnnouncements";
  static final String ANNOUCEMENT_LIST = "announcementList";





  Future Login(email,password) async {
    print("----------------$email");
    print("----------------$password");

    final response = await http.post(
        Uri.parse(BASE_URL + LOGIN),
        body: ({
          'email':email.toString(),
          'password': password.toString(),
        })
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

 Future Query_submit(
      {student_id, full_name, Class, phone_number, your_query}) async {
    final response = await http.post(
        Uri.parse(BASE_URL + submitQuery),
        body: ({
          'student_id':student_id.toString(),
          'full_name': full_name.toString(),
          'class': Class.toString(),
          'phone_number': phone_number.toString(),
          'your_query': your_query.toString(),
        })
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future Slider_Details(id) async {
    print("----------------$id");

    final response = await http.post(
        Uri.parse(BASE_URL + SLIDER_DEAILS),
        body: ({
          'id':id.toString(),
        })
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

  Future Siblings_list() async {
    final response = await http.post(
        Uri.parse(BASE_URL + siblingsList),
        body: ({
          'mobile':userData!.father_mobile.toString(),
        })
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future Annoucement_list() async {
    final response = await http.get(
        Uri.parse(BASE_URL + announcementList),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future AlertNotice() async {
    final response = await http.get(
        Uri.parse(BASE_URL + alertNotice),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future EventsList(id) async {
    final response = await http.post(
        Uri.parse(BASE_URL + eventsList),
      body: {
        "event_type":id.toString()
      }
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

  Future Photo_Gallery() async {
    final response = await http.post(
        Uri.parse(BASE_URL + galleries),
        body: ({
          'item_type':"1".toString(),
        })
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future Photo_Gallery_details({gallery_id,page}) async {
    final response = await http.post(
        Uri.parse(BASE_URL + galleryDetails),
        body: ({
          'gallery_id': gallery_id.toString(),
          'page': page.toString(),
        })
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

  Future Video_Gallery() async {
    final response = await http.post(
        Uri.parse(BASE_URL + galleries),
        body: ({
          'item_type':"2".toString(),
        })
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future Notice_bord_list() async {
    final response = await http.get(
        Uri.parse(BASE_URL + noticeBoardList),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future Notice_bord_details(id) async {
    final response = await http.post(
        Uri.parse(BASE_URL + noticeBoardDetails),
      body: {
        "id":id.toString()
      }
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

  Future About_us() async {
    final response = await http.get(
        Uri.parse(BASE_URL + about),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future School_Rules() async {
    final response = await http.get(
        Uri.parse(BASE_URL + schoolRules),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

  Future Dashboard_Section() async {
    final response = await http.get(
        Uri.parse(BASE_URL + dashboardSection),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future OurPhilosypher() async {
    final response = await http.get(
        Uri.parse(BASE_URL + ourPhilosopher),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future Slider() async {
    final response = await http.get(
        Uri.parse(BASE_URL + SLIDER),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future KnowledgeBaseList() async {
    final response = await http.get(
        Uri.parse(BASE_URL + knowledgeBaseList),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future Advertisement() async {
    final response = await http.get(
        Uri.parse(BASE_URL + advertisement),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future KnowledgeBaseDetailsList(id) async {
    final response = await http.post(
        Uri.parse(BASE_URL + knowledgeBaseDetails),
        body: {
          "id":id.toString()
        }
    );

    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future Event_Details(id) async {
    final response = await http.post(
        Uri.parse(BASE_URL + eventDetails),
        body: {
          "id":id.toString()
        }
    );

    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future updateProfile(firstName,lastName,Phone,token) async {
    print('---------------------$firstName');
    print('---------------------$lastName');
    print('---------------------$Phone');

    final response = await http.post(
        Uri.parse(BASE_URL + UPDATE_PROFILE),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: ({
          'firstname':firstName.toString(),
          'lastname':lastName.toString(),
          'mobile': Phone.toString(),
        })
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future Forgot_password(phone) async {
    final response = await http.post(
        Uri.parse(BASE_URL + FORGOT_PASSWORD),
        headers: {HttpHeaders.acceptHeader: "application/json"},
        body: ({
          'email': phone.toString(),
        })
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future userProfile({token}) async {
    final response = await http.post(
      Uri.parse(BASE_URL + get_profile),
      body: ({
        "token":token
      })
    );
    var ConvertDataToJson = jsonDecode(response.body);

    print('getprofile------------------------------------$ConvertDataToJson');
    return ConvertDataToJson;
  }


  Future Get_Booking_status({token}) async {
    final response = await http.post(
      Uri.parse(BASE_URL + BOOKING_STATUS),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var ConvertDataToJson = jsonDecode(response.body);

    print('GET BOOKING STATUS------------------------------------$ConvertDataToJson');
    return ConvertDataToJson;
  }
  Future Contect_us() async {
    final response = await http.get(
      Uri.parse(BASE_URL + CONTECT_US),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future Booking_list({token,booking_type}) async {
    final response = await http.post(
        Uri.parse(BASE_URL + MARINA_BOOKING),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          "booking_type" : booking_type
        }
    );
    var ConvertDataToJson = jsonDecode(response.body);

    print('booking type------------------------------------$ConvertDataToJson');
    return ConvertDataToJson;
  }

  Future Term_And_Condition() async {
    final response = await http.get(
      Uri.parse(BASE_URL + term_condition),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }
  Future Privecy_policy() async {
    final response = await http.get(
      Uri.parse(BASE_URL + PRIVECY_POLICY),
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future SendAnnoucement(message,token) async {
    final response = await http.post(
        Uri.parse(BASE_URL + SEND_ANNOOUCEMENTS),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: ({
          'message': message.toString(),
        })
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

  Future Annoucement_List(token) async {
    final response = await http.post(
      Uri.parse(BASE_URL + ANNOUCEMENT_LIST),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }





















}
