part of 'pages.dart';

class DetailPage extends StatefulWidget {
  // final Function? categoryOnTap;
  final BeritaModel? beritaModel;
  const DetailPage({
    Key? key,
    this.beritaModel,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return HeaderWidget(
      isButtonShare: true,
      buttonShare: () {
        // Fungsi Share
        Share.share(ApiDb.shareLink + widget.beritaModel!.seo.toString());
      },
      widget: InteractiveViewer(
        child: ListView(
          children: [
            // DETAIL PAGE
            ChaceImage(
              imageUrl: widget.beritaModel!.gambar.toString(),
              height: 215,
              width: double.infinity,
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: (widget.beritaModel!.subJudul != null)
                  ? Text(widget.beritaModel!.subJudul.toString(),
                      style: greyTextStyle.copyWith(fontSize: 8))
                  : Text("", style: greyTextStyle.copyWith(fontSize: 8)),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: (widget.beritaModel!.judul != null)
                  ? Text(widget.beritaModel!.judul.toString(),
                      style: blackTextStyle.copyWith(
                          fontSize: 21, fontWeight: FontWeight.bold))
                  : Text("", style: greyTextStyle.copyWith(fontSize: 8)),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: BadgetWidget(
                onTap: () {
                  Get.to(() => CategoryPageWithAppBar(
                      idKategori: //               idKategori:
                          widget.beritaModel!.idKategori!.toInt()));
                },
                badgeColor: Colors.amber,
                category: widget.beritaModel!.kategori,
                tanggal: widget.beritaModel!.tanggal.toString(),
                textColor: Colors.black,
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Html(
                  data: widget.beritaModel!.isi.toString(),
                  style: {
                    "body": Style(
                      fontSize: const FontSize(19.0),
                      fontWeight: FontWeight.w500,
                    ),
                  },
                )),

            const SizedBox(
              height: 16,
            ),

            // NOTE: BERITA TERKAIT
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
                          "BERITA TERKAIT",
                          style: blueTextStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),

                  // Note : BERITA TERKAIT :
                  FutureBuilder(
                      future: newsProvider
                          .getBeritaTerkait(widget.beritaModel!.id!.toInt()),
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
          ],
        ),
      ),
    );
  }
}
