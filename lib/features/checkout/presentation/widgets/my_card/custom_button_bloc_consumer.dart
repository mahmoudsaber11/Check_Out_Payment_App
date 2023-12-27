import 'package:check_out_payment/config/routes/routes.dart';
import 'package:check_out_payment/core/utils/app_navigator.dart';
import 'package:check_out_payment/core/widgets/custom_button.dart';
import 'package:check_out_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:check_out_payment/features/checkout/presentation/manager/cubit/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          context.navigateAndReplacement(
              newRoute: Routes.successPaymentViewRoute);
        }
        if (state is PaymentFailure) {
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(amount: '100', currency: 'USD');
              BlocProvider.of<PaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            },
            isLoading: state is PaymentLoading ? true : false,
            title: "Continue");
      },
    );
  }
}
