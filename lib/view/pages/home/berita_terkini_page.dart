part of '../pages.dart';

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
                future: IklanServices.getIklan(1, context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    // NOTE : CAROUSEL SLIDER
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }

                    if (snapshot.data.isNotEmpty) {
                      List<IklanModel> data = snapshot.data;
                      return CarouselSlider(
                          items: data.map((e) {
                            return IklanWidget(
                              image: e.urlImage.toString(),
                              height: 80,
                            );
                          }).toList(),
                          options: CarouselOptions(
                              viewportFraction: 1,
                              height: 50,
                              aspectRatio: 2.0,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {}));
                    }
                  }
                  return Container();
                }),

            const SizedBox(
              height: 6,
            ),
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
                        ),

                        const SizedBox(
                          height: 12,
                        ),
                        const BannerAd(size: BannerSize.ADAPTIVE),

                        // LIST IKLAN KEDUA
                        FutureBuilder(
                            future: IklanServices.getIklan(2, context),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                // NOTE : CAROUSEL SLIDER
                                if (snapshot.data == null) {
                                  return Container();
                                }

                                if (snapshot.data != null) {
                                  List<String> data = snapshot.data;
                                  return getTextWidgets(data);
                                }
                              }
                              return Container();
                            }),
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

            const SizedBox(height: 8),

            const DaerahWidget(),
            // IKLAN TIGA
            FutureBuilder(
                future: IklanServices.getIklan(3, context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    // NOTE : CAROUSEL SLIDER
                    if (snapshot.data == null) {
                      return Container();
                    }

                    if (snapshot.data != null) {
                      List<IklanModel> data = snapshot.data;

                      return Expanded(
                          child: Column(
                        children: data
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: IklanBig(
                                    image: e.urlImage.toString(),
                                  ),
                                ))
                            .toList(),
                      ));
                    }
                  }
                  return Container();
                }),

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
                  ListCategory(newsProvider: newsProvider, idBerita: '2'),
                  const SizedBox(height: 12),
                  const BannerAd(size: BannerSize.ADAPTIVE),
                ],
              ),
            ),

            // LIST OF IKLAN TIGA
            FutureBuilder(
                future: IklanServices.getIklan(4, context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    // NOTE : CAROUSEL SLIDER
                    if (snapshot.data == null) {
                      return Container();
                    }

                    if (snapshot.data != null) {
                      List<IklanModel> data = snapshot.data;

                      return Expanded(
                          child: Column(
                        children: data
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: IklanBig(
                                    image: e.urlImage.toString(),
                                  ),
                                ))
                            .toList(),
                      ));
                    }
                  }
                  return Container();
                }),

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
                  ListCategory(newsProvider: newsProvider, idBerita: '3'),
                  const SizedBox(height: 12),
                  const BannerAd(size: BannerSize.ADAPTIVE),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            // IKLAN 5 DAN 6
            FutureBuilder(
                future: IklanServices.getIklan(5, context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    // NOTE : CAROUSEL SLIDER
                    if (snapshot.data == null) {
                      return Container();
                    }

                    if (snapshot.data != null) {
                      List<IklanModel> data = snapshot.data;

                      return Expanded(
                          child: Column(
                        children: data
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: IklanBig(
                                    image: e.urlImage.toString(),
                                  ),
                                ))
                            .toList(),
                      ));
                    }
                  }
                  return Container();
                }),

            FutureBuilder(
                future: IklanServices.getIklan(6, context),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                  }

                  if (snapshot.hasData) {
                    // NOTE : CAROUSEL SLIDER

                    List<IklanModel> data = snapshot.data;

                    return Expanded(
                        child: Column(
                      children: data
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: IklanBig(
                                  image: e.urlImage.toString(),
                                ),
                              ))
                          .toList(),
                    ));
                  }
                  return Container();
                }),
          ],
        ),
      ),
    );
  }

  Widget getTextWidgets(List<String> strings) {
    return Row(children: strings.map((item) => Text(item)).toList());
  }
}
