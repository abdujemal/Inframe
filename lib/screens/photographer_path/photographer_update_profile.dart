import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/controllers/auth_controller.dart';
import 'package:inframe/controllers/my_user_controller.dart';
import 'package:inframe/screens/photographer_path/photographer_profile_updated.dart';

class PGUpdateProfile extends StatefulWidget {
  const PGUpdateProfile({Key? key}) : super(key: key);

  @override
  State<PGUpdateProfile> createState() => _PGUpdateProfileState();
}

class _PGUpdateProfileState extends State<PGUpdateProfile> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(MyUserController());

    return Scaffold(
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return const PGProfileState();
      }),
    );
  }
}

// ignore: constant_identifier_names
const CURVE_HEIGHT = 160.0;
// ignore: constant_identifier_names
const AVATAR_RADIUS = CURVE_HEIGHT * 0;
// ignore: constant_identifier_names
const AVATAR_DIAMETER = AVATAR_RADIUS * 0;

class PGProfileState extends StatefulWidget {
  const PGProfileState({Key? key}) : super(key: key);

  @override
  State<PGProfileState> createState() => _PGProfileStateState();
}

class _PGProfileStateState extends State<PGProfileState> {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<MyUserController>();
    return Scaffold(
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
                        "Update Profile",
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
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Obx(() {
                if (Get.find<AuthController>().authState.value ==
                    AuthState.signedIn) {
                  return TextField(
                    enabled: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        hintText:
                            FirebaseAuth.instance.currentUser?.email ?? "",
                        // 'UID: ${Get.find<AuthController>().authUser.value!.uid}',
                        hintStyle: const TextStyle(color: Color(0xFFABABAB))),
                  );
                }
                return const SizedBox.shrink();
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: userController.photographernameController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: "Name",
                    hintStyle: TextStyle(color: Color(0xFFABABAB))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: userController.contactController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: "Contact Number",
                    hintStyle: TextStyle(color: Color(0xFFABABAB))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: userController.cardinfoController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: "Card Information",
                    hintStyle: TextStyle(color: Color(0xFFABABAB))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: userController.cityController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintText: "City",
                    hintStyle: TextStyle(color: Color(0xFFABABAB))),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(() {
              final isSaving = userController.isSaving.value;
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 170,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kMain,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      onPressed: isSaving
                          ? null
                          : () {
                              userController.saveMyUser();
                              Get.to(const PGProfileUpdated());
                            },
                    ),
                  ),
                  if (isSaving) const CircularProgressIndicator()
                ],
              );
            })
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
