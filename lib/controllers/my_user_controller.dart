import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/model/user.dart';
import 'package:inframe/repository/my_user_repository.dart';

import 'auth_controller.dart';

class MyUserController extends GetxController {
  final _userRepository = Get.find<MyUserRepository>();
  final photographernameController = TextEditingController();
  final contactController = TextEditingController();
  final cardinfoController = TextEditingController();
  final cityController = TextEditingController();

  Rx<File?> pickedImage = Rx(null);
  Rx<bool> isLoading = Rx(false);
  Rx<bool> isSaving = Rx(false);
  Rx<MyUser?> user = Rx(null);

  @override
  void onInit() {
    getMyUser();
    super.onInit();
  }

  void setImage(File? imageFile) async {
    pickedImage.value = imageFile;
  }

  Future<void> getMyUser() async {
    isLoading.value = true;
    user.value = await _userRepository.getMyUser();
    photographernameController.text = user.value?.photograhpername ?? '';
    contactController.text = user.value?.contact.toString() ?? '';
    cardinfoController.text = user.value?.card ?? '';
    cityController.text = user.value?.city ?? '';
    isLoading.value = false;
  }

  Future<void> saveMyUser() async {
    isSaving.value = true;
    final uid = Get.find<AuthController>().authUser.value!.uid;
    final photograhpername = photographernameController.text;
    final contact = contactController.text;
    final cardinfo = cardinfoController.text;
    final city = cityController.text;
    final newUser = MyUser(uid, photograhpername, contact, cardinfo, city,
        image: user.value?.image);
    user.value = newUser;

    // For testing add delay
    await Future.delayed(const Duration(seconds: 3));
    await _userRepository.saveMyUser(newUser, pickedImage.value);
    isSaving.value = false;
  }
}
