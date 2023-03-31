import 'package:get/get.dart';

import '../views/photo_gallary_view.dart';

class PhotoGallaryController extends GetxController {
  //TODO: Implement PhotoGallaryController


  List<Imagepath> photos = [
    Imagepath(
      path:
      "https://scontent-del1-1.xx.fbcdn.net/v/t39.30808-6/337516844_915661389772162_1849733195305169388_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=rDpVk7XdLN0AX9QuBYG&_nc_ht=scontent-del1-1.xx&oh=00_AfBwk4OD-F1yw2wpZEQ0UzbnydjmypEhVC-qUz0KVs899A&oe=642B0F3A",
      isSelected: false.obs,
    ),
    Imagepath(
        path:
        "https://scontent-del1-1.xx.fbcdn.net/v/t39.30808-6/337092417_1929143404105280_6027865848207854078_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=rMBXCV1d4ugAX_nxjxS&_nc_ht=scontent-del1-1.xx&oh=00_AfAPM_kTY7pMjxtLOKgLAw7XoIeFW9ueoYM6S5MPWqG-2A&oe=642ABCE7",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-1.xx.fbcdn.net/v/t39.30808-6/337527786_741733204165658_6360235393656441195_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=nupcIVEkwNkAX-CwKP-&_nc_ht=scontent-del1-1.xx&oh=00_AfDpkGdJcSe58mYqx5JwNI55rxudkTU9L6fH3fnLIwowKA&oe=642BEF3F",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337243314_230958139464726_890987890282319516_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=nPLxFwSPzDYAX89NAb7&_nc_ht=scontent-del1-2.xx&oh=00_AfAwj09DIrzkmRB6z69mT9cEmnYIZH87lycJURoIBk4EbQ&oe=642BC492",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337243075_937600147374974_4744085163335338003_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=C34_e2OiY9wAX9UCyQa&_nc_ht=scontent-del1-2.xx&oh=00_AfBkmZFwYnz3-gdtmhm8OX_vNK76Gf8_b7AvUYwiLoIm-w&oe=642B5B15",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337500386_236154452137769_8599207834959090561_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=QyQOKy4LYiwAX-G0Lsd&_nc_ht=scontent-del1-2.xx&oh=00_AfDoohF46n-8uWYp3cA_7-gz3NcgPt8JxD5Klp-4vpqH8Q&oe=642B56EC",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337099623_929596781499957_849485190209335193_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=lxcotrOMx1YAX8ivFRB&_nc_ht=scontent-del1-2.xx&oh=00_AfAgvsmC9G6NH592usCeIXA0YqKGfJJdlcYSrI09frGLlQ&oe=642B7FB6",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337111445_123712343914385_5032918662119787798_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=g6mhicvUQwkAX8u2b2D&_nc_ht=scontent-del1-2.xx&oh=00_AfCmMgqqyLi1-Y2uR2qNc5JwpML6ISM2Ut6E11hLgccz3g&oe=642BD74A ",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-1.xx.fbcdn.net/v/t39.30808-6/337258939_193164530096060_3462001436008030187_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=ln2atIW9Dq4AX-Eha1X&_nc_ht=scontent-del1-1.xx&oh=00_AfCHaUGDpigNynEvfrr-LEDnW4GLg2QR4gABttOr1da_eg&oe=642B1437",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337409560_107189025668013_6847492898564161001_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=ghg4Edn2WUUAX8a5vyU&_nc_ht=scontent-del1-2.xx&oh=00_AfD3is5MmB7pMV25mL8dnuhcuUkqEQha80bdMveMIClZxw&oe=642AAE75",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-1.xx.fbcdn.net/v/t39.30808-6/337253863_735890574579776_8628202927740517998_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=1GVM2XihMx8AX-kWH8z&_nc_ht=scontent-del1-1.xx&oh=00_AfAr8voFpd56xLAW7ah0ngQdH0h_XOUwPU1FfCgzd6Oa1g&oe=642B1689",
        isSelected: false.obs),
    Imagepath(
      path:
      "https://scontent-del1-1.xx.fbcdn.net/v/t39.30808-6/337516844_915661389772162_1849733195305169388_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=rDpVk7XdLN0AX9QuBYG&_nc_ht=scontent-del1-1.xx&oh=00_AfBwk4OD-F1yw2wpZEQ0UzbnydjmypEhVC-qUz0KVs899A&oe=642B0F3A",
      isSelected: false.obs,
    ),
    Imagepath(
        path:
        "https://scontent-del1-1.xx.fbcdn.net/v/t39.30808-6/337092417_1929143404105280_6027865848207854078_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=rMBXCV1d4ugAX_nxjxS&_nc_ht=scontent-del1-1.xx&oh=00_AfAPM_kTY7pMjxtLOKgLAw7XoIeFW9ueoYM6S5MPWqG-2A&oe=642ABCE7",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-1.xx.fbcdn.net/v/t39.30808-6/337527786_741733204165658_6360235393656441195_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=nupcIVEkwNkAX-CwKP-&_nc_ht=scontent-del1-1.xx&oh=00_AfDpkGdJcSe58mYqx5JwNI55rxudkTU9L6fH3fnLIwowKA&oe=642BEF3F",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337243314_230958139464726_890987890282319516_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=nPLxFwSPzDYAX89NAb7&_nc_ht=scontent-del1-2.xx&oh=00_AfAwj09DIrzkmRB6z69mT9cEmnYIZH87lycJURoIBk4EbQ&oe=642BC492",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337243075_937600147374974_4744085163335338003_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=C34_e2OiY9wAX9UCyQa&_nc_ht=scontent-del1-2.xx&oh=00_AfBkmZFwYnz3-gdtmhm8OX_vNK76Gf8_b7AvUYwiLoIm-w&oe=642B5B15",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337500386_236154452137769_8599207834959090561_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=QyQOKy4LYiwAX-G0Lsd&_nc_ht=scontent-del1-2.xx&oh=00_AfDoohF46n-8uWYp3cA_7-gz3NcgPt8JxD5Klp-4vpqH8Q&oe=642B56EC",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337099623_929596781499957_849485190209335193_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=lxcotrOMx1YAX8ivFRB&_nc_ht=scontent-del1-2.xx&oh=00_AfAgvsmC9G6NH592usCeIXA0YqKGfJJdlcYSrI09frGLlQ&oe=642B7FB6",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337111445_123712343914385_5032918662119787798_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=g6mhicvUQwkAX8u2b2D&_nc_ht=scontent-del1-2.xx&oh=00_AfCmMgqqyLi1-Y2uR2qNc5JwpML6ISM2Ut6E11hLgccz3g&oe=642BD74A ",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-1.xx.fbcdn.net/v/t39.30808-6/337258939_193164530096060_3462001436008030187_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=ln2atIW9Dq4AX-Eha1X&_nc_ht=scontent-del1-1.xx&oh=00_AfCHaUGDpigNynEvfrr-LEDnW4GLg2QR4gABttOr1da_eg&oe=642B1437",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/337409560_107189025668013_6847492898564161001_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=ghg4Edn2WUUAX8a5vyU&_nc_ht=scontent-del1-2.xx&oh=00_AfD3is5MmB7pMV25mL8dnuhcuUkqEQha80bdMveMIClZxw&oe=642AAE75",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://scontent-del1-1.xx.fbcdn.net/v/t39.30808-6/337253863_735890574579776_8628202927740517998_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=1GVM2XihMx8AX-kWH8z&_nc_ht=scontent-del1-1.xx&oh=00_AfAr8voFpd56xLAW7ah0ngQdH0h_XOUwPU1FfCgzd6Oa1g&oe=642B1689",
        isSelected: false.obs),

  ];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
