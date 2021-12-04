import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/repository/auth_repository.dart';

class PasswordResetController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();
  final passwordresetController = TextEditingController();

  final error = Rx<String?>(null);
  final isLoading = RxBool(false);

  String? emptyValidator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  Future<void> changePassword() async {
    try {
      isLoading.value = true;
      error.value = null;
      await _authRepository.changePassword(
        passwordresetController.text,
      );
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }
}
