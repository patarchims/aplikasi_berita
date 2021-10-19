part of 'pages.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  int currentPage = 1;
  int amount = 5;

  @override
  void initState() {
    super.initState();
    currentPage = 1;
    amount = 5;
  }

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return HeaderWidget(
      buttonSearch: () {
        // NOTE BUTTON CARI
      },
      isButtonSearch: true,
      isBack: false,
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 21, bottom: 14),
              child: Text("VIDEO BERITA",
                  style: blueTextStyle, textAlign: TextAlign.left)),
          Expanded(
            child: FutureBuilder(
                future:
                    newsProvider.getVideo(page: currentPage, amount: amount),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    List<VideoModel> data = snapshot.data;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // NOTE : COLUMN
                              SizedBox(
                                  child: Column(
                                children: [
                                  Stack(alignment: Alignment.center, children: [
                                    ChaceImage(
                                      imageUrl: data[index].image.toString(),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.4,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: const Color(0xFFFFFFFF)
                                            .withOpacity(0.48)),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          primary: redColor),
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        child: FaIcon(FontAwesomeIcons.play,
                                            color: blackColor, size: 42),
                                      ),
                                      onPressed: () {
                                        // NOTE :
                                        //  launchUrl(
                                        //   widget.spaceModel.mapUrl.toString());
                                        // URL.launchWebView(videoYotubeLink +
                                        //     data[index].videKode.toString());
                                      },
                                    ),
                                  ]),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 6),
                                      child: Text(
                                        data[index].judul.toString(),
                                        style: blackTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.clip,
                                        maxLines: 3,
                                        textAlign: TextAlign.left,
                                      ))
                                ],
                              )),
                            ],
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Data Error!',
                        style: TextStyle(color: Colors.red),
                        textDirection: TextDirection.ltr,
                      ),
                    );
                  }
                  return Shimmer.fromColors(
                      baseColor: softBlue,
                      highlightColor: whiteColor,
                      child: GridView.builder(
                          itemCount: 10 * 3,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: (context, index) {
                            return Container(
                                decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ));
                          }));
                }),
          ),
        ],
      ),
    );
  }
}
