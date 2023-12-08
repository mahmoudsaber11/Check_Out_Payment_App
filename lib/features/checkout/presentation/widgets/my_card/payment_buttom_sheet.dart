import 'package:check_out_payment/core/widgets/custom_button.dart';
import 'package:check_out_payment/features/checkout/presentation/widgets/payment_details/payment_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentButtomSheet extends StatelessWidget {
  const PaymentButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16.h,
          ),
          const PaymentListView(),
          SizedBox(
            height: 32.h,
          ),
          const CustomButton(title: "Continue")
        ],
      ),
    );
  }
}
