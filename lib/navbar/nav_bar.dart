import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navbar_controller.dart';
import '../pages/about/about_cinema.dart';
import '../pages/home/home_page.dart';
import '../pages/information/infor_user.dart';
import '../pages/schedule/schedule_movie.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            HomePage(),
            ScheduleMovie(),
            AboutCinema(),
            InforUser()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue[400],
            unselectedItemColor: Colors.black,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            items: [
              _bottomBarItem(Icons.home, "Home"),
              _bottomBarItem(Icons.calendar_month, "Schedule"),
              _bottomBarItem(Icons.info, "About"),
              _bottomBarItem(Icons.person, "Setting"),
            ]),
      );
    });
  }
}

_bottomBarItem(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
