import 'package:flutter/material.dart';

extension AppNavigator on BuildContext {
  void navigateTo({required String routeName, Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }
}
