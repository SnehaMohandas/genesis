import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Berin extends StatefulWidget {
  const Berin({Key? key}) : super(key: key);

  @override
  State<Berin> createState() => _BerinState();
}

class _BerinState extends State<Berin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            color: Colors.yellow,
            child:CustomPaint(
              painter: RPSCustomPainter(),
              child: Container(height: 200,width: 200,
                color: Colors.red,),
            ),
          )
        ],
      )
    );
  }
}
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.3750000,size.height*0.2871429);
    path_0.lineTo(size.width*0.5825000,size.height*0.2885714);
    path_0.lineTo(size.width*0.5825000,size.height*0.4257143);
    path_0.lineTo(size.width*0.5716667,size.height*0.4371429);
    path_0.lineTo(size.width*0.5633333,size.height*0.4400000);
    path_0.lineTo(size.width*0.5525000,size.height*0.4400000);
    path_0.lineTo(size.width*0.5475000,size.height*0.4414286);
    path_0.lineTo(size.width*0.4150000,size.height*0.4342857);
    path_0.lineTo(size.width*0.4050000,size.height*0.4400000);
    path_0.lineTo(size.width*0.3975000,size.height*0.4471429);
    path_0.lineTo(size.width*0.3891667,size.height*0.4485714);
    path_0.lineTo(size.width*0.3833333,size.height*0.4528571);
    path_0.lineTo(size.width*0.3791667,size.height*0.4557143);
    path_0.lineTo(size.width*0.3758333,size.height*0.4571429);
    path_0.lineTo(size.width*0.3716667,size.height*0.4600000);
    path_0.lineTo(size.width*0.3683333,size.height*0.4585714);
    path_0.lineTo(size.width*0.3666667,size.height*0.4585714);
    path_0.lineTo(size.width*0.3666667,size.height*0.4471429);
    path_0.lineTo(size.width*0.3666667,size.height*0.4400000);
    path_0.lineTo(size.width*0.3750000,size.height*0.2871429);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
