// App Duration Formatter
// v.0.0.1
// by Elriz Wiraswara

// Duration formatter
class DurationFormatter {
  DurationFormatter._();

  static String format(DateTime from, DateTime time) {
    return from.difference(time).inSeconds < 60
        ? 'Just now'
        : from.difference(time).inMinutes < 60
            ? '${time.minute}min'
            : from.difference(time).inHours < 24
                ? '${time.hour}h'
                : from.difference(time).inDays < 365
                    ? '${time.day}d'
                    : '${time.year}y';
  }

  static String formatDetailed(DateTime from, DateTime time) {
    return from.difference(time).inSeconds < 60
        ? '${time.second}sec'
        : from.difference(time).inMinutes < 60
            ? '${time.minute}min ${time.second}sec'
            : from.difference(time).inHours < 24
                ? '${time.hour}h ${time.minute}min'
                : from.difference(time).inDays < 365
                    ? '${time.day}d ${time.hour}h'
                    : '${time.year}y ${time.day}d';
  }
}
