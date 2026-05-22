// ignore_for_file: deprecated_member_use_from_same_package, unreachable_switch_default

import 'package:dio/dio.dart';
import 'package:emp_apnagodam/Domain/dio/DioProvider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_context/one_context.dart';

import '../../Data/SharedPrefs/SharedUtility.dart';
import '../../main.dart';
import '../Widgets/widgets.dart';

class DioInterceptor extends InterceptorsWrapper {
  DioInterceptor(this.ref);

  final DioRef ref;

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 15,
    );
  }

  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        _showToast('Connection timeout! your internet connection is slow');
        break;
      case DioExceptionType.connectionError:
        _showToast("Please Check your internet connection!");
        break;
      case DioExceptionType.badResponse:
        _showToast(
            "Server Error! - ${error.response?.statusCode ?? 'Unknown'}");
        break;
      case DioExceptionType.unknown:
        _showToast(
            "Server Error! - ${error.response?.statusCode ?? 'Unknown'}");
        break;
      case DioExceptionType.cancel:
        _showToast("Request Canceled from the server!");
        break;
      default:
        _showToast("Please Check your internet connection!");
        break;
    }
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    OneContext().popAllDialogs();
    _handleError(error);
    //debugPrint(" \x1B[31m${error.response}\x1B[0m");
    super.onError(error, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // debugPrint(" \x1B[32m${options.baseUrl}${options.path}\x1B[0m");
    // debugPrint(" \x1B[32m${options.headers}\x1B[0m");
    // debugPrint(" \x1B[32m${options.queryParameters}\x1B[0m");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 500) {
      showErrorDialog(
          OneContext().context!, "Please Check your internet connection!");
    }

    final status = response.data['status']?.toString();
    if (status == "3") {
      ref.watch(sharedPreferencesProvider).clear();
      ref.watch(goRouterProvider).go("/login");
      //   debugPrint(" \x1B[31m${response.data}\x1B[0m");
    } else if (status == "0") {
      _showToast(response.data['message']?.toString() ?? "Unknown error");
      // debugPrint(" \x1B[31m${response.data}\x1B[0m");
    } else if (status == "1") {
      // /debugPrint(" \x1B[32m${response.data}\x1B[0m");
    }

    super.onResponse(response, handler);
  }
}
