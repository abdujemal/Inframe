import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inframe/screens/accountoptions.dart';
import 'package:inframe/screens/photographer_path/photographer_dashboard.dart';
import 'package:inframe/screens/seeker_path/seeker_dashboard.dart';
import 'package:inframe/splashscreen/splash.dart';

class Routes {
  static const splash = '/';
  static const intro = '/accountoptions';
  static const seekersignup = '/seekersignup';
  static const photographersignup = '/photographersignup';
  static const createAccount = '/createAccount';
  static const signInEmail = '/signInEmail';
  static const dashboardseeker = '/dashboardseeker';
  static const dashboardphotographer = '/dashboardphotographer';

  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRoute(settings, page: const Splash());
      case intro:
        return _buildRoute(settings, page: AccountOptions());
      case dashboardseeker:
        return _buildRoute(settings, page: const SeekerDashboard());
      case dashboardphotographer:
        return _buildRoute(settings, page: const PGDashboard());

      default:
        throw Exception('Route does not exists');
    }
  }


  static GetPageRoute _buildRoute(RouteSettings settings,
          {required Widget page}) =>
      GetPageRoute(settings: settings, page: () => page);
}
