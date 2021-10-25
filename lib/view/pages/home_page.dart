part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late PageController pageController;
  ScrollController listController = ScrollController();

  @override
  void initState() {
    super.initState();
    potraidScreen();
    selectedIndex = 0;
    pageController = PageController(initialPage: selectedIndex);
  }

  void potraidScreen() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120.h,
        title: Column(
          children: [
            Row(
              children: [
                // LOGO :
                Expanded(
                    child: Image.asset(
                  imagesAssets + 'logo_header.png',
                  fit: BoxFit.cover,
                )),
                const SizedBox(
                  width: 20,
                ),
                ClipOval(
                  child: Container(
                    color: blueColor,
                    width: 35,
                    height: 35,
                    child: Center(
                      child: IconButton(
                        iconSize: 30,
                        color: whiteColor,
                        onPressed: () {},
                        icon: const Icon(Icons.search, size: 23),
                      ),
                    ),
                  ),
                )
              ],
            ),

            // NOTE : Get KATEGORI BERITA
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  FutureBuilder(
                      future: newsProvider.getKategoriBerita(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          List<KategoriModel> data = snapshot.data;
                          return SizedBox(
                            height: 35,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              primary: false,
                              // itemExtent: selectedIndex.toDouble(),
                              controller: listController,
                              physics: const ScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              children: data
                                  .map((e) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 24),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedIndex =
                                                      data.indexOf(e);
                                                  pageController.jumpToPage(
                                                      data.indexOf(e));
                                                });
                                              },
                                              child: SizedBox(
                                                height: 30,
                                                child: Text(
                                                  e.nama.toString(),
                                                  style: (data.indexOf(e) ==
                                                          selectedIndex)
                                                      ? blackTextStyle.copyWith(
                                                          color: blueColor,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500)
                                                      : greyTextStyle.copyWith(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          );
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
                        // return shimerCard(context);
                        return SizedBox(
                          width: double.infinity,
                          height: 25,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Shimmer.fromColors(
                                  baseColor: softBlue,
                                  highlightColor: whiteColor,
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 6),
                                      height: 25,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: whiteColor,
                                      )),
                                );
                              }),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: newsProvider.getKategoriBerita(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              List<KategoriModel> data = snapshot.data;
              return PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: data.map((e) {
                  if (selectedIndex == 0) {
                    return const BeritaTerkiniPage();
                  } else {
                    return ByCategoryPage(
                      idKategori: e.id!.toInt(),
                    );
                  }
                }).toList(),
              );
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
            return shimerCard(context);
          }),
    );
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
