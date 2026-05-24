import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static const String defaultLocale = 'en_US';

  static String formatDate(DateTime date, {String locale = defaultLocale}) {
    return DateFormat.yMMMd(locale).format(date);
  }

  static String formatDateTime(DateTime date, {String locale = defaultLocale}) {
    return DateFormat.yMMMd(locale).add_jm().format(date);
  }

  static String formatTime(DateTime date, {String locale = defaultLocale}) {
    return DateFormat.jm(locale).format(date);
  }

  static String formatDayMonth(DateTime date, {String locale = defaultLocale}) {
    return DateFormat.MMMd(locale).format(date);
  }

  static String formatMonthYear(
    DateTime date, {
    String locale = defaultLocale,
  }) {
    return DateFormat.yMMMM(locale).format(date);
  }

  static String formatApiDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatApiDateTime(DateTime date) {
    return date.toUtc().toIso8601String();
  }

  static String formatOrderDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String formatDeliveryDate(DateTime date) {
    return DateFormat('EEEE, dd MMM yyyy').format(date);
  }

  static String formatShortDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatReviewDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  static String timeAgo(DateTime date) {
    final Duration difference = DateTime.now().difference(date);

    if (difference.inSeconds < 60) {
      return 'Just now';
    }

    if (difference.inMinutes < 60) {
      final int minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    }

    if (difference.inHours < 24) {
      final int hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    }

    if (difference.inDays < 7) {
      final int days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    }

    if (difference.inDays < 30) {
      final int weeks = difference.inDays ~/ 7;
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    }

    if (difference.inDays < 365) {
      final int months = difference.inDays ~/ 30;
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    }

    final int years = difference.inDays ~/ 365;
    return '$years ${years == 1 ? 'year' : 'years'} ago';
  }

  static String deliveryEstimate({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return '${formatDayMonth(startDate)} - ${formatDayMonth(endDate)}';
  }

  static DateTime? tryParse(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    return DateTime.tryParse(value);
  }
}
