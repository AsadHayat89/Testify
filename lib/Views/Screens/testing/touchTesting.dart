import 'package:flutter/material.dart';
class touchSettings extends StatefulWidget {
  const touchSettings({Key? key}) : super(key: key);

  @override
  State<touchSettings> createState() => _State();
}

class _State extends State<touchSettings> {
  int statevalue=0;
  Offset tabpostion=Offset(0, 0);
  void getdetails(TapDownDetails details){
    final tapPositions=details.globalPosition;

    print(tapPositions);
    setState(() {
      tabpostion=tapPositions;
      statevalue=1;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;
    return GestureDetector(
      onTapDown: (details)=>getdetails(details),

        child: Container(
      width: width,
      height: height,
      color: Colors.black54,
        child: statevalue==1?CustomPaint(
            painter: OpenPainter(tabPostion: tabpostion),
          ):Container(),
    ));
  }
}
class OpenPainter extends CustomPainter {
  Offset tabPostion;
  OpenPainter({required this.tabPostion});
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    //a circle
    canvas.drawCircle(tabPostion, 80, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}