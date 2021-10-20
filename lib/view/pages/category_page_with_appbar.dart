part of 'pages.dart';

class CategoryPageWithAppBar extends StatefulWidget {
  final int? idKategori;
  final String? categoryTerkini;
  const CategoryPageWithAppBar(
      {Key? key, this.categoryTerkini, this.idKategori})
      : super(key: key);

  @override
  State<CategoryPageWithAppBar> createState() => _CategoryPageWithAppBarState();
}

class _CategoryPageWithAppBarState extends State<CategoryPageWithAppBar> {
  // ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return HeaderWidget(
      isButtonSearch: true,
      buttonSearch: () {
        //  NOTE : LAKUKAN PENCARIAN DI SINI
      },
      widget: FutureBuilder(
          future: (widget.idKategori != null)
              ? newsProvider.getBeritaById(
                  valueId: widget.idKategori!.toInt(), page: 1.toInt())
              : newsProvider.getBerita(widget.categoryTerkini.toString()),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              List<BeritaModel> dataBerita = snapshot.data;
              int index = 0;
              return ListView(
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
                                    builder: (context) => DetailPage(
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
                            bottom: (dataBerita.last == e) ? 50 : 0),
                        child: NewsCard(
                          onTap: () {
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
                        ),
                      );
              }).toList());
            } else if (snapshot.hasError) {
              return const CardHasErrorWidget();
            }

            // LOADING SHIMER EFFECT
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
          }),
    );
  }

  // void _getMoreData() {
  //   if (!isLoading) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //   }
  // }
}
