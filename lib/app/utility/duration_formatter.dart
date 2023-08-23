// Duration Formatter
class DurationFormatter {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
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
        ? '${from.difference(time).inSeconds}sec'
        : from.difference(time).inMinutes < 60
            ? '${from.difference(time).inMinutes}min'
            : from.difference(time).inHours < 24
                ? '${from.difference(time).inHours}h'
                : from.difference(time).inDays < 365
                    ? '${from.difference(time).inDays}d'
                    : '${(from.difference(time).inDays / 365.25).floor()}y';
  }
}
