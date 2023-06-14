import 'package:get/get.dart';
import 'package:report4/navbar/nav_bar.dart';
import 'package:report4/pages/about/about_cinema.dart';
import 'package:report4/pages/home/home_page.dart';
import 'package:report4/pages/information/infor_user.dart';
import 'package:report4/pages/login/login_page.dart';
import 'package:report4/pages/schedule/schedule_movie.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navBar, page: () => const NavBar()),
    GetPage(name: navBar, page: () => const HomePage()),
    GetPage(name: navBar, page: () => const AboutCinema()),
    GetPage(name: navBar, page: () => const InforUser()),
    GetPage(name: navBar, page: () => const ScheduleMovie()),
    GetPage(name: navBar, page: () => const LoginPage()),
  ];

  static getNavBar() => navBar;

  static String navBar = '/';
  static String home = '/home';
  static String about = '/about';
  static String information = '/information';
  static String calendar = '/calendar';
  static String infor_user= '/infor_user';
}
