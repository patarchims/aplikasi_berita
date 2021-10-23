part of 'pages.dart';

class YouTubeVideoPage extends StatefulWidget {
  final String name;
  final String urlVideo;
  const YouTubeVideoPage({Key? key, required this.name, required this.urlVideo})
      : super(key: key);

  @override
  _YouTubeVideoPageState createState() => _YouTubeVideoPageState();
}

class _YouTubeVideoPageState extends State<YouTubeVideoPage> {
  @override
  void initState() {
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black12,
        title: Text(widget.name.toString(), style: whiteTextStyle),
      ),
    );
  }
}
