import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/controllers/email_create_controller.dart';
import 'package:inframe/screens/seeker_path/seeker_login.dart';

class SeekerSignup extends StatefulWidget {
  const SeekerSignup({Key? key}) : super(key: key);

  @override
  State<SeekerSignup> createState() => _SeekerSignupState();
}

class _SeekerSignupState extends State<SeekerSignup> {
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final emailController = Get.put(EmailCreateController());
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              const SizedBox(
                height: 150,
              ),
              Center(
                child: Image.asset("assets/logo.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(80),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFB4B4B4),
                              blurRadius: 3,
                              spreadRadius: 0.5),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        controller: emailController.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Enter Your Email Address');
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ('Enter Valid Email Address');
                          }
                          return null;
                        },
                        onSaved: (value) {
                          emailController.emailController.text = value!;
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFBFBFB),
                          hintText: "Enter Email",
                          hintStyle:
                              TextStyle(color: Color(0xFFA5A5A5), fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(80),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFB4B4B4),
                              blurRadius: 3,
                              spreadRadius: 0.5),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        controller: emailController.passwordController,
                        validator: (value) {
                          RegExp regexp = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ('Enter Your Password');
                          }
                          if (!regexp.hasMatch(value)) {
                            return ('Enter Valid Password(Min. 6 Characters)');
                          }
                        },
                        onSaved: (value) {
                          emailController.passwordController.text = value!;
                        },
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFBFBFB),
                          hintText: "Enter Password",
                          hintStyle:
                              TextStyle(color: Color(0xFFA5A5A5), fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(80),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFB4B4B4),
                              blurRadius: 3,
                              spreadRadius: 0.5),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        controller: emailController.repeatPasswordController,
                        validator: (value) {
                          if (emailController.repeatPasswordController.text !=
                              emailController.passwordController.text) {
                            return 'Password]s Don\'t Match';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          emailController.repeatPasswordController.text = value!;
                        },
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFBFBFB),
                          hintText: "Enter Password Again",
                          hintStyle:
                              TextStyle(color: Color(0xFFA5A5A5), fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SeekerLogin()));
                },
                child: const Text(
                  "Already have an account? Sign In!",
                  style: TextStyle(fontSize: 18, color: kText),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.find<EmailCreateController>()
                        .createUserWithEmailAndPassword();
                  }
                },
                child: const Text(
                  'Register Me!',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: kMain,
                    fixedSize: const Size(160, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
