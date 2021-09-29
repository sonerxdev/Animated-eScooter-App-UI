import 'package:animation_library/core/base_state.dart';
import 'package:animation_library/core/constants.dart';
import 'package:animation_library/smartCarApp/home_page.dart';
import 'package:animation_library/smartCarApp/models/home_controller.dart';
import 'package:animation_library/widgets/chart_1.dart';
import 'package:animation_library/widgets/chart_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class BatteryPage extends StatefulWidget {
  BatteryPage({Key? key}) : super(key: key);

  @override
  _BatteryPageState createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  @override
  Widget build(BuildContext context) {
    final _homeController = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: context.insetsAll(0.01),
          child: Icon(
            Icons.ev_station_outlined,
            color: Colors.black,
            size: 30.0,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Battery Status 86%",
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  AnimatedPositioned(
                    top: 70.0,
                    left: 300.0,
                    curve: Curves.linearToEaseOut,
                    duration: Duration(milliseconds: 400),
                    child: CircularPercentIndicator(
                      radius: 50.0,
                      animation: true,
                      backgroundColor: mainColor2,
                      lineWidth: 8.0,
                      animationDuration: 3000,
                      restartAnimation: true,
                      percent: 0.86,
                      curve: Curves.linearToEaseOut,
                      center: Text(
                        "86%",
                        style: GoogleFonts.yantramanav(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      progressColor: secondColor,
                    ),
                  ),
                  Container(
                    height: context.dynamicHeight(0.35),
                    width: context.dynamicWidth(0.9),
                    child: BarChartSample1(),
                  ),
                  Positioned(
                    left: 30,
                    bottom: 100,
                    child: AnimatedPadding(
                      padding: EdgeInsets.only(
                        left: _homeController.isScooterBig
                            ? context.dynamicWidth(0.0)
                            : context.dynamicWidth(0.5),
                      ),
                      curve: Curves.linearToEaseOut,
                      duration: Duration(milliseconds: 900),
                      child: Container(
                        height: context.dynamicHeight(0.25),
                        width: context.dynamicWidth(0.25),
                        child: Image.asset(
                          "assets/images/scooter.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.dynamicHeight(0.01)),
              Container(
                height: context.dynamicHeight(0.3),
                width: context.dynamicWidth(0.8),
                child: LineChartSample2(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: context.insetsAll(0.03),
                    decoration: boxDecoration(),
                    child: Column(
                      children: [
                        Row(
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
                                  "28.3 km",
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
                                  "2 hour",
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
