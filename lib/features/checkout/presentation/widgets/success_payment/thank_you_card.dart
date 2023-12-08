import 'package:check_out_payment/core/utils/app_text_style.dart';
import 'package:check_out_payment/features/checkout/presentation/total_price.dart';
import 'package:check_out_payment/features/checkout/presentation/widgets/success_payment/card_info_widget.dart';
import 'package:check_out_payment/features/checkout/presentation/widgets/success_payment/payment_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50 + 8.h, left: 18.w, right: 18.w),
        child: Column(
          children: [
            Text(
              "Thank you!",
              style: AppTextStyle.textStyle25,
            ),
            Text("Your transaction was successful",
                textAlign: TextAlign.center, style: AppTextStyle.textStyle20),
            SizedBox(
              height: 30.h,
            ),
            const PaymentItemInfo(title: "Date", value: "01/24/2023"),
            SizedBox(
              height: 18.h,
            ),
            const PaymentItemInfo(title: "Time", value: "10:15 AM"),
            SizedBox(
              height: 18.h,
            ),
            const PaymentItemInfo(title: "To", value: "Sam Louis"),
            Divider(
              thickness: 2,
              height: 55.h,
              color: const Color(0xFFC6C6C6),
            ),
            const TotalPrice(),
            SizedBox(
              height: 25.h,
            ),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyle24
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height:
                  ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29.h,
            ),
          ],
        ),
      ),
    );
  }
}
