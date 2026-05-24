extension StringExtensions on String {
  bool get isBlank => trim().isEmpty;

  bool get isNotBlank => trim().isNotEmpty;

  String get capitalize {
    final String value = trim();

    if (value.isEmpty) return value;

    return value[0].toUpperCase() + value.substring(1).toLowerCase();
  }

  String get titleCase {
    final String value = trim();

    if (value.isEmpty) return value;

    return value.split(RegExp(r'\s+')).map((word) => word.capitalize).join(' ');
  }

  String get removeExtraSpaces {
    return trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;

    return '${substring(0, maxLength)}$suffix';
  }

  String maskEmail() {
    final List<String> parts = split('@');

    if (parts.length != 2) return this;

    final String name = parts[0];
    final String domain = parts[1];

    if (name.length <= 2) {
      return '${name[0]}***@$domain';
    }

    return '${name.substring(0, 2)}***@$domain';
  }

  String maskPhone() {
    final String value = replaceAll(RegExp(r'\s+'), '');

    if (value.length <= 4) return value;

    return '***${value.substring(value.length - 4)}';
  }

  bool get isValidEmail {
    final RegExp emailRegex = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegex.hasMatch(trim());
  }

  bool get isValidPhone {
    final String value = replaceAll(RegExp(r'\s+'), '');

    final RegExp phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');

    return phoneRegex.hasMatch(value);
  }

  double? get toDoubleOrNull {
    return double.tryParse(trim());
  }

  int? get toIntOrNull {
    return int.tryParse(trim());
  }
}
