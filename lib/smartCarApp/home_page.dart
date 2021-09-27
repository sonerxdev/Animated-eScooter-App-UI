import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constrains) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: constrains.maxHeight * 0.2),
                  child: Image.asset(
                    "assets/images/scooter.png",
                    width: double.infinity,
                  ),
                ),

                // Positioned(
                //   right: constrains.maxWidth * 0.05,
                //   child: DoorLock(
                //     isLock: _controller.isRightDoorLock,
                //     press: _controller.updateRightDoorLock,
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
