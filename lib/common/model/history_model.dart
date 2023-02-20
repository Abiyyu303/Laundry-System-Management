import 'package:intl/intl.dart';

class HistoryModel {
  final DateTime? date;
  final String? title;
  final String? description;
  final DateTime? pickupDate;
  final DateTime? dropDate;
  final String? payment;
  final String? customerName;
  final int? totalPayment;

  String? get dateString {
    if (date != null) {
      return datetimeToDateString(date!);
    }
    return null;
  }

  String? get timeString {
    if (date != null) {
      return datetimeToTimeString(date!);
    }
    return null;
  }

  String? get pickupDateString {
    if (pickupDate != null) {
      return datetimeToDateString(pickupDate!);
    }
    return null;
  }

  String? get pickupTimeString {
    if (pickupDate != null) {
      return datetimeToTimeString(pickupDate!);
    }
    return null;
  }

  String? get dropDateString {
    if (dropDate != null) {
      return datetimeToDateString(dropDate!);
    }
    return null;
  }

  String? get dropTimeString {
    if (dropDate != null) {
      return datetimeToTimeString(dropDate!);
    }
    return null;
  }

  String datetimeToDateString(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  String datetimeToTimeString(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  HistoryModel({
    this.date,
    this.title,
    this.description,
    this.pickupDate,
    this.dropDate,
    this.payment,
    this.customerName,
    this.totalPayment,
  });
}
