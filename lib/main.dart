import 'package:check_out_payment/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  runApp(const CheckOutApp());
}
// PaymentIntentObject create payment intent(amount,currency)
// init payment sheet (PaymentIntentClientSecret)


// presentPaymentSheet()