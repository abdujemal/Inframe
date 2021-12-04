import 'package:flutter/material.dart';
import 'package:inframe/color_constants.dart';

class SeekerBidPosted extends StatelessWidget {
  const SeekerBidPosted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: kMain,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 80)),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
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
                        top: 70,
                      ),
                      child: Text(
                        "Post a Bid",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/success.png",
              scale: 4,
            ),
            const SizedBox(
              height: 100,
            ),
            const Text("Bid posted Successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
