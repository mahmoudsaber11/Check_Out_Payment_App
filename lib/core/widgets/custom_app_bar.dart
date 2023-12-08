import 'package:check_out_payment/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: Center(child: SvgPicture.asset("assets/images/arrow.svg")),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? "",
      style: AppTextStyle.textStyle25,
    ),
  );
}
