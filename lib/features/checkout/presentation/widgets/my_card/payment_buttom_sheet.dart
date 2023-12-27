import 'package:check_out_payment/features/checkout/presentation/widgets/my_card/custom_button_bloc_consumer.dart';
import 'package:check_out_payment/features/checkout/presentation/widgets/payment_details/payment_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentButtomSheet extends StatelessWidget {
  const PaymentButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
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
          const CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
