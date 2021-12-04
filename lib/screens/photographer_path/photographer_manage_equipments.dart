
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/controllers/auth_controller.dart';
import 'package:inframe/screens/photographer_path/photographer_equipments_saved.dart';

class PGManageEquipments extends StatefulWidget {
  const PGManageEquipments({Key? key}) : super(key: key);

  @override
  State<PGManageEquipments> createState() => _PGManageEquipmentsState();
}

class _PGManageEquipmentsState extends State<PGManageEquipments> {
  final formKey = GlobalKey<FormState>();
  final cameramodelController = TextEditingController();
  final lensController = TextEditingController();
  final droneController = TextEditingController();
  final propsController = TextEditingController();
  final othersController = TextEditingController();

  equipments() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // FirebaseFirestore.instance.collection('equipments').add({
      //   'uid': Get.find<AuthController>().authUser.value!.uid,
      //   'email': FirebaseAuth.instance.currentUser?.email ?? "",
      //   'date': DateTime.now(),
      //   'cameramodel': cameramodelController.text,
      //   'lens': lensController.text,
      //   'drone': droneController.text,
      //   'props': propsController.text,
      //   'others': othersController.text,
      // });
      FirebaseDatabase.instance.reference().child("equipments").push().update({
        'uid': Get.find<AuthController>().authUser.value!.uid,
        'email': FirebaseAuth.instance.currentUser?.email ?? "",
        'date': DateTime.now(),
        'cameramodel': cameramodelController.text,
        'lens': lensController.text,
        'drone': droneController.text,
        'props': propsController.text,
        'others': othersController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
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
                          "Manage Equipments",
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
                child: TextFormField(
                  controller: cameramodelController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Camera Model",
                      hintStyle: TextStyle(color: Color(0xFFABABAB))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  controller: lensController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Lens Info",
                      hintStyle: TextStyle(color: Color(0xFFABABAB))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  controller: droneController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Drone Info",
                      hintStyle: TextStyle(color: Color(0xFFABABAB))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  controller: propsController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Props",
                      hintStyle: TextStyle(color: Color(0xFFABABAB))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  controller: othersController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Others",
                      hintStyle: TextStyle(color: Color(0xFFABABAB))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  equipments();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PGEquipmentsSaved()));
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
      ),
    );
  }
}
