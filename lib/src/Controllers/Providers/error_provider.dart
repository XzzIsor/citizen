class ErrorProvider {
  static String _error = '';

  static set error(String message) {
    _error = message;
  }

  static String get error {
    String? aux = _error;
    _error = '';
    return aux;
  }
}
