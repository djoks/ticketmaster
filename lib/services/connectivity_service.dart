import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// A service that periodically checks network connectivity using Dio.
///
/// This service exposes a [ValueNotifier] named [isOnline] which can be
/// listened to by UI widgets to reactively update based on connectivity changes.
class ConnectivityService {
  /// Maximum duration allowed for each connectivity request.
  final Duration timeout;

  /// Interval at which connectivity is checked.
  final Duration interval;

  Timer? _timer;

  /// A [ValueNotifier] that holds the current connectivity status.
  /// `true` indicates an active internet connection, while `false` means offline.
  final ValueNotifier<bool> isOnline = ValueNotifier<bool>(false);

  /// Creates a new instance of [ConnectivityService].
  ///
  /// [timeout] sets the maximum allowed time for each connectivity check.
  /// [interval] defines how often the connectivity is verified.
  ConnectivityService({
    this.timeout = const Duration(seconds: 5),
    this.interval = const Duration(seconds: 5),
  });

  /// Checks network connectivity by performing a GET request to a lightweight URL.
  ///
  /// If the response status code is 200, it updates [isOnline] to `true`;
  /// otherwise, it sets it to `false`.
  Future<void> checkConnection() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get(
        'https://www.google.com',
        options: Options(
          receiveTimeout: Duration(milliseconds: timeout.inMilliseconds),
          sendTimeout: Duration(milliseconds: timeout.inMilliseconds),
        ),
      );
      isOnline.value = response.statusCode == 200;
    } catch (_) {
      isOnline.value = false;
    }
  }

  /// Starts periodic checks for network connectivity.
  ///
  /// Cancels any existing timer before starting a new one.
  void startPeriodicNetworkChecks() {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) => checkConnection());
  }

  /// Stops periodic network connectivity checks.
  void stopPeriodicNetworkChecks() {
    _timer?.cancel();
  }
}
