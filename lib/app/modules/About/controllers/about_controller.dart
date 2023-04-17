import 'package:get/get.dart';

import '../../../utils/constants/api_service.dart';

class AboutController extends GetxController {
  //TODO: Implement AboutController

  final count = 0.obs;
  final About_text='At The International School of Bombay we are actively embraced with an innovative and progressive tradition for achieving academic excellence over the years, including the School’s intentional commitment to establish equity and diversity, and review the Schools most recent Strategic Plan'
  'At The International School of Bombay is recognized for its rigorous, innovative educational curriculum and offers its students a breadth of stimulating and challenging academic & activity programs taught by our dedicated teachers.'
  'Our high academic standards are complemented by an exemplary curricular & co-curricular activities taught by our teachers and educators who are professionals in their fields.';

  final About_text2="The fulfillment of learning to give of oneself begins in kindergarten and continues throughout all the divisions as students participate in community service and outreach projects which are integrated into the curriculum. Age-appropriate activities, reading materials, class trips, and guest speakers on varied topics of service and civil responsibility inform and enrich each child’s education at our School.";


  final About_text3= ''
      '●	Practicing and promoting respect for self, for others, and for the environment we share'
  '●	Practicing and promoting integrity and responsibility'
  '●	Insisting upon justice'
 ' ●	We value awareness of the natural world and its resources'
 ' ●	Acting with empathy and compassion'
 ' ●	Developing the character and confidence required to take risks in civic and intellectual undertakings;'
 ' ●	Encouraging leadership'
 ' ●	Making responsible choices in a variety of settings and participating constructively in the community beyond the school'
  '●	Valuing truth, learning, and authenticity'
  ;
  @override
  void onInit() {
    Get_contect_us();
    super.onInit();
  }

  final isLoading=false.obs;
  final about_us_content=''.obs;
  final about_us=''.obs;

  Future Get_contect_us() async {
    print('---call api');
    about_us.value='';
    about_us_content.value='';
    try {
      isLoading(true);
      var response = await ApiService()
          .About_us();
      print({'response==================================$response'});
      if (response['status'] == true) {

        about_us.value = response['data']['title'];
        about_us_content.value = response['data']['content'];

        print('Policy----------------$about_us_content');

      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
