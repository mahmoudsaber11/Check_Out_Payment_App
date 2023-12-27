import 'package:check_out_payment/app.dart';
import 'package:check_out_payment/core/api/api_keys.dart';
import 'package:check_out_payment/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishableKey;
  await ScreenUtil.ensureScreenSize();
  ServiceLocator().setupServiceLocator();
  runApp(const CheckOutApp());
} 
//part one

// PaymentIntentObject create payment intent(amount,currency)
// init payment sheet (PaymentIntentClientSecret)
// presentPaymentSheet()

//part two

//PaymentIntentModel create payment intent(amount,currency,customerId)
//createEphemeralKey(stripeVersion, customerId)
//initPaymentSheet(merchantDisplayName , intentClientSecret , ephemeralKeySecret)
//presentPaymentSheet()