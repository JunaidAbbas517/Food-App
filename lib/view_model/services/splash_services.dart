import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../shared_components/routes/routes_name.dart';

class SplashServices {
  void isLogIn(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(
        context,
        RouteName.homeScreen,
      ),
    );
  }
}
