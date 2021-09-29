import 'package:animation_library/core/base_state.dart';
import 'package:animation_library/core/constants.dart';
import 'package:animation_library/smartScooterApp/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

const MAPBOX_STYLE = 'mapbox/dark-v10';
const MAPBOX_ACCESS_TOKEN =
    'sk.eyJ1Ijoic29uZXI5NyIsImEiOiJja3U0ajUwazUxZjBlMm9vMWtodjljenRjIn0.UUKmqd02IHi3eo93II8m-Q';

const MARKER_COLOR = Color(0xff3dc5a7);

final _myLocation = LatLng(
  40.944538,
  29.115499,
);

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              maxZoom: 16,
              minZoom: 5,
              zoom: 13,
              center: _myLocation,
            ),
            nonRotatedLayers: [
              TileLayerOptions(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                additionalOptions: {
                  'accessToken': MAPBOX_ACCESS_TOKEN,
                  'id': MAPBOX_STYLE
                },
              ),
              MarkerLayerOptions(markers: [
                Marker(
                  point: _myLocation,
                  builder: (_) {
                    return MyLocationMarker();
                  },
                )
              ])
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 5,
            height: context.dynamicHeight(0.3),
            child: PageView.builder(itemBuilder: (context, index) {
              return MapItemDetails();
            }),
          ),
          Positioned(
            top: context.dynamicHeight(0.0),
            left: context.dynamicWidth(0.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black87.withOpacity(0.9), Colors.transparent],
                ),
              ),
              height: context.dynamicHeight(0.1),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: context.dynamicHeight(0.04),
            left: context.dynamicWidth(0.05),
            child: Icon(
              Icons.location_on_outlined,
              color: Colors.white,
              size: 27.0,
            ),
          ),
          Positioned(
            top: context.dynamicHeight(0.03),
            right: context.dynamicWidth(0.05),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              ),
              child: Hero(
                tag: 'profile-photo',
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
            ),
          ),
          Positioned(
            top: context.dynamicHeight(0.05),
            left: context.dynamicWidth(0.4),
            child: Text(
              "Location",
              style: GoogleFonts.yantramanav(
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyLocationMarker extends StatelessWidget {
  const MyLocationMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: MARKER_COLOR,
        shape: BoxShape.circle,
      ),
    );
  }
}

class MapItemDetails extends StatelessWidget {
  const MapItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.insetsAll(0.06),
      child: Container(
        padding: EdgeInsets.only(
          top: context.dynamicHeight(0.055),
          bottom: context.dynamicHeight(0.055),
          // left: context.dynamicWidth(0.01),
          //  right: context.dynamicWidth(0.04),
        ),
        decoration: boxDecoration1(),
        child: Row(
          children: [
            Container(
              height: context.dynamicHeight(0.2),
              width: context.dynamicWidth(0.2),
              child: Image.asset(
                "assets/images/scooter.png",
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Text(
                    "Battery",
                    style: GoogleFonts.yantramanav(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "%86",
                    style: GoogleFonts.yantramanav(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
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
                Expanded(
                  child: Text(
                    "Distance",
                    style: GoogleFonts.yantramanav(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "28.3 km",
                    style: GoogleFonts.yantramanav(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
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
                Expanded(
                  child: Text(
                    "Duration",
                    style: GoogleFonts.yantramanav(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "2 hour",
                    style: GoogleFonts.yantramanav(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration boxDecoration1() {
  return BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(10.0),
  );
}
