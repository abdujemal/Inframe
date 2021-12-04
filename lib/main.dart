// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:inframe/splashscreen/splash.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'IN FRAME',
//         theme: ThemeData(
//           primarySwatch: Colors.deepPurple,
//         ),
//         home: const Splash());
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/app.dart';
import 'package:inframe/repository/auth_repository.dart';
import 'package:inframe/repository/implementations/auth_repository.dart';
import 'package:inframe/repository/implementations/my_user_repository.dart';
import 'package:inframe/repository/my_user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<AuthRepository>(AuthRepositoryImp());
  Get.put<MyUserRepository>(MyUserRepositoryImp());
  runApp(MyApp());
}
