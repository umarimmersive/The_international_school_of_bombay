import 'package:get/get.dart';

import '../views/photo_gallary_view.dart';

class PhotoGallaryController extends GetxController {
  //TODO: Implement PhotoGallaryController

  List<Imagepath> photos = [
    Imagepath(
      path:
      "https://cdn.statusqueen.com/mobilewallpaper/thumbnail/mobile_wallpaper_60-484.jpg",
      isSelected: false.obs,
    ),
    Imagepath(
        path:
        "https://cdn.statusqueen.com/mobilewallpaper/thumbnail/space_mobile_wallpaper-1114.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://cdn.statusqueen.com/mobilewallpaper/thumbnail/mobile_wallpaper225-728.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://cdn.statusqueen.com/mobilewallpaper/thumbnail/nature_mobile_wallpaper-1130.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://cdn.statusqueen.com/mobilewallpaper/thumbnail/space_mobile_wallpaper-1114.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__340.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://cdn.pixabay.com/photo/2018/09/23/18/30/drop-3698073__340.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://cdn.pixabay.com/photo/2017/08/25/18/48/watercolor-2681039__340.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://cdn.pixabay.com/photo/2019/03/03/20/23/background-4032775__340.png",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://cdn.pixabay.com/photo/2017/12/10/15/16/white-horse-3010129__340.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://cdn.pixabay.com/photo/2016/08/03/14/24/roses-1566792__340.jpg",
        isSelected: false.obs),
    Imagepath(
        path: "https://wallpapercave.com/wp/wp2927746.jpg",
        isSelected: false.obs),
    Imagepath(
        path: "https://wallpapercave.com/wp/wp5007561.gif",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB-16htggnJWUQXVA11kz39n7D0GYWear0iA&usqp=CAU",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://www.instantstories.com/uploads/stories/aathmika/aathmika-beautiful-hd-photos-mobile-wallpapers-hd-androidiphone-1080p-jxy2-lg.jpg?v=1569514987",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://e1.pxfuel.com/desktop-wallpaper/464/856/desktop-wallpaper-colorful-feathers-most-beautiful-wide-mobile-thumbnail.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://c4.wallpaperflare.com/wallpaper/915/375/631/beautiful-colorful-flowers-from-garden-flowering-wallpapers-hd-for-mobile-and-tablet-3840%C3%972400-wallpaper-preview.jpg",
        isSelected: false.obs),
    Imagepath(
        path: "https://www.mordeo.org/download/18296/", isSelected: false.obs),
    Imagepath(
        path:
        "https://www.teahub.io/photos/full/255-2555509_beautiful-android-wallpaper-for-mobile.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwaMusEkCq9UM8OLpRONsiqEkiF-Iccd6UxoeiArtacUTQ1i2ZsvhkEzBTBXa7e16UCtc&usqp=CAU",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://i.pinimg.com/originals/0f/89/9b/0f899b6c5b0216d1940ced5fd5da79a1.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREYAcZxI2SUkD8gOwDb4pdDocZDh8qFJbV3w&usqp=CAU",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsH_fQ6hagSU8prWavgk8D-ptEEkxCe9p-gQ&usqp=CAU",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://i.pinimg.com/originals/7d/d6/a7/7dd6a75541ddd8ce3679c2b644aeb2d2.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://www.imagesjunction.com/images/img/hd_wallpapers_for_mobile.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://wallpapers.com/images/hd/wet-feather-mobile-w142li7pn856j7uy.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://e0.pxfuel.com/wallpapers/901/254/desktop-wallpaper-nature-cell-phone-mobile-nature-android-thumbnail.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhuBLgmLjuW9Sky4WALr-tEy8Cym9fBeBxNQ&usqp=CAU",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://w0.peakpx.com/wallpaper/192/679/HD-wallpaper-beautiful-leaves-flowers-nath-red.jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://images.pexels.com/photos/1156684/pexels-photo-1156684.jpeg?cs=srgb&dl=pexels-arun-thomas-1156684.jpg&fm=jpg",
        isSelected: false.obs),
    Imagepath(
        path:
        "https://i0.wp.com/anamikamishra.com/wp-content/uploads/2016/12/New-Year-HD-Wallpaper-for-Desktop-1.jpg?fit=640%2C426&ssl=1",
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
