import 'package:dio/dio.dart';
import 'package:internshala/app/app.locator.dart';
import 'package:internshala/app/app.logger.dart';
import 'package:internshala/services/EasyLoader/easy_loader.service.dart';
import 'package:internshala/utility/helper_utils.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // adding of accesstoken logic is done here based on the header
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // if json for all api response have same structure then we can pass every json here with a diffrentiator such as "dto_type" field in the response
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    getLogger("className").e(err);
    if (err.type == DioErrorType.badResponse) {
      final statusCode = err.response?.statusCode;

      if (statusCode != null && statusCode == 418) {
        locator<EasyLoadingService>()
            .showErrorToast(title: "status 418", description: err.toString());
      } else {
        locator<EasyLoadingService>().showErrorToast(
            title: "something went wrong", description: err.toString());
      }

      return handler.next(err);
    }
    hideLoader();
    return handler.next(err);
  }
}
