part of 'pages.dart';

class ByCategoryPage extends StatefulWidget {
  final int? idKategori;
  const ByCategoryPage({Key? key, this.idKategori}) : super(key: key);

  @override
  State<ByCategoryPage> createState() => _ByCategoryPageState();
}

class _ByCategoryPageState extends State<ByCategoryPage> {
  ScrollController scrollController = ScrollController();
  // bool isLoading = false, allLoaded = false;
  // bool isVisible = false;
  List<BeritaModel> dataBerita = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      final newsProvider = Provider.of<NewsProvider>(context, listen: false);
      newsProvider
          .getBeritaById(
              valueId: widget.idKategori!.toInt(), page: page + 1.toInt())
          .then((val) {
        page = BeritaModel.currentPage!.toInt();
        setState(() {
          dataBerita.addAll(val);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var newsProvider = Provider.of<NewsProvider>(context);
    // newsProvider.getBeritaById(valueId: widget.idKategori!.toInt(), page: page);

    return Scaffold(
        backgroundColor: softBlue,
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return (index == 0)
                ? Container(
                    margin: const EdgeInsets.all(8),
                    child: HeadLineWidget(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      beritaModel: dataBerita[index],
                                    )));
                      },
                      imageURL: dataBerita[index].gambar.toString(),
                      badgeColor: Colors.amber,
                      category: dataBerita[index].kategori,
                      dateTime: dataBerita[index].tanggal.toString(),
                      title: dataBerita[index].judul,
                    ),
                  )
                : Container(
                    color: whiteColor,
                    padding: EdgeInsets.only(
                        left: 6,
                        right: 6,
                        bottom:
                            (dataBerita.last == dataBerita[index]) ? 50 : 0),
                    child: NewsCard(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      beritaModel: dataBerita[index],
                                    )));
                      },
                      categoryOnTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryPageWithAppBar(
                                      idKategori:
                                          dataBerita[index].idKategori!.toInt(),
                                    )));
                      },
                      category: dataBerita[index].kategori,
                      date: dataBerita[index].tanggal.toString(),
                      imageUrl: dataBerita[index].gambar.toString(),
                      title: dataBerita[index].judul,
                    ),
                  );
          },
          controller: scrollController,
          itemCount: dataBerita.length,
        ));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
