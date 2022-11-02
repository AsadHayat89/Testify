import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';
class screenTesting extends StatefulWidget {
  const screenTesting({Key? key}) : super(key: key);

  @override
  State<screenTesting> createState() => _screenTestingState();
}

class _screenTestingState extends State<screenTesting> {
  int pos=0;
  List<int> points=[0,1,2,3,4,5,6];
  List<Color> colors=[
    Colors.pink,
    Colors.black54,
    Colors.blue,
    Colors.red,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.deepOrange
  ];

  void changeColorState(){
    setState(() {
    final _random = new Random();
    pos=_random.nextInt(points.length);

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (Timer t) => changeColorState());
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;
    return Container(
      width: width,
      height: height,
      color: colors[pos],
    );
  }
}

