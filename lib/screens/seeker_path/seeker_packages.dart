import 'dart:math';
import 'package:flutter/material.dart';
import 'package:inframe/color_constants.dart';

// ignore: constant_identifier_names
const CURVE_HEIGHT = 400.0;
// ignore: constant_identifier_names
const AVATAR_RADIUS = CURVE_HEIGHT * 0;
// ignore: constant_identifier_names
const AVATAR_DIAMETER = AVATAR_RADIUS * 0;

class SeekerPackages extends StatefulWidget {
  const SeekerPackages({Key? key}) : super(key: key);

  @override
  State<SeekerPackages> createState() => _SeekerPackagesState();
}

class _SeekerPackagesState extends State<SeekerPackages> {
  bool _hasBeenPressed = false;

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
                        "In Frame Packages",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Card(
                      elevation: 5,
                      color: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        width: 300,
                        height: 220,
                        child: Stack(
                          children: <Widget>[
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  "Standard Package",
                                  style: TextStyle(
                                      fontSize: 24, color: Color(0xFF707070)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Team Members: 4"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text("ID: #2323123"),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 90),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Time: 4 hours"),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 120),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Photos: 400"),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 150),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Price: 50K PKR"),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/persons.png",
                                            scale: 2.5,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text("100")
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      setState(() {
                                        _hasBeenPressed = !_hasBeenPressed;
                                      })
                                    },
                                    child: Text(_hasBeenPressed
                                        ? 'Interested'
                                        : "Not Interested"),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(150, 20),
                                      primary:
                                          _hasBeenPressed ? kMain : Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            40), // <-- Radius
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 320),
                    child: Card(
                      elevation: 5,
                      color: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        width: 300,
                        height: 220,
                        child: Stack(
                          children: <Widget>[
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  "Premium Package",
                                  style: TextStyle(
                                      fontSize: 24, color: Color(0xFF707070)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Team Members: 6"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text("ID: #5363213"),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 90),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Time: 6 hours"),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 120),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Photos: 400 and 1 hour video"),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 150),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Price: 80K PKR"),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/persons.png",
                                            scale: 2.5,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text("200")
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      setState(() {
                                        _hasBeenPressed = !_hasBeenPressed;
                                      })
                                    },
                                    child: Text(_hasBeenPressed
                                        ? 'Interested'
                                        : "Not Interested"),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(150, 20),
                                      primary:
                                          _hasBeenPressed ? kMain : Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            40), // <-- Radius
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 560),
                    child: Card(
                      elevation: 5,
                      color: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        width: 300,
                        height: 220,
                        child: Stack(
                          children: <Widget>[
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  "Gold Package",
                                  style: TextStyle(
                                      fontSize: 24, color: Color(0xFF707070)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Team Members: 20"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text("ID: #9362513"),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 90),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Time: 1 Business Day"),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 120),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Photos: 500 and 3 hour video"),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 150),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Price: 100K PKR"),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/persons.png",
                                            scale: 2.5,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text("300")
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                  padding: const EdgeInsets.only(),
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      setState(() {
                                        _hasBeenPressed = !_hasBeenPressed;
                                      })
                                    },
                                    child: Text(_hasBeenPressed
                                        ? 'Interested'
                                        : "Not Interested"),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(150, 20),
                                      primary:
                                          _hasBeenPressed ? kMain : Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            40), // <-- Radius
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
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
