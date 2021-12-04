import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/color_constants.dart';
import 'package:inframe/controllers/email_create_controller.dart';
import 'package:inframe/screens/photographer_path/photographer_login.dart';

class PhotographerSignup extends StatefulWidget {
  const PhotographerSignup({Key? key}) : super(key: key);

  @override
  State<PhotographerSignup> createState() => _PhotographerSignupState();
}

class _PhotographerSignupState extends State<PhotographerSignup> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = Get.put(EmailCreateController());
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Obx(
                () => Visibility(
                  visible: emailController.isLoading.value,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: emailController.error.value?.isNotEmpty == true,
                  child: Text(
                    emailController.error.value ?? '',
                    style: const TextStyle(color: Colors.red, fontSize: 24),
                  ),
                ),
              ),
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
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return ('Enter Your Email Address');
                        //   }
                        //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        //       .hasMatch(value)) {
                        //     return ('Enter Valid Email Address');
                        //   }
                        //   return null;
                        // },
                        // onSaved: (value) {
                        //   emailEditingController.text = value!;
                        // },
                        validator: emailController.emailValidator,
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
                        // controller: passwordEditingController,
                        // validator: (value) {
                        //   RegExp regexp = RegExp(r'^.{6,}$');
                        //   if (value!.isEmpty) {
                        //     return ('Enter Your Password');
                        //   }
                        //   if (!regexp.hasMatch(value)) {
                        //     return ('Enter Valid Password(Min. 6 Characters)');
                        //   }
                        // },
                        // onSaved: (value) {
                        //   passwordEditingController.text = value!;
                        // },
                        controller: emailController.passwordController,
                        validator: emailController.passwordValidator,
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
                        // controller: confirmPasswordEditingController,
                        // validator: (value) {
                        //   if (confirmPasswordEditingController.text !=
                        //       passwordEditingController.text) {
                        //     return 'Password]s Don\'t Match';
                        //   }
                        //   return null;
                        // },
                        // onSaved: (value) {
                        //   confirmPasswordEditingController.text = value!;
                        // },
                        controller: emailController.repeatPasswordController,
                        validator: emailController.passwordValidator,
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
                          builder: (context) => const PhotographerLogin()));
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
                  if (_formKey.currentState?.validate() == true) {
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
