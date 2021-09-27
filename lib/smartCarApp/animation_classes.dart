import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationClass1 extends StatefulWidget {
  AnimationClass1({Key? key}) : super(key: key);

  @override
  _AnimationClass1State createState() => _AnimationClass1State();
}

class _AnimationClass1State extends State<AnimationClass1> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isLoading = !isLoading;
          });
        },
        child: Icon(Icons.change_circle),
      ),
      body: LayoutBuilder(
        builder: (context, constrains) {
          return Stack(
            children: [
              AnimatedPositioned(
                bottom: isLoading ? 20 : 200,
                curve: Curves.linearToEaseOut,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: constrains.maxHeight * 0.1,
                        horizontal: constrains.maxWidth * 0.4),
                    child: Container(
                      color: Colors.amber,
                      height: 40,
                      width: 40,
                    )),
                duration: Duration(milliseconds: 500),
              )
            ],
          );
        },
      ),
    );
  }
}
