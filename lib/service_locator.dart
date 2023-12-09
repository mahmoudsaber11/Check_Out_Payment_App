import 'package:check_out_payment/features/checkout/data/repos/check_out_repo.dart';
import 'package:check_out_payment/features/checkout/data/repos/check_out_repo_impl.dart';
import 'package:check_out_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  void setupServiceLocator() {
    _setupForRepos();

    _setupForCubits();
  }

  void _setupForRepos() {
    serviceLocator
        .registerLazySingleton<CheckOutRepo>(() => CheckOutRepoImpl());
  }

  void _setupForCubits() {
    serviceLocator.registerFactory<PaymentCubit>(
      () => PaymentCubit(checkOutRepo: serviceLocator.get<CheckOutRepo>()),
    );
  }
}
