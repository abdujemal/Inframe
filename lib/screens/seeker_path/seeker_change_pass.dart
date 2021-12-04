import 'package:flutter/material.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/screens/seeker_path/seeker_password_changed.dart';

class SeekerChangePassword extends StatefulWidget {
  const SeekerChangePassword({Key? key}) : super(key: key);

  @override
  State<SeekerChangePassword> createState() => _SeekerChangePasswordState();
}

class _SeekerChangePasswordState extends State<SeekerChangePassword> {
  final emailEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : "Enter valid email";
                  },
                  controller: emailEditingController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kMain),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Color(0xFFABABAB))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  const snackBar = SnackBar(
                      content: Text('Password change email request sent'));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SeekerPasswordChanged()));
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
