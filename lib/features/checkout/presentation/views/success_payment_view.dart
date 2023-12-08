import 'package:check_out_payment/core/widgets/custom_app_bar.dart';
import 'package:check_out_payment/features/checkout/presentation/widgets/success_payment/success_payment_view_body.dart';
import 'package:flutter/material.dart';

class SuccessPaymentView extends StatelessWidget {
  const SuccessPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
          offset: const Offset(0, -16), child: const SuccessPaymentViewBody()),
    );
  }
}
