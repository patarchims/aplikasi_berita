import 'package:berita_app/models/models.dart';
import 'package:berita_app/providers/providers.dart';
import 'package:berita_app/view/pages/category/categori.dart';
import 'package:berita_app/view/widgets/news/shimer_card.dart';
import 'package:berita_app/view/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ListCategory extends StatefulWidget {
  final NewsProvider newsProvider;
  final String idBerita;
  const ListCategory(
      {Key? key, required this.newsProvider, required this.idBerita})
      : super(key: key);

  @override
  _ListCategoryState createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return FutureBuilder(
        future: newsProvider.getBerita(widget.idBerita.toString(), context),
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
          return const ShimerCard();
        });
  }
}
