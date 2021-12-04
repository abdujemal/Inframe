import 'package:flutter/material.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/screens/photographer_path/photographer_login.dart';
import 'package:inframe/screens/seeker_path/seeker_login.dart';

// ignore: use_key_in_widget_constructors
class AccountOptions extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox.fromSize(
                  size: preferredSize,
                  child: LayoutBuilder(builder: (context, constraint) {
                    final width = constraint.maxWidth * 4;
                    return ClipRect(
                      child: OverflowBox(
                        maxHeight: double.infinity,
                        maxWidth: double.infinity,
                        child: SizedBox(
                          width: width,
                          height: width,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: width / 2 - preferredSize.height / 2),
                            child: const DecoratedBox(
                              decoration: BoxDecoration(
                                color: kMain,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.only(top: 430),
                      child: Text(
                        "Continue as",
                        style: TextStyle(
                            color: kText,
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotographerLogin()));
                },
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      border: Border.all(color: Colors.black)),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            "assets/photographer.png",
                            scale: 3.5,
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 7),
                            child: Text(
                              "Photographer",
                              style: TextStyle(
                                color: kText,
                                fontSize: 30,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("OR", textAlign: TextAlign.center),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SeekerLogin()));
                },
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            "assets/seeker.png",
                            scale: 3.5,
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 7),
                            child: Text(
                              "Seeker",
                              style: TextStyle(
                                color: kText,
                                fontSize: 30,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(420.0);
}
