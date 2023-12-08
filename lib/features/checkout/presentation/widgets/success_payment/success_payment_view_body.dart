import 'package:check_out_payment/features/checkout/presentation/widgets/success_payment/custom_dashed_line.dart';
import 'package:check_out_payment/features/checkout/presentation/widgets/success_payment/thank_you_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessPaymentViewBody extends StatelessWidget {
  const SuccessPaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
              bottom: MediaQuery.sizeOf(context).height * .2 + 20.h,
              left: 20,
              right: 20,
              child: const CustomDashedLine()),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              top: -50,
              left: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: const Color(0xFFEDEDED),
                radius: 50,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0xff34A853),
                  child: Icon(
                    Icons.check,
                    size: 50.sp,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
