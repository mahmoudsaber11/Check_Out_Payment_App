import 'package:check_out_payment/core/api/stripe_service.dart';
import 'package:check_out_payment/core/errors/failures.dart';
import 'package:check_out_payment/core/errors/server_failure.dart';
import 'package:check_out_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_payment/features/checkout/data/repos/check_out_repo.dart';
import 'package:dartz/dartz.dart';

class CheckOutRepoImpl implements CheckOutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
