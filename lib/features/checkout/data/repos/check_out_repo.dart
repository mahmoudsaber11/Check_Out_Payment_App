import 'package:check_out_payment/core/errors/failures.dart';
import 'package:check_out_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment(
      PaymentIntentInputModel paymentIntentInputModel);
}
