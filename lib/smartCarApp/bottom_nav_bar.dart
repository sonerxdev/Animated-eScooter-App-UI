import 'package:animation_library/core/base_state.dart';
import 'package:animation_library/core/constants.dart';
import 'package:animation_library/smartCarApp/home_page.dart';
import 'package:animation_library/smartCarApp/battery_page.dart';
import 'package:animation_library/smartCarApp/models/home_controller.dart';
import 'package:animation_library/smartCarApp/profile_page.dart';
import 'package:animation_library/smartCarApp/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int _selectedIndex = 0;
  PageController? _pageController;
  //HomeController _homeController = HomeController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController!.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _homeController = Provider.of<HomeController>(context);
    return Scaffold(
      // backgroundColor: Colors.black87,
      bottomNavigationBar: Container(
        decoration: boxDecoration(),
        margin: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: BottomNavigationBar(
            unselectedItemColor: Colors.black87,
            selectedItemColor: textColor,
            type: BottomNavigationBarType.shifting,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.battery_charging_full_outlined),
                label: 'Charge',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                label: 'Location',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
              _homeController.updateSizeScooter();
            });
          },
          children: <Widget>[
            HomePage(),
            BatteryPage(),
            LocationPage(),
          ],
        ),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(40.0),
      boxShadow: [
        BoxShadow(
          color: mainColor.withOpacity(0.5),
          spreadRadius: 4,
          blurRadius: 13,
        ),
      ],
    );
  }
}
