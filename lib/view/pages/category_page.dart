part of 'pages.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    double widthBox = MediaQuery.of(context).size.width / 2.6;

    return HeaderWidget(
      buttonSearch: () {
        // NOTE BUTTON CARI
      },
      isButtonSearch: true,
      isBack: false,
      widget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE : KATEGORY
              Container(
                  margin: const EdgeInsets.only(top: 21, bottom: 14),
                  child: Text("KATEGORI BERITA",
                      style: blueTextStyle, textAlign: TextAlign.left)),

              Expanded(
                child: FutureBuilder(
                    future: newsProvider.getKategoriBerita(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data != null) {
                        List<KategoriModel> data = snapshot.data;
                        return GridView.count(
                          // primary: false,
                          // padding: const EdgeInsets.only(left: 10),
                          // crossAxisSpacing: 10.0,
                          crossAxisCount: 2,
                          // mainAxisSpacing: 5,
                          children: List.generate(
                            data.length,
                            (index) => InkWell(
                              onTap: () {
                                // NOTE : FUNGSI ONTAP
                                Get.to(RouteNames.detailPage);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             CategoryPageWithAppBar(
                                //               idKategori: data[index].id,
                                //             )));
                              },
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: ChaceImage(
                                      imageUrl:
                                          "https://images.unsplash.com/photo-1556691421-cf15fe27a0b6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHRlY2h8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                                      width: widthBox,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: widthBox / 2,
                                        padding: const EdgeInsets.all(16),
                                        // height:
                                        //     MediaQuery.of(context).size.height /
                                        //         3,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              bottomRight: Radius.circular(16),
                                              topLeft: Radius.circular(16)),
                                          color: redColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                              data[index].jumlah.toString(),
                                              textAlign: TextAlign.center,
                                              style: whiteTextStyle.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        )),
                                  ),
                                  Container(
                                      width: widthBox,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: blueColor,
                                          gradient: LinearGradient(
                                              end: Alignment.topCenter,
                                              begin: Alignment.bottomCenter,
                                              colors: [
                                                const Color(0xFF262437)
                                                    .withOpacity(0.84),
                                                const Color(0xFFFFFFFF)
                                                    .withOpacity(0),
                                              ])),
                                      child: Center(
                                        child: Text(data[index].nama.toString(),
                                            textAlign: TextAlign.center,
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 18)),
                                      )),
                                ],
                              ),
                            ),
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
            ]),
      ),
    );
  }
}
