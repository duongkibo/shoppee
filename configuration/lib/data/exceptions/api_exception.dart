import 'dart:io';
import 'package:configuration/data/common/base_response.dart';
import 'package:configuration/data/common/response_code.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ApiException {
  late int? errorCode;
  late String? errorMessage = "";
  late dynamic errorBody = "";
  late DioError exception;

  ApiException({required this.exception}) {
    _handleException();
  }

  String? get displayError {
    switch (exception.type) {
      case DioErrorType.connectionTimeout:
        return S.current.connect_timeout;
      case DioErrorType.receiveTimeout:
        return S.current.receive_timeout;
      case DioErrorType.sendTimeout:
      case DioErrorType.unknown:
        if (exception.error is SocketException) {
          return S.current.please_check_internet_connection;
        }
        return exception.error.toString();
      default:
        return _getResponseErrorMessage() ?? exception.error?.toString() ?? exception.response?.statusMessage;
    }
  }

  void _handleException() {
    switch (exception.type) {
      case DioErrorType.badResponse:
        _handleResponseError();
        break;
      case DioErrorType.cancel:
        errorMessage = S.current.cancelled;
        break;
      case DioErrorType.connectionTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        errorMessage = S.current.connect_timeout;
        break;
      default:
        _handleDefaultError();
    }
  }

  void _handleResponseError() {
    final responseData = exception.response?.data;
    if (responseData is BaseResponse) {
      errorMessage = responseData.code == ResponseCode.UNAUTHORIZED || responseData.code == ResponseCode.FORBIDDEN
          ? S.current.invalid_credentials
          : responseData.code?.message ?? responseData.error;
      errorCode = responseData.code;
      errorBody = responseData.errorBody;
    } else {
      errorMessage = _extractErrorMessage(responseData);
    }
  }

  void _handleDefaultError() {
    if (exception.response?.statusCode == HttpStatus.notFound) {
      errorMessage = S.current.server_not_found;
    } else if (exception.response?.statusCode == HttpStatus.serviceUnavailable) {
      errorMessage = S.current.server_unknown_error;
    } else if (exception.error is SocketException || exception.error is HttpException) {
      errorMessage = S.current.connection_problem;
    }
  }

  String? _getResponseErrorMessage() {
    final responseData = exception.response?.data;
    if (responseData is Map) {
      if (responseData["message"] != null) {
        final message = responseData["message"];
        if (message is List) {
          return message.map((e) => toBeginningOfSentenceCase(e.toString())).join("\n");
        }
        return toBeginningOfSentenceCase(message.toString());
      }
      if (responseData["error"] != null) {
        return responseData["error"].toString();
      }
    }
    return null;
  }

  String? _extractErrorMessage(dynamic data) {
    try {
      if (data is BaseResponse) {
        return data.code == ResponseCode.UNAUTHORIZED || data.code == ResponseCode.FORBIDDEN
            ? S.current.invalid_credentials
            : data.code?.message ?? data.error;
    }
    } catch (e) {
    return e.toString();
    }
    return null;
  }
}