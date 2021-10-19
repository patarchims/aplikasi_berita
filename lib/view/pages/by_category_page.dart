part of 'pages.dart';

class ByCategoryPage extends StatefulWidget {
  final int? idKategori;
  const ByCategoryPage({Key? key, this.idKategori}) : super(key: key);

  @override
  State<ByCategoryPage> createState() => _ByCategoryPageState();
}

class _ByCategoryPageState extends State<ByCategoryPage> {
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isVisible = false;
  // late List<BeritaModel> beritaModel;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    isVisible = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);

    bool onNotification(ScrollNotification notification) {
      if (notification is ScrollNotification) {
        if (scrollController.position.maxScrollExtent >
                scrollController.offset &&
            scrollController.position.maxScrollExtent -
                    scrollController.offset <=
                50) {
          // scrollController.addListener(() {
          //   if (scrollController.position.atEdge) {
          //     if (isVisible) {
          //       setState(() {
          //         isVisible = false;
          //       });
          //     }
          //   } else {
          //     if (isVisible) {
          //       setState(() {
          //         isVisible = true;
          //       });
          //     }
          //   }
          // });
          setState(() {
            if (scrollController.position.atEdge) {
              if (isVisible) {
                setState(() {
                  isVisible = false;
                });
              }
            } else {
              if (isVisible) {
                setState(() {
                  isVisible = true;
                });
              }
            }
          });
        }
      }
      return true;
    }

    return Scaffold(
        backgroundColor: softBlue,
        body: FutureBuilder(
            future: newsProvider.getBeritaById(
                valueId: widget.idKategori!.toInt(), currentPage: 1.toInt()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                List<BeritaModel> dataBerita = snapshot.data;

                int index = 0;
                return NotificationListener(
                  onNotification: onNotification,
                  child: Stack(
                    // alignment: Alignment.center,
                    children: [
                      ListView(
                          controller: scrollController,
                          children: dataBerita.map((e) {
                            index++;
                            return (index == 1)
                                ? Container(
                                    margin: const EdgeInsets.all(8),
                                    child: HeadLineWidget(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(
                                                      beritaModel: e,
                                                    )));
                                      },
                                      imageURL: e.gambar.toString(),
                                      badgeColor: Colors.amber,
                                      category: e.kategori,
                                      dateTime: e.tanggal.toString(),
                                      title: e.judul,
                                    ),
                                  )
                                : Container(
                                    color: whiteColor,
                                    padding: EdgeInsets.only(
                                        left: 6,
                                        right: 6,
                                        bottom:
                                            (dataBerita.last == e) ? 50 : 0),
                                    child: NewsCard(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(
                                                      beritaModel: e,
                                                    )));
                                      },
                                      categoryOnTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CategoryPageWithAppBar(
                                                      idKategori:
                                                          e.idKategori!.toInt(),
                                                    )));
                                      },
                                      category: e.kategori,
                                      date: e.tanggal.toString(),
                                      imageUrl: e.gambar.toString(),
                                      title: e.judul,
                                    ),
                                  );
                          }).toList()),
                      // const SizedBox(
                      //   height: 48,
                      // ),
                      Visibility(
                        visible: isVisible,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width / 3.5,
                            height: 40,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: blueColor, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                label: Text(
                                  isLoading ? 'Loading...' : 'See More',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                icon: isLoading
                                    ? const CircularProgressIndicator()
                                    : const Icon(
                                        Icons.panorama_fish_eye_rounded,
                                        size: 14,
                                      ),
                                onPressed: () {
                                  if (isLoading == false) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                  }
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return const CardHasErrorWidget();
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
            }));
  }
}
