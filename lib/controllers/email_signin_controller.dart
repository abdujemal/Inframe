import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/repository/auth_repository.dart';
import 'package:inframe/screens/photographer_path/photographer_dashboard.dart';

class EmailSignInController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final error = Rx<String?>(null);
  final isLoading = RxBool(false);


  String? emptyValidator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      isLoading.value = true;
      error.value = null;
      await _authRepository.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      Get.to(()=>PGDashboard());
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }

  Future<void> signInWithGoogle() async{

  }
}
