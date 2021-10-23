part of 'pages.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  ScrollController scrollController = ScrollController();
  int page = 1;
  List<VideoModel> videoModel = [];
  bool loading = false, alloaded = false;

  @override
  void initState() {
    super.initState();
    getData();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !loading) {
        getData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void getData() {
    if (alloaded) {
      return;
    }

    setState(() {
      loading = true;
    });

    BeritaServices.getVideo(page: page).then((value) {
      setState(() {
        page = page + 1;
        videoModel.addAll(value);
        loading = false;
        alloaded = videoModel.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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

          // NOTE : TAMPILKAN VIDEO LIST
          Expanded(child: LayoutBuilder(
            builder: (context, constraints) {
              if (videoModel.isNotEmpty) {
                return Stack(
                  children: [
                    ListView.separated(
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          if (index < videoModel.length) {
                            // TAMPILKAN LIST DARI VIDEO
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // NOTE : COLUMN
                                SizedBox(
                                    child: Column(
                                  children: [
                                    Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ChaceImage(
                                            imageUrl: videoModel[index]
                                                .image
                                                .toString(),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2.4,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2.4,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: const Color(0xFFFFFFFF)
                                                  .withOpacity(0.48)),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: const CircleBorder(),
                                                primary: redColor),
                                            child: Container(
                                              padding: const EdgeInsets.all(20),
                                              child: FaIcon(
                                                  FontAwesomeIcons.play,
                                                  color: blackColor,
                                                  size: 42),
                                            ),
                                            onPressed: () {
                                              // NOTE : GOTO VIDEO PLAY
                                              Get.to(() => YouTubeVideoPage(
                                                    name: videoModel[index]
                                                        .judul
                                                        .toString(),
                                                    urlVideo: videoModel[index]
                                                        .videKode
                                                        .toString(),
                                                  ));
                                            },
                                          ),
                                        ]),
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 6),
                                        child: Text(
                                          videoModel[index].judul.toString(),
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
                          } else {
                            // JIKA TIDAK ADA DI LOAD
                            return Container(
                              color: Colors.red,
                              width: constraints.maxWidth,
                              height: 100,
                              child: Text(
                                "Nothing more to load",
                                style: blackTextStyle,
                              ),
                            );
                          }
                        },
                        separatorBuilder: (context, index) {
                          return Container();
                        },
                        itemCount: videoModel.length),
                    if (loading) ...[
                      Positioned(
                          left: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: constraints.maxWidth,
                            child: Center(
                                child: CircularProgressIndicator(
                              color: blueColor,
                            )),
                          ))
                    ]
                  ],
                );
              }
              return Container(
                height: 86 * 5 + 24 + 250,
                color: whiteColor,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      if ([index].first == 0) {
                        return const ShimerHeadlineWidget();
                      } else {
                        return Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: const ShimerNewsCard());
                      }
                    }),
              );
            },
          ))
        ],
      ),
    );
  }
}
