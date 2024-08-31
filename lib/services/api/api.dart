import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:internshala/core/api_constants.dart';
import 'package:internshala/services/api/interceptors/api_interceptor.dart';
import 'package:internshala/services/api/interceptors/cache_path_provider.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

abstract class Api {
  Dio client = Dio(BaseOptions(
      baseUrl: ApiConstants.BASE_URL,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
      responseType: ResponseType.json,
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 3)));

  Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.addAll([
        DioCacheInterceptor(
            options: CacheOptions(
                store: HiveCacheStore(AppPathProvider.path),
                policy: CachePolicy.refreshForceCache,
                hitCacheOnErrorExcept: [401, 403],
                maxStale: const Duration(days: 7),
                priority: CachePriority.high)),
        ApiInterceptor(),
        TalkerDioLogger(
            settings: const TalkerDioLoggerSettings(
                printResponseData: true,
                printRequestHeaders: true,
                printRequestData: true,
                printResponseMessage: true)),
      ]);
  }

  Api() {
    addInterceptors(client);
  }
}
