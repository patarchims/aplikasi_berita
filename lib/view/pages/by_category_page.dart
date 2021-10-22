part of 'pages.dart';

class ByCategoryPage extends StatefulWidget {
  final int idKategori;
  const ByCategoryPage({Key? key, required this.idKategori}) : super(key: key);

  @override
  State<ByCategoryPage> createState() => _ByCategoryPageState();
}

class _ByCategoryPageState extends State<ByCategoryPage> {
  ScrollController scrollController = ScrollController();
  int page = 1;
  List<BeritaModel> beritaModel = [];
  bool loading = false, alloaded = false;

  void getData() {
    if (alloaded) {
      return;
    }

    setState(() {
      loading = true;
    });

    BeritaServices.getBeritaByCategory(valueId: widget.idKategori, page: page)
        .then((value) {
      setState(() {
        page = page + 1;
        beritaModel.addAll(value);
        loading = false;
        alloaded = beritaModel.isEmpty;
      });
    });
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (beritaModel.isNotEmpty) {
            return Stack(
              children: [
                ListView.separated(
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          child: HeadLineWidget(
                            onTap: () {
                              Get.to(() => DetailPage(
                                    beritaModel: beritaModel[index],
                                  ));
                            },
                            imageURL: beritaModel[index].gambar.toString(),
                            badgeColor: Colors.amber,
                            category: beritaModel[index].kategori,
                            dateTime: beritaModel[index].tanggal.toString(),
                            title: beritaModel[index].judul,
                          ),
                        );
                      } else if (index < beritaModel.length) {
                        return Container(
                          color: whiteColor,
                          padding: EdgeInsets.only(
                              left: 6,
                              right: 6,
                              bottom: (beritaModel.last == beritaModel[index])
                                  ? 50
                                  : 0),
                          child: NewsCard(
                            onTap: () {
                              Get.to(() =>
                                  DetailPage(beritaModel: beritaModel[index]));
                            },
                            categoryOnTap: () {},
                            category: beritaModel[index].kategori,
                            date: beritaModel[index].tanggal.toString(),
                            imageUrl: beritaModel[index].gambar.toString(),
                            title: beritaModel[index].judul,
                          ),
                        );
                      } else {
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

                      //  (index <= beritaModel.length)
                    },
                    separatorBuilder: (context, index) {
                      return Container();
                    },
                    itemCount: beritaModel.length),
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
          } else {
            return SizedBox(
              child: Center(
                child: CircularProgressIndicator(
                  color: blueColor,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
