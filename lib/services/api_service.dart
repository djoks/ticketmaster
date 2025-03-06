import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:ticketmaster/app/app_database.dart';
import 'package:ticketmaster/services/connectivity_service.dart';
import 'package:ticketmaster/utils/locator.dart';
import 'package:ticketmaster/utils/logger.dart';

/// A service that handles API requests with Dio, including caching and connectivity checks.
class ApiService {
  late final Dio _dio;
  final AppDatabase appDatabase = AppDatabase();
  final ConnectivityService connectivityService =
      locator<ConnectivityService>();

  // Private constructor.
  ApiService._internal();

  /// Asynchronous factory method to create and initialize an instance of [ApiService].
  static Future<ApiService> create() async {
    final instance = ApiService._internal();
    await instance._init();
    return instance;
  }

  /// Initializes the Dio instance with caching and response interceptors.
  Future<void> _init() async {
    final directory = await getApplicationDocumentsDirectory();
    final databasePath = p.join(directory.path, 'cache_db.sqlite');

    final cacheOptions = CacheOptions(
      store: DbCacheStore(
        databasePath: databasePath,
        databaseName: 'ticketmaster',
      ),
      // Use network request when online, otherwise force cache.
      policy: connectivityService.isOnline.value
          ? CachePolicy.request
          : CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
      priority: CachePriority.normal,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    String baseUrl = const String.fromEnvironment('API_BASE_URL',
        defaultValue: 'https://www.example.com');
    int connectionTimeout =
        const int.fromEnvironment('API_CONNECTION_TIMEOUT', defaultValue: 10);
    int receiveTimeout =
        const int.fromEnvironment('API_RECEIVE_TIMEOUT', defaultValue: 10);

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: connectionTimeout),
        receiveTimeout: Duration(seconds: receiveTimeout),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        queryParameters: {
          'apikey': const String.fromEnvironment('API_KEY',
              defaultValue: 'your_api_key'),
        },
      ),
    );

    // Add caching interceptor.
    _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    // Add an interceptor to show a toast when a response is loaded from cache.
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          if (response.extra.containsKey('@fromNetwork@') &&
              response.extra['@fromNetwork@'] == false) {
            Fluttertoast.showToast(
              msg: "Loaded from cache.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          }
          handler.next(response);
        },
      ),
    );
  }

  /// Sends a GET request to the specified [url] with optional [queryParameters].
  Future<Response> get({required String url, dynamic queryParameters}) async {
    try {
      return await _dio.get(url, queryParameters: queryParameters);
    } on DioException catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  /// Sends a POST request to the specified [url] with the given [data] and optional [queryParameters].
  Future<Response> post(
      {required String url, dynamic data, dynamic queryParameters}) async {
    try {
      return await _dio.post(url, data: data, queryParameters: queryParameters);
    } on DioException catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  /// Sends a DELETE request to the specified [url] with optional [queryParameters].
  Future<Response> delete(
      {required String url, dynamic queryParameters}) async {
    try {
      return await _dio.delete(url, queryParameters: queryParameters);
    } on DioException catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }

  /// Sends a PATCH request to the specified [url] with the given [data].
  Future<Response> patch({required String url, dynamic data}) async {
    try {
      return await _dio.patch(url, data: data);
    } on DioException catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}
