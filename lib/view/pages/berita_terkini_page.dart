part of 'pages.dart';

class BeritaTerkiniPage extends StatefulWidget {
  const BeritaTerkiniPage({Key? key}) : super(key: key);

  @override
  State<BeritaTerkiniPage> createState() => _BeritaTerkiniPageState();
}

class _BeritaTerkiniPageState extends State<BeritaTerkiniPage> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    AppServices.checkVersionApp(context);
  }

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            const SizedBox(
              height: 7,
            ),
            // NOTE: TAMPILKAN SLIDER BERITA HEADLINE
            FutureBuilder(
                future: newsProvider.getBerita('headline', context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<BeritaModel> data = snapshot.data;
                    return Column(
                      children: <Widget>[
                        // NOTE : CAROUSEL SLIDER
                        CarouselSlider(
                            items: data.map((e) {
                              return HeadLineWidget(
                                categoryOnTap: () {
                                  Get.to(() => CategoryPageWithAppBar(
                                      idKategori: e.idKategori!.toInt()));
                                },
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                                beritaModel: e,
                                              )));
                                },
                                imageURL: e.gambar.toString(),
                                badgeColor: Colors.amber,
                                category: e.kategori,
                                dateTime: e.tanggal.toString(),
                                title: e.judul,
                              );
                            }).toList(),
                            options: CarouselOptions(
                                height: 240,
                                viewportFraction: 1,
                                aspectRatio: 2.0,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                })),

                        Container(
                          padding: const EdgeInsets.only(
                              bottom: 6, left: 6, right: 6, top: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: data.asMap().entries.map((e) {
                                    return GestureDetector(
                                      onTap: () {
                                        _carouselController
                                            .animateToPage(e.key);
                                      },
                                      child: Container(
                                        height: 12,
                                        width: 12,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ((Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark)
                                                    ? Colors.white
                                                    : blueColor)
                                                .withOpacity(_current == e.key
                                                    ? 0.9
                                                    : 0.4)),
                                      ),
                                    );
                                  }).toList()),
                            ],
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const CardHasErrorWidget();
                  }
                  return const ShimerHeadlineWidget();
                }),

            const SizedBox(
              height: 8,
            ),

            // // NOTE: BERITA TERKINI
            Container(
              padding: const EdgeInsets.all(8),
              color: whiteColor,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BERITA TERKINI",
                        style: blueTextStyle,
                      ),
                      InkWell(
                        onTap: () {
                          // Note : Fungsi ontap Lihat Semua Berita
                          Get.to(() => const CategoryPageWithAppBar(
                              categoryTerkini: "terkini"));
                        },
                        child: Text(
                          "LIHAT SEMUA",
                          style: blueTextStyle.copyWith(fontSize: 12),
                        ),
                      )
                    ],
                  ),

                  // Note : BERITA TERKINI :
                  listCategory(newsProvider, 'terkini'),
                ],
              ),
            ),

            const SizedBox(height: 8),
            Container(
                // padding: const EdgeInsets.all(8),
                color: whiteColor,
                width: double.infinity,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "BERITA DAERAH",
                          style: blueTextStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),

                  // Note : BERITA DAERAH :

                  FutureBuilder(
                      future: newsProvider.getBerita('1', context),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          List<BeritaModel> data = snapshot.data;
                          int number = 0;
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: data.map((e) {
                                number++;
                                return Container(
                                  padding: EdgeInsets.only(
                                      left: (number == 1) ? 8 : 0),
                                  child: NewsCardDaerah(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                    beritaModel: e,
                                                  )));
                                    },
                                    imageUrl: e.gambar.toString(),
                                    title: e.judul,
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Center(
                                    child: Text("Date Error",
                                        style: dangerTextStyle),
                                  )));
                        }
                        // NOTE : Effect SHIMMER
                        return SizedBox(
                          height: 160,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Shimmer.fromColors(
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 6),
                                      height: 160,
                                      width: 135,
                                      decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    baseColor: softBlue,
                                    highlightColor: whiteColor);
                              }),
                        );
                      }),
                ])),

            // NOTE: BERITA GAMPONG
            Container(
              padding: const EdgeInsets.all(8),
              color: whiteColor,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BERITA GAMPONG",
                        style: blueTextStyle,
                      ),
                      const Spacer(),
                    ],
                  ),

                  // Note : BERITA GAMPONG :
                  listCategory(newsProvider, '2'),
                ],
              ),
            ),

            // NOTE: BERITA NASIONAL
            Container(
              padding: const EdgeInsets.all(8),
              color: whiteColor,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BERITA NASIONAL",
                        style: blueTextStyle,
                      ),
                      const Spacer(),
                    ],
                  ),

                  // Note : BERITA NASIONAL :
                  listCategory(newsProvider, '3'),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<dynamic> listCategory(
      NewsProvider newsProvider, String idBerita) {
    return FutureBuilder(
        future: newsProvider.getBerita(idBerita.toString(), context),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            List<BeritaModel> data = snapshot.data;
            return Column(
              children: data.map((e) {
                return NewsCard(
                  categoryOnTap: () {
                    Get.to(() => CategoryPageWithAppBar(
                        idKategori: e.idKategori!.toInt()));
                  },
                  onTap: () {
                    // NOTE : GO TO DETAIL PAGE
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  beritaModel: e,
                                )));
                  },
                  category: e.kategori,
                  date: e.tanggal.toString(),
                  imageUrl: e.gambar.toString(),
                  title: e.judul,
                );
              }).toList(),
            );
          }
          return shimerCard(context);
        });
  }

  Container shimerCard(BuildContext context) {
    return Container(
      height: 86 * 5 + 24,
      color: whiteColor,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(top: ([index].first == 0) ? 0 : 4),
                child: const ShimerNewsCard());
          }),
    );
  }
}
