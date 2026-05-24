import '../constants/constants.dart';

class Validators {
  Validators._();

  static String? required(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? AppStrings.fieldRequired;
    }

    return null;
  }

  static String? email(
    String? value, {
    String? message,
    bool isRequired = true,
  }) {
    if (!isRequired && (value == null || value.trim().isEmpty)) {
      return null;
    }

    final String? requiredError = required(value);
    if (requiredError != null) return requiredError;

    final RegExp emailRegex = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value!.trim())) {
      return message ?? AppStrings.invalidEmail;
    }

    return null;
  }

  static String? password(String? value, {String? message, int minLength = 8}) {
    final String? requiredError = required(value);
    if (requiredError != null) return requiredError;

    if (value!.trim().length < minLength) {
      return message ?? AppStrings.invalidPassword;
    }

    return null;
  }

  static String? confirmPassword(
    String? value,
    String password, {
    String? message,
  }) {
    final String? requiredError = required(value);
    if (requiredError != null) return requiredError;

    if (value != password) {
      return message ?? AppStrings.passwordMismatch;
    }

    return null;
  }

  static String? name(String? value, {String? message, int minLength = 2}) {
    final String? requiredError = required(value);
    if (requiredError != null) return requiredError;

    final String trimmedValue = value!.trim();

    if (trimmedValue.length < minLength) {
      return message ?? AppStrings.invalidName;
    }

    final RegExp nameRegex = RegExp(r"^[a-zA-Z\s'.-]+$");

    if (!nameRegex.hasMatch(trimmedValue)) {
      return message ?? AppStrings.invalidName;
    }

    return null;
  }

  static String? phone(
    String? value, {
    String? message,
    bool isRequired = true,
  }) {
    if (!isRequired && (value == null || value.trim().isEmpty)) {
      return null;
    }

    final String? requiredError = required(value);
    if (requiredError != null) return requiredError;

    final String cleanedValue = value!.replaceAll(RegExp(r'\s+'), '');

    final RegExp phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');

    if (!phoneRegex.hasMatch(cleanedValue)) {
      return message ?? AppStrings.invalidPhone;
    }

    return null;
  }

  static String? minLength(String? value, int length, {String? message}) {
    final String? requiredError = required(value);
    if (requiredError != null) return requiredError;

    if (value!.trim().length < length) {
      return message ?? 'Must be at least $length characters';
    }

    return null;
  }

  static String? maxLength(String? value, int length, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    if (value.trim().length > length) {
      return message ?? 'Must be less than $length characters';
    }

    return null;
  }

  static String? price(
    String? value, {
    String? message,
    bool allowZero = false,
  }) {
    final String? requiredError = required(value);
    if (requiredError != null) return requiredError;

    final double? parsedValue = double.tryParse(value!.trim());

    if (parsedValue == null) {
      return message ?? AppStrings.invalidPrice;
    }

    if (allowZero) {
      if (parsedValue < 0) {
        return message ?? AppStrings.invalidPrice;
      }
    } else {
      if (parsedValue <= 0) {
        return message ?? AppStrings.invalidPrice;
      }
    }

    return null;
  }

  static String? quantity(
    String? value, {
    String? message,
    int min = AppValues.minCartQuantity,
    int max = AppValues.maxCartQuantity,
  }) {
    final String? requiredError = required(value);
    if (requiredError != null) return requiredError;

    final int? parsedValue = int.tryParse(value!.trim());

    if (parsedValue == null) {
      return message ?? AppStrings.invalidQuantity;
    }

    if (parsedValue < min || parsedValue > max) {
      return message ?? AppStrings.invalidQuantity;
    }

    return null;
  }
}
