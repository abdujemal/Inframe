import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/repository/auth_repository.dart';
import 'package:inframe/screens/photographer_path/photographer_dashboard.dart';

class GoogleSignInController extends GetxController{
  final _authRepository = Get.find<AuthRepository>();

  final error = Rx<String?>(null);
  final isLoading = RxBool(false);

  Future<void> google_Signin() async{
    try {
      isLoading.value = true;
      error.value = null;
      await _authRepository.signInWithGoogle();

      // Navigator.push(context, MaterialPageRoute(builder: (_)=>PGDashboard()));

    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }
}