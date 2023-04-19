import 'package:intl/intl.dart';

String timeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);
  if (difference.inDays > 0) {
    return DateFormat('MMM d').format(dateTime);
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  } else {
    return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
  }
}