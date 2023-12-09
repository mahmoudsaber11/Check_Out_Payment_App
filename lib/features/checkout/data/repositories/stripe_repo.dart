import 'package:check_out_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

abstract class StripeRepo {
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel);
  Future initPaymentSheet({required String paymentIntentClientSecret});
  Future displayPaymentSheet();
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
