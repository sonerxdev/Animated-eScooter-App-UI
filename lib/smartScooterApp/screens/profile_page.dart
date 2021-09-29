import 'package:animation_library/core/base_state.dart';
import 'package:animation_library/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        elevation: 0.0,
        leading: Padding(
          padding: context.insetsAll(0.01),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: (Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.yantramanav(
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Hero(
              tag: 'profile-photo',
              child: CircleAvatar(
                radius: 80,
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
          ),
          SizedBox(
            height: context.dynamicHeight(0.03),
          ),
          Center(
            child: Text(
              "Soner Karaevli",
              style: GoogleFonts.yantramanav(
                textStyle: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
