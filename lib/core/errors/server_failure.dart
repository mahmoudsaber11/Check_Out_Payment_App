import 'package:check_out_payment/core/api/status_code.dart';
import 'package:check_out_payment/core/errors/failures.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Your request not found, please try again later!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection");
      case DioExceptionType.unknown:
        return ServerFailure("Unexpected Error, please try again!");
      default:
        return ServerFailure(
            "Opps something went wrong, please try again later!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    // if (statusCode == StatusCodes.badRequest ||
    //     statusCode == StatusCodes.unAuthorized ||
    //     statusCode == StatusCodes.forbidden) {
    //   return ServerFailure(response['msgError']);
    // } else
    if (statusCode == StatusCodes.internalServerError) {
      return ServerFailure(
          "Opps something went wrong, please try again later!");
    }
    return ServerFailure(response['msgError']);
  }
}
