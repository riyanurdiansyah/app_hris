const String exampleImage =
    "https://firebasestorage.googleapis.com/v0/b/arkademi-flutter-v201.appspot.com/o/BannerV2%2Fbannermobile.jpg?alt=media&token=a74f5fc1-4067-4c92-89a5-74e89bc9a9ce";

const String loremIpsum =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

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
