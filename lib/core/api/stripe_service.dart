import 'package:check_out_payment/core/api/api_keys.dart';
import 'package:check_out_payment/core/api/dio_consumer.dart';
import 'package:check_out_payment/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:check_out_payment/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:check_out_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final DioConsumer dioConsumer = DioConsumer();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await dioConsumer.postData(
        body: paymentIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.secretKey);
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
            customerEphemeralKeySecret:
                initPaymentSheetInputModel.ephemeralKeySecret,
            customerId: initPaymentSheetInputModel.customerId,
            merchantDisplayName: "Saber"));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      customerId: paymentIntentInputModel.customerId,
      clientSecret: paymentIntentModel.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await dioConsumer.postData(
      body: {'customer': customerId},
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/ephemeral_keys",
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
        'Stripe-Version': '2023-10-16'
      },
    );
    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }
}
