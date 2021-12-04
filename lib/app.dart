import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';
import 'navigation/routes.dart';

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return GetBuilder<AuthController>(
      init: authController,
      builder: (_) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Authentication Flow',
          onGenerateRoute: Routes.routes,
        );
      },
    );
  }
}
