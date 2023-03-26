import 'package:dio/dio.dart';

class DataException implements Exception {
  DataException({required this.message});

  DataException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'LocaleKeys.errorRequestCanceled.tr()';
        break;
      case DioErrorType.connectionTimeout:
        message = 'LocaleKeys.errorConnectionTimeout.tr()';
        break;
      case DioErrorType.receiveTimeout:
        message = 'LocaleKeys.errorReceiveTimeout.tr()';
        break;
      case DioErrorType.badResponse:
        message =
            _handleError(dioError.response!.statusCode!, dioError.response!);
        break;
      case DioErrorType.sendTimeout:
        message = 'LocaleKeys.errorSendTimeout.tr()';
        break;
      default:
        message = 'LocaleKeys.errorInternetConnection.tr()';
        break;
    }
  }

  String message = "";

  String _handleError(int statusCode, Response<dynamic> response) {
    switch (statusCode) {
      case 400:
        if (response.data['non_field_errors'] != null) {
          return 'non_field_errors';
        }

        if (response.data['error'] != null) {
          return response.data['error'];
        }

        return 'errorBadRequest';
      case 401:
        return 'errorUnAuthenticated';
      case 404:
        return 'errorRequestNotFound';
      case 405:
        if (response.data['error'] != null) {
          return response.data['error'];
        }

        return 'errorSomethingWentWrong';
      case 406:
        if (response.data['error'] != null) {
          return response.data['error'];
        }

        return 'errorSomethingWentWrong';
      case 500:
        return 'errorInternalServer';
      default:
        return 'errorSomethingWentWrong';
    }
  }

  @override
  String toString() => message;
}
