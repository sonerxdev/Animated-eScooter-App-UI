import 'package:animation_library/smartCarApp/bottom_nav_bar.dart';
import 'package:animation_library/smartCarApp/models/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => HomeController(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Banking App',
        home: BottomNavigationBarPage());
  }
}
