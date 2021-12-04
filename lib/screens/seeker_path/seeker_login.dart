import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/controllers/email_signin_controller.dart';
import 'package:inframe/controllers/google_signin_controller.dart';
import 'package:inframe/repository/auth_repository.dart';
import 'package:inframe/screens/seeker_path/seeker_change_pass.dart';
import 'package:inframe/screens/seeker_path/seeker_dashboard.dart';
import 'package:inframe/screens/seeker_path/seeker_signup.dart';

class SeekerLogin extends StatefulWidget {
  const SeekerLogin({Key? key}) : super(key: key);

  @override
  State<SeekerLogin> createState() => _SeekerLoginState();
}

class _SeekerLoginState extends State<SeekerLogin> {

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  final _authRepository = Get.find<AuthRepository>();

  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Form(
        key: formKey,
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
                        controller: emailEditingController,
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
                        controller: passwordEditingController,
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
                          builder: (context) => const SeekerSignup()));
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
                          builder: (context) => const SeekerChangePassword()));
                },
                child: const Text(
                  "Forget password",
                  style: TextStyle(fontSize: 18, color: kText),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: isLoading,
                child: const Center(child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    signInWithEmail();
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const SeekerDashboard();
                        },
                      ),
                    );
                  },
                  child: Center(
                    child: Image.asset(
                      "assets/google.png",
                      scale: 2.8,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void signInWithEmail() async {
    setState(() {
      isLoading = true;
    });
    try{
      await _authRepository.signInWithEmailAndPassword(emailEditingController.text, passwordEditingController.text);
      Get.to(()=>const SeekerDashboard());
      setState(() {
        isLoading = false;
      });
    }catch(e){
      setState((){
        isLoading = false;
        error = e.toString();
      });
    }
  }
}
