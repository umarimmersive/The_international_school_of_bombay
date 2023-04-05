import 'package:flutter/material.dart' hide Badge;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/global_widgets/ThemeClass.dart';

void main() {



  //  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //
  //     systemNavigationBarDividerColor: Colors.black,
  //    systemNavigationBarColor: Colors.black, // navigation bar color
  //   statusBarColor: ColorValues.kRedColor, // status bar color
  // ));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);



  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // themeMode: ThemeMode.light,
      title: 'The International School Of Bombay',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        tabBarTheme: TabBarTheme(indicatorColor: Colors.red)
      ),
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,

    );
  }
}
