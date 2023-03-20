import 'package:flutter/widgets.dart';

const mapBoxUrl =
    'https://api.mapbox.com/styles/v1/riyanurdiansyah/ckzuyk2fw000t14rxqq0ihk05/tiles/256/{z}/{x}/{y}@2x?access_token={access_token}';
const mapBoxToken =
    "pk.eyJ1Ijoicml5YW51cmRpYW5zeWFoIiwiYSI6ImNrenR4bHI1ZjF0N3cycHBlZ3BqZWVnbDYifQ.jXKBY_ELaTu1NhkRAk-J-Q";
const mapBoxStyle = "mapbox://styles/riyanurdiansyah/clebpkm1d000t01qniy0k9lwr";

const String exampleImage =
    "https://firebasestorage.googleapis.com/v0/b/arkademi-flutter-v201.appspot.com/o/BannerV2%2Fbannermobile.jpg?alt=media&token=a74f5fc1-4067-4c92-89a5-74e89bc9a9ce";

const String loremIpsum =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

const String tokenWA =
    "EAAQaNZBfVULMBACZBmqbeXJy4mamrO5Bp1L59T0yq4sgu8fXImHicsf2z8Dd26M9czCEIbCSKxR05qzuN499GMrUmzZADkQQkKlNgXbK9JMkxD3x8ChyK2DrrZCBmVrcODcZCYZACsslzZAZBBqbMPF3Au1g7AkEJFeGZCUg8tXmOUc7qChxzSz1vKLhvdz4NnskKF2rBBrzfT72XrLZB9LTif";

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);

  if (diff.inDays >= 1) {
    return '${diff.inDays} day(s) ago';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours} hours ago';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes} minutes ago';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds} seconds ago';
  } else {
    return 'just now';
  }
}

/// Signature for a function that creates a widget for a given `day`.
typedef DayBuilder = Widget? Function(BuildContext context, DateTime day);

/// Signature for a function that creates a widget for a given `day`.
/// Additionally, contains the currently focused day.
typedef FocusedDayBuilder = Widget? Function(
    BuildContext context, DateTime day, DateTime focusedDay);

/// Signature for a function returning text that can be localized and formatted with `DateFormat`.
typedef TextFormatter = String Function(DateTime date, dynamic locale);

/// Gestures available for the calendar.
enum AvailableGestures { none, verticalSwipe, horizontalSwipe, all }

/// Formats that the calendar can display.
enum CalendarFormat { month, twoWeeks, week }

/// Days of the week that the calendar can start with.
enum StartingDayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

/// Returns a numerical value associated with given `weekday`.
///
/// Returns 1 for `StartingDayOfWeek.monday`, all the way to 7 for `StartingDayOfWeek.sunday`.
int getWeekdayNumber(StartingDayOfWeek weekday) {
  return StartingDayOfWeek.values.indexOf(weekday) + 1;
}

/// Returns `date` in UTC format, without its time part.
DateTime normalizeDate(DateTime date) {
  return DateTime.utc(date.year, date.month, date.day);
}

/// Checks if two DateTime objects are the same day.
/// Returns `false` if either of them is null.
bool isSameDay(DateTime? a, DateTime? b) {
  if (a == null || b == null) {
    return false;
  }

  return a.year == b.year && a.month == b.month && a.day == b.day;
}
