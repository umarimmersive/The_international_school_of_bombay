import 'package:get/get.dart';

import '../../../utils/constants/api_service.dart';

class OurPhilosypherController extends GetxController {
  //TODO: Implement OurPhilosypherController

  final count = 0.obs;

  List heading=[

    "DIGITAL LEARNING",
    "EXTRACURRICULAR ACTIVITIES",
    "INFRASTRUCTURE",
    "HAPPINESS FACTOR",
    "LIFE AT SCHOOL"
  ];

  List content=[
    "This is the most recently added indicator which helps to understand school's focus on updating strategies based on new-age technology. In today’s rapidly changing environment, keeping abreast with modern digital teaching practices is imperative & inevitable",
    "Students love to explore their life beyond academics. Good extra-curricular activities give them an opportunity to explore their skills and they grow both physically and mentally. Extra-curricular activities also improve the child’s self-confidence exponentially",
    "Students need to explore their interests during their time at school; we provide them the infrastructure to pursue their dreams. Facilities like libraries, workshops, labs, sports arena helps students to engage and improve skill set constantly.",
    "Happy students make a happy school. Student happiness is the bedrock of the process that guides institutes to develop future leaders. Many studies have shown that happy students are more engaged and interested in creating a better world",
    "Children need to be constantly challenged and engaged, it helps them grow and become lifelong learners. Educators need to do their best to create a dynamic environment at school and meet the educational st challenges of the 21 century. Every child inside the school campus should be encouraged to pursue it’s passion and interests.",
  ];


  List images=[
    "assets/images/3.jpg",
    "assets/images/42.jpg",
    "assets/images/37.jpg",
    "assets/images/51.jpg",
    "assets/images/21.jpg",
  ];

  List colors=[
    "#7c4879",
    "#937f4e",
    "#117844",
    "#664957",
    "#5e4005"
  ];


  @override
  void onInit() {
    Get_api();
    super.onInit();
  }

  final isLoading=false.obs;

  final OurPhilosypher_title=''.obs;
  final OurPhilosypher_content=''.obs;

  Future Get_api() async {
    print('---call api');
    OurPhilosypher_title.value='';
    OurPhilosypher_content.value='';
    try {
      isLoading(true);
      var response = await ApiService()
          .OurPhilosypher();
      print({'response==================================$response'});
      if (response['status'] == true) {

        OurPhilosypher_title.value = response['data']['title'];
        OurPhilosypher_content.value = response['data']['content'];

        //print('Policy----------------$about_us_content');

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