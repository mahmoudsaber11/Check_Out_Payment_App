class InitPaymentSheetInputModel {
  final String customerId;
  final String paymentIntentClientSecret;
  final String ephemeralKeySecret;

  InitPaymentSheetInputModel(
      {required this.customerId,
      required this.paymentIntentClientSecret,
      required this.ephemeralKeySecret});
}
