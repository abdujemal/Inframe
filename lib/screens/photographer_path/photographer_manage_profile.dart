import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/screens/photographer_path/photographer_manage_equipments.dart';
import 'package:inframe/screens/photographer_path/photographer_manage_gallery.dart';
import 'package:inframe/screens/photographer_path/photographer_settings.dart';

class PGManageProfile extends StatefulWidget {
  const PGManageProfile({Key? key}) : super(key: key);

  @override
  State<PGManageProfile> createState() => _PGManageProfileState();
}

class _PGManageProfileState extends State<PGManageProfile> {
  // final myuser = Get.find<MyUser>();

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
                        "Manage Profile",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    "Name Here",
                    style: TextStyle(fontSize: 20, color: Color(0xFF707070)),
                  ),
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    itemSize: 30.0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.only(),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // ignore: avoid_print
                      print(rating);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PGManageEquipments()));
              },
              child: Card(
                elevation: 5,
                color: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const SizedBox(
                    width: 220,
                    height: 70,
                    child: Center(
                      child: Text(
                        "Manage Equipments",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF707070)),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PGManageGallery()));
              },
              child: Card(
                elevation: 5,
                color: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const SizedBox(
                    width: 220,
                    height: 70,
                    child: Center(
                      child: Text(
                        "Manage Gallery",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF707070)),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PGSettings()));
              },
              child: Card(
                elevation: 5,
                color: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const SizedBox(
                    width: 220,
                    height: 70,
                    child: Center(
                      child: Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF707070)),
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
