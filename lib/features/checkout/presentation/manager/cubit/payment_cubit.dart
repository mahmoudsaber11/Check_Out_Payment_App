import 'package:check_out_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_payment/features/checkout/data/repos/check_out_repo.dart';
import 'package:check_out_payment/features/checkout/presentation/manager/cubit/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());

  final CheckOutRepo checkOutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkOutRepo.makePayment(paymentIntentInputModel);
    data.fold((failure) => emit(PaymentFailure(errMessage: failure.toString())),
        (r) => emit(PaymentSuccess()));
  }
}
