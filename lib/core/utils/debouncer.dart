import 'dart:async';

class Debouncer {
  final Duration delay;

  Timer? _timer;

  Debouncer({this.delay = const Duration(milliseconds: 500)});

  void call(void Function() action) {
    _timer?.cancel();

    _timer = Timer(delay, action);
  }

  void cancel() {
    _timer?.cancel();
  }

  void dispose() {
    cancel();
  }
}

class Throttler {
  final Duration delay;

  bool _isReady = true;
  Timer? _timer;

  Throttler({this.delay = const Duration(milliseconds: 500)});

  void call(void Function() action) {
    if (!_isReady) return;

    _isReady = false;
    action();

    _timer = Timer(delay, () {
      _isReady = true;
    });
  }

  void cancel() {
    _timer?.cancel();
    _isReady = true;
  }

  void dispose() {
    cancel();
  }
}
