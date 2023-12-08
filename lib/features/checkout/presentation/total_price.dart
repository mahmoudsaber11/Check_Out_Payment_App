import 'package:check_out_payment/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Total', style: AppTextStyle.textStyle24),
        const Spacer(),
        Text('\$50.97', style: AppTextStyle.textStyle24),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
