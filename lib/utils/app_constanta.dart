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
    "EAAQaNZBfVULMBAGdXV4CjQKEkFArIxD0pe6aM7g98wJHOHf4M85CtTLCLXnkTMLxxuZC4IJmG5mdkVTZBJ4Xg806o45AuOZCbcjAUDQwIMTe6xeesTpQ89QGw3lbpOth1FfgQ2ii3sZBJ9tBGzjjUhBZA9eGkpEQUyU7oTuvwruKwHFt91NpG4WiHxgrZAnpyu6QDRCAFOVWtgewbtwcpwm";

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
