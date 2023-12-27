import 'package:check_out_payment/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onTap, required this.title, this.isLoading = false});
  final void Function()? onTap;
  final String title;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  title,
                  style: AppTextStyle.textStyle22,
                ),
        ),
      ),
    );
  }
}
