import 'package:check_out_payment/core/api/api_keys.dart';
import 'package:check_out_payment/core/api/dio_consumer.dart';
import 'package:check_out_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:check_out_payment/features/checkout/data/repositories/stripe_repo.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeRepoImpl implements StripeRepo {
  final DioConsumer dioConsumer = DioConsumer();
  @override
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await dioConsumer.postData(
        body: paymentIntentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.secretKey);
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  @override
  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: "Saber"));
  }

  @override
  Future displayPaymentSheet() async {
    Stripe.instance.presentPaymentSheet();
  }

  @override
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
