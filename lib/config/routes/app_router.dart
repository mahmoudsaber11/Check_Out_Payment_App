import 'package:check_out_payment/config/routes/routes.dart';
import 'package:check_out_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:check_out_payment/features/checkout/presentation/views/my_cart_view.dart';
import 'package:check_out_payment/features/checkout/presentation/views/payment_details_view.dart';
import 'package:check_out_payment/features/checkout/presentation/views/success_payment_view.dart';
import 'package:check_out_payment/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => serviceLocator.get<PaymentCubit>(),
                child: const MyCartView()));

      case Routes.myCartViewRoute:
        return MaterialPageRoute(
            builder: (context) => const PaymentDetailsView());

      case Routes.successPaymentViewRoute:
        return MaterialPageRoute(
            builder: (context) => const SuccessPaymentView());

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            "Un Found Route",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
