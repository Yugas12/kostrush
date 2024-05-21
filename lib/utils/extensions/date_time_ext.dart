import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatDate() {
    final date = toLocal();
    final formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');

    return formatter.format(date);
  }

  String formatDateOnly() {
    final date = toLocal();
    final formatter = DateFormat('dd MMMM yyyy', 'id_ID');

    return formatter.format(date);
  }

  String formatTime() {
    final date = toLocal();
    final formatter = DateFormat('HH:mm', 'id_ID');

    return formatter.format(date);
  }
}
