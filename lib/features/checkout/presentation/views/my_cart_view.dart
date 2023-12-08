import 'package:check_out_payment/core/widgets/custom_app_bar.dart';
import 'package:check_out_payment/features/checkout/presentation/widgets/my_card/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "My Cart"),
      body: const MyCartViewBody(),
    );
  }
}
