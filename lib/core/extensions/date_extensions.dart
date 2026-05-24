import '../utils/date_formatter.dart';

extension DateTimeExtensions on DateTime {
  String get formattedDate {
    return DateFormatter.formatDate(this);
  }

  String get formattedDateTime {
    return DateFormatter.formatDateTime(this);
  }

  String get formattedTime {
    return DateFormatter.formatTime(this);
  }

  String get apiDate {
    return DateFormatter.formatApiDate(this);
  }

  String get apiDateTime {
    return DateFormatter.formatApiDateTime(this);
  }

  String get orderDate {
    return DateFormatter.formatOrderDate(this);
  }

  String get deliveryDate {
    return DateFormatter.formatDeliveryDate(this);
  }

  String get shortDate {
    return DateFormatter.formatShortDate(this);
  }

  String get reviewDate {
    return DateFormatter.formatReviewDate(this);
  }

  String get timeAgo {
    return DateFormatter.timeAgo(this);
  }

  bool get isToday {
    final DateTime now = DateTime.now();

    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  bool get isTomorrow {
    final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));

    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  bool get isPast {
    return isBefore(DateTime.now());
  }

  bool get isFuture {
    return isAfter(DateTime.now());
  }

  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  int get daysFromNow {
    return difference(DateTime.now()).inDays;
  }

  int get daysAgo {
    return DateTime.now().difference(this).inDays;
  }
}
