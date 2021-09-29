import 'package:animation_library/core/base_state.dart';
import 'package:animation_library/core/constants.dart';
import 'package:animation_library/smartCarApp/models/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _homeController = Provider.of<HomeController>(context);
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          _homeController.updateScooterLocked();
        },
        child: Container(
          height: context.dynamicHeight(0.07),
          width: context.dynamicWidth(0.35),
          decoration: BoxDecoration(
            color: darkBackgroundColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
              Text(
                "Unlock",
                style: GoogleFonts.yantramanav(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: context.insetsAll(0.01),
          child: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.only(
                left: context.dynamicWidth(0.07),
                bottom: context.dynamicHeight(0.1),
              ),
              child: Icon(
                Icons.circle,
                color: Colors.red,
                size: 16.0,
              ),
            ),
            backgroundImage: AssetImage(
              "assets/images/person.jpg",
            ),
          ),
        ),
        title: Text(
          "Welcome, Soner!",
          style: GoogleFonts.yantramanav(
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: context.insetsAll(0.025),
            child: Icon(
              Icons.connected_tv,
              size: 30.0,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedPadding(
            curve: Curves.linearToEaseOut,
            padding: _homeController.isScooterBig
                ? context.insetsAll(0.0)
                : context.insetsAll(0.05),
            duration: Duration(milliseconds: 300),
            child: Stack(
              children: [
                AnimatedContainer(
                  height: _homeController.isScooterBig
                      ? context.dynamicHeight(0.25)
                      : context.dynamicHeight(0.0),
                  width: _homeController.isScooterBig
                      ? context.dynamicWidth(0.5)
                      : context.dynamicWidth(0.0),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linearToEaseOut,
                  child: Image.asset(
                    "assets/images/scooter.png",
                  ),
                ),
                Positioned(
                  top: 20.0,
                  right: 40.0,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    switchInCurve: Curves.easeInOutBack,
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                    child: _homeController.isLocked
                        ? SvgPicture.asset(
                            "assets/images/door_lock.svg",
                            key: ValueKey("lock"),
                          )
                        : SvgPicture.asset(
                            "assets/images/door_unlock.svg",
                            key: ValueKey("unlock"),
                          ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: context.insetsAll(0.03),
                decoration: boxDecoration(),
                child: Column(
                  children: [
                    Text(
                      "Today's Status",
                      style: GoogleFonts.yantramanav(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.dynamicHeight(0.03),
                    ),
                    Row(
                      //  crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Battery",
                              style: GoogleFonts.yantramanav(
                                textStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              "%86",
                              style: GoogleFonts.yantramanav(
                                textStyle: TextStyle(
                                  fontSize: 23,
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: context.dynamicWidth(0.05),
                        ),
                        Column(
                          children: [
                            Text(
                              "Distance",
                              style: GoogleFonts.yantramanav(
                                textStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              "10.6 km",
                              style: GoogleFonts.yantramanav(
                                textStyle: TextStyle(
                                  fontSize: 23,
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: context.dynamicWidth(0.05),
                        ),
                        Column(
                          children: [
                            Text(
                              "Duration",
                              style: GoogleFonts.yantramanav(
                                textStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              "18.5 min",
                              style: GoogleFonts.yantramanav(
                                textStyle: TextStyle(
                                  fontSize: 23,
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: context.insetsAll(0.03),
                decoration: boxDecoration(),
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.ev_station_outlined),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: context.dynamicHeight(0.01),
                        ),
                        Text(
                          "Charging",
                          style: GoogleFonts.yantramanav(
                            textStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.07),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.settings_outlined),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: context.dynamicHeight(0.01),
                        ),
                        Text(
                          "Settings",
                          style: GoogleFonts.yantramanav(
                            textStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.07),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.location_on_outlined),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: context.dynamicHeight(0.01),
                        ),
                        Text(
                          "Last Parked",
                          style: GoogleFonts.yantramanav(
                            textStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}

BoxDecoration boxDecoration() {
  return BoxDecoration(
    color: darkBackgroundColor,
    borderRadius: BorderRadius.circular(10.0),
  );
}
