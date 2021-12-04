import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/model/pg.dart';

// ignore: constant_identifier_names
const CURVE_HEIGHT = 400.0;
// ignore: constant_identifier_names
const AVATAR_RADIUS = CURVE_HEIGHT * 0;
// ignore: constant_identifier_names
const AVATAR_DIAMETER = AVATAR_RADIUS * 0;

class SeekerSearchPhotographer extends StatefulWidget {
  const SeekerSearchPhotographer({Key? key}) : super(key: key);

  @override
  State<SeekerSearchPhotographer> createState() =>
      _SeekerSearchPhotographerState();
}

class _SeekerSearchPhotographerState extends State<SeekerSearchPhotographer> {
  String selectedValue = "BusinessName";
  @override
  Widget build(BuildContext context) {
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
                        "Search Photographer",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(top: 90, left: 15, right: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 20, left: 20),
                      child: SizedBox(
                        height: 51,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                onChanged: (v){

                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  hintText: "Search",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: DropdownButton(
                                    value: selectedValue,
                                    style: const TextStyle(
                                      color: kMain,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValue = newValue!;
                                      });
                                    },
                                    items: dropdownItems),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            StreamBuilder(
                    stream: pgRef.onValue,
                    builder: (context, snapshot) {
                      final List<PG> pgList = [];
                      if (snapshot.hasData) {
                        final questionMap = Map<String, dynamic>.from(
                            (snapshot.data! as Event).snapshot.value);
                        questionMap.forEach((key, value) {
                          final inboxItem = Map<String, dynamic>.from(value);
                          final inboxModel = PG.fromRTDB(inboxItem);
                          if (inboxItem[selectedValue].toString().toLowerCase().contains() {
                            inboxList.add(inboxModel);
                          }
                        });
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 110),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 1.2,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              // controller: ScrollController(initialScrollOffset: 5),
                              itemCount: inboxList.length,
                              itemBuilder: (context, index) =>
                                  SeekerInboxItem(inboxList[index])),
                        ),
                      );
                    }),
            
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

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("Business Name"), value: "BusinessName"),
    const DropdownMenuItem(child: Text("Event Type"), value: "BudgetType"),
    const DropdownMenuItem(child: Text("City"), value: "City"),
  ];
  return menuItems;
}
