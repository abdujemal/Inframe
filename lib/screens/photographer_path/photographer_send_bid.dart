import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/screens/photographer_path/photographer_bid_posted.dart';

// ignore: constant_identifier_names
const CURVE_HEIGHT = 160.0;
// ignore: constant_identifier_names
const AVATAR_RADIUS = CURVE_HEIGHT * 0;
// ignore: constant_identifier_names
const AVATAR_DIAMETER = AVATAR_RADIUS * 0;

class PGSendBid extends StatefulWidget {
  final bidId;
  PGSendBid(this.bidId);

  @override
  _PGSendBidState createState() => _PGSendBidState();
}

class _PGSendBidState extends State<PGSendBid> {


  var _key = GlobalKey<FormState>();
  var amountTEC = TextEditingController();
  var descriptionTEC = TextEditingController();

  var isLoading = false;

  var nameTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const CurvedShape(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 30),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white)),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: 60,
                      ),
                      child: Text(
                        "Send Bid",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Text(
                "Enter your bid here:",
                style: TextStyle(fontSize: 34, color: Color(0xFFABABAB)),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Stack(
                      children: [
                        Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFB4B4B4),
                                  blurRadius: 3,
                                  spreadRadius: 0.5),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            validator: (v){
                              if(v!.isEmpty){
                                return "This Field is required.";
                              }
                            },
                            controller: nameTEC,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFBFBFB),
                              hintText: "Enter Name",
                              hintStyle:
                              TextStyle(color: Color(0xFFA5A5A5), fontSize: 16),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(80),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Stack(
                      children: [
                        Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFB4B4B4),
                                  blurRadius: 3,
                                  spreadRadius: 0.5),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            validator: (v){
                              if(v!.isEmpty){
                                return "This Field is required.";
                              }
                            },
                            controller: descriptionTEC,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFBFBFB),
                              hintText: "Enter Description",
                              hintStyle:
                              TextStyle(color: Color(0xFFA5A5A5), fontSize: 16),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(80),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Stack(
                      children: [
                        Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFB4B4B4),
                                  blurRadius: 3,
                                  spreadRadius: 0.5),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            validator: (v){
                              if(v!.isEmpty){
                                return "This Field is required.";
                              }
                            },
                            controller: amountTEC,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFBFBFB),
                              hintText: "Enter Amount",
                              hintStyle:
                              TextStyle(color: Color(0xFFA5A5A5), fontSize: 16),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(80),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            isLoading ?
            CircularProgressIndicator():
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ));
                if(_key.currentState!.validate()){
                  setState((){
                    isLoading = true;
                  });
                  var uid = FirebaseAuth.instance.currentUser!.uid;
                  var ref = FirebaseDatabase.instance.reference().child("Offers").child(widget.bidId.toString()).child(widget.bidId.toString()+uid);
                  ref.update({
                    "uid": uid,
                    "name": nameTEC.text,
                    "bidId": widget.bidId,
                    "offerId": ref.key.toString(),
                    "description": descriptionTEC.text,
                    "amount": amountTEC.text,
                    "dateTime": DateTime.now().toString()
                  }).then((value){
                    setState((){
                      isLoading = false;
                    });
                    Get.off(()=>PGBidPosted());
                  }).onError((error, stackTrace) {
                    setState((){
                      isLoading = false;
                    });
                    Get.snackbar("Error",error.toString());
                  });

                }
              },
              child: Card(
                elevation: 5,
                color: kMain,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const SizedBox(
                    width: 170,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// class PGSendBid extends StatelessWidget {
//
// }

class CurvedShape extends StatelessWidget {
  const CurvedShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: CURVE_HEIGHT,
      child: CustomPaint(
        painter: _MyPainter(),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = kMain;

    Offset circleCenter = Offset(size.width / 2, size.height - AVATAR_RADIUS);

    Offset topLeft = const Offset(0, 0);
    Offset bottomLeft = Offset(0, size.height * 0.10);
    Offset topRight = Offset(size.width, 0);
    Offset bottomRight = Offset(size.width, size.height * 0.1);

    Offset leftCurveControlPoint =
        Offset(circleCenter.dx * 0.5, size.height - AVATAR_RADIUS * 1.5);
    Offset rightCurveControlPoint =
        Offset(circleCenter.dx * 1.6, size.height - AVATAR_RADIUS);

    final arcStartAngle = 200 / 180 * pi;
    final avatarLeftPointX =
        circleCenter.dx + AVATAR_RADIUS * cos(arcStartAngle);
    final avatarLeftPointY =
        circleCenter.dy + AVATAR_RADIUS * sin(arcStartAngle);
    Offset avatarLeftPoint =
        Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc

    final arcEndAngle = -5 / 180 * pi;
    final avatarRightPointX =
        circleCenter.dx + AVATAR_RADIUS * cos(arcEndAngle);
    final avatarRightPointY =
        circleCenter.dy + AVATAR_RADIUS * sin(arcEndAngle);
    Offset avatarRightPoint = Offset(
        avatarRightPointX, avatarRightPointY); // the right point of the arc

    Path path = Path()
      ..moveTo(topLeft.dx,
          topLeft.dy) // this move isn't required since the start point is (0,0)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy,
          avatarLeftPoint.dx, avatarLeftPoint.dy)
      ..arcToPoint(avatarRightPoint,
          radius: const Radius.circular(AVATAR_RADIUS))
      ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy,
          bottomRight.dx, bottomRight.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
