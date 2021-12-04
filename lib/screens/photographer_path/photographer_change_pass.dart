import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/controllers/passwordreset_controller.dart';
import 'package:inframe/screens/photographer_path/photographer_password_changed.dart';

class PGChangePassword extends StatefulWidget {
  const PGChangePassword({Key? key}) : super(key: key);

  @override
  State<PGChangePassword> createState() => _PGChangePasswordState();
}

class _PGChangePasswordState extends State<PGChangePassword> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final passwordresetController = Get.put(PasswordResetController());
    return Scaffold(
      body: Form(
        key: _formKey,
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
                          "Change Password",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  controller: passwordresetController.passwordresetController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Color(0xFFABABAB))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // GestureDetector(
              //   onTap: () {
              //     if (_formKey.currentState?.validate() == true) {
              //       passwordresetController.changePassword();
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const PGPasswordChanged()));
              //     }
              //   },
              //   child: Card(
              //     elevation: 5,
              //     color: kMain,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(40),
              //     ),
              //     child: const SizedBox(
              //         width: 170,
              //         height: 50,
              //         child: Center(
              //           child: Text(
              //             "Submit",
              //             style: TextStyle(
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.white),
              //           ),
              //         )),
              //   ),
              // ),
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
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        passwordresetController.changePassword();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PGPasswordChanged()));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
