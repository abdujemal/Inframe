import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/controllers/email_signin_controller.dart';
import 'package:inframe/controllers/google_signin_controller.dart';
import 'package:inframe/screens/photographer_path/photographer_change_pass.dart';
import 'package:inframe/screens/photographer_path/photographer_dashboard.dart';
import 'package:inframe/screens/photographer_path/photographer_signup.dart';

class PhotographerLogin extends StatefulWidget {
  const PhotographerLogin({Key? key}) : super(key: key);

  @override
  State<PhotographerLogin> createState() => _PhotographerLoginState();
}

class _PhotographerLoginState extends State<PhotographerLogin> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final signInController = Get.put(EmailSignInController());
    final signInWithGoogle = Get.put(GoogleSignInController());

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              const SizedBox(
                height: 120,
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
                        controller: signInController.emailController,
                        validator: signInController.emptyValidator,
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
                        controller: signInController.passwordController,
                        validator: signInController.emptyValidator,
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
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotographerSignup()));
                },
                child: const Text(
                  "Don't have an account? Sign up!",
                  style: TextStyle(fontSize: 18, color: kText),
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PGChangePassword()));
                },
                child: const Text(
                  "Forget password",
                  style: TextStyle(fontSize: 18, color: kText),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                    () => Visibility(
                      visible: signInController.isLoading.value,
                      child: const Center(child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )),
                    ),
              ),
              Obx(
                    () => Visibility(
                      visible: signInController.error.value?.isNotEmpty == true,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color.fromRGBO(250,0,0,.3),
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                  signInController.error.value ?? '',
                                  style: const TextStyle(color: Colors.white, fontSize: 18),
                                ),
                          ),
                        ),
                      ),
                    ),
              ),
              Obx(
                    () => Visibility(
                      visible: signInWithGoogle.error.value?.isNotEmpty == true,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Color.fromRGBO(250,0,0,.3),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              signInWithGoogle.error.value ?? '',
                              style: const TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    signInController.signInWithEmailAndPassword();
                  }
                },
                child: const Text(
                  'Go!',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                    primary: kMain,
                    fixedSize: const Size(160, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "-OR-",
                style: TextStyle(fontSize: 18, color: Color(0xFF8C8C8C)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Continue with",
                style: TextStyle(fontSize: 18, color: Color(0xFF8C8C8C)),
              ),
              GestureDetector(
                onTap: () {
                  signInWithGoogle.google_Signin();
                },
                child: Center(
                  child: Image.asset(
                    "assets/google.png",
                    scale: 2.8,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
