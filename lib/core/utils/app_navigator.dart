import 'package:flutter/material.dart';

extension AppNavigator on BuildContext {
  void navigateTo({required String routeName, Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void navigateAndReplacement({required String newRoute, Object? arguments}) {
    Navigator.pushReplacementNamed(this, newRoute, arguments: arguments);
  }
}
