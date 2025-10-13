import 'package:get/get.dart';
import 'package:todolistflutter/bindings/authbinding.dart';
import 'package:todolistflutter/bindings/dashboardbinding.dart';
import 'package:todolistflutter/bindings/historybinding.dart';
import 'package:todolistflutter/bindings/splashbinding.dart';
import 'package:todolistflutter/bindings/profilebinding.dart';
import 'package:todolistflutter/pages/dashboard_page.dart';
import 'package:todolistflutter/pages/history_page.dart';
import 'package:todolistflutter/pages/home_page.dart';
import 'package:todolistflutter/pages/login_page.dart';
import 'package:todolistflutter/pages/profile_page.dart';
import 'package:todolistflutter/pages/splash_page.dart';
import 'package:todolistflutter/pages/todoPage.dart';
import 'package:todolistflutter/routes/routes.dart';


class AppPages {
  static final pages = [

    GetPage(
      name: AppRoutes.loginpage,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.dashboardpage,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: AppRoutes.historypage,
      page: () => HistoryPage(),
      binding: HistoryBinding(),
    ),

   GetPage(
     name: AppRoutes.profilepage,
     page: () => ProfilePage(),
     binding: AuthBinding(),
   ),

    GetPage(
      name: AppRoutes.homepage,
      page: () => HomePage(),
    ),

     GetPage(
      name: AppRoutes.addtodo,
      page: () => Todopage(),
    ),
     GetPage(
      name: AppRoutes.splashpage,
      page: () => SplashPage(),
      binding: SplashBinding()
    ),
    
  ];
}

