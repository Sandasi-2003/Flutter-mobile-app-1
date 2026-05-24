import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../utils/utils.dart';

enum NetworkStatus { online, offline }

class ConnectivityService {
  ConnectivityService._();

  static final ConnectivityService instance = ConnectivityService._();

  final Connectivity _connectivity = Connectivity();

  final StreamController<NetworkStatus> _statusController =
      StreamController<NetworkStatus>.broadcast();

  StreamSubscription<ConnectivityResult>? _subscription;

  NetworkStatus _currentStatus = NetworkStatus.online;
  ConnectivityResult _currentConnectionType = ConnectivityResult.none;

  Stream<NetworkStatus> get statusStream => _statusController.stream;

  NetworkStatus get currentStatus => _currentStatus;

  ConnectivityResult get currentConnectionType => _currentConnectionType;

  bool get isOnline => _currentStatus == NetworkStatus.online;

  bool get isOffline => _currentStatus == NetworkStatus.offline;

  Future<void> init() async {
    await checkConnection();

    _subscription ??= _connectivity.onConnectivityChanged.listen(
      _handleConnectivityChange,
      onError: (Object error, StackTrace stackTrace) {
        AppLogger.error(
          'Connectivity listener error',
          error: error,
          stackTrace: stackTrace,
        );
      },
    );
  }

  Future<NetworkStatus> checkConnection() async {
    try {
      final ConnectivityResult result = await _connectivity.checkConnectivity();

      return _handleConnectivityChange(result);
    } catch (error, stackTrace) {
      AppLogger.error(
        'Failed to check connectivity',
        error: error,
        stackTrace: stackTrace,
      );

      _updateStatus(
        status: NetworkStatus.offline,
        connectionType: ConnectivityResult.none,
      );

      return _currentStatus;
    }
  }

  NetworkStatus _handleConnectivityChange(ConnectivityResult result) {
    final NetworkStatus status = _mapConnectivityResult(result);

    _updateStatus(status: status, connectionType: result);

    return status;
  }

  NetworkStatus _mapConnectivityResult(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      return NetworkStatus.offline;
    }

    return NetworkStatus.online;
  }

  void _updateStatus({
    required NetworkStatus status,
    required ConnectivityResult connectionType,
  }) {
    _currentStatus = status;
    _currentConnectionType = connectionType;

    if (!_statusController.isClosed) {
      _statusController.add(status);
    }

    AppLogger.debug(
      'Network status: $_currentStatus, connection: $_currentConnectionType',
    );
  }

  String get connectionTypeName {
    switch (_currentConnectionType) {
      case ConnectivityResult.mobile:
        return 'Mobile';
      case ConnectivityResult.wifi:
        return 'Wi-Fi';
      case ConnectivityResult.ethernet:
        return 'Ethernet';
      case ConnectivityResult.vpn:
        return 'VPN';
      case ConnectivityResult.bluetooth:
        return 'Bluetooth';
      case ConnectivityResult.other:
        return 'Other';
      case ConnectivityResult.none:
        return 'None';
    }
  }

  Future<bool> hasConnection() async {
    final NetworkStatus status = await checkConnection();

    return status == NetworkStatus.online;
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;

    await _statusController.close();
  }
}
