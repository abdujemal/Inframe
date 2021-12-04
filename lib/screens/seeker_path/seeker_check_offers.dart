import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:inframe/Widgets/bid_item.dart';
import 'package:inframe/Widgets/offer_item.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/model/bid.dart';
import 'package:inframe/model/offer.dart';
import 'package:inframe/screens/photographer_path/photographer_send_bid.dart';
import 'package:inframe/screens/seeker_path/seeker_post_abid.dart';

// ignore: constant_identifier_names
const CURVE_HEIGHT = 400.0;
// ignore: constant_identifier_names
const AVATAR_RADIUS = CURVE_HEIGHT * 0;
// ignore: constant_identifier_names
const AVATAR_DIAMETER = AVATAR_RADIUS * 0;

class SeekerCheckOffers extends StatefulWidget {
  String bidId;
  SeekerCheckOffers(this.bidId);

  @override
  State<SeekerCheckOffers> createState() => _SeekerCheckOffersState();
}

class _SeekerCheckOffersState extends State<SeekerCheckOffers> {

  var bidRef;

  var uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    bidRef = FirebaseDatabase.instance.reference().child("Offers").child(widget.bidId.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 245,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 200)),
                  ),
                ),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFF9B99BC),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 200)),
                  ),
                ),
                const CurvedShape(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15),
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
                        top: 20,
                      ),
                      child: Text(
                        "Offers",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
                StreamBuilder(
                    stream: bidRef.limitToFirst(10).onValue,
                    builder: (context, snapshot) {
                      final List<Offer> offerList = [];
                      if (snapshot.hasData) {
                        final questionMap = Map<String, dynamic>.from(
                            (snapshot.data! as Event).snapshot.value);
                        questionMap.forEach((key, value) {

                            final offerItem = Map<String, dynamic>.from(value);
                            final offerModel = Offer.fromRTDB(offerItem);
                            if(offerItem["bidId"]==widget.bidId){
                              offerList.add(offerModel);

                          }

                        });
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top:80),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height/1.2,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            // controller: ScrollController(initialScrollOffset: 5),
                              itemCount: offerList.length,
                              itemBuilder: (context, index) =>
                                  OfferItem(offerList[index],widget.bidId)
                          ),
                        ),
                      );
                    }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
    Offset bottomLeft = Offset(0, size.height * 0.0);
    Offset topRight = Offset(size.width, 0);
    Offset bottomRight = Offset(size.width, size.height * 0.0);

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
