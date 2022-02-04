import 'package:berita_app/models/models.dart';
import 'package:berita_app/providers/providers.dart';
import 'package:berita_app/utils/helper/theme.dart';
import 'package:berita_app/view/pages/category/categori.dart';
import 'package:berita_app/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class DaerahWidget extends StatefulWidget {
  const DaerahWidget({Key? key}) : super(key: key);

  @override
  State<DaerahWidget> createState() => _DaerahWidgetState();
}

class _DaerahWidgetState extends State<DaerahWidget> {
  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return Container(
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
                          padding: EdgeInsets.only(left: (number == 1) ? 8 : 0),
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
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: Text("Date Error", style: dangerTextStyle),
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
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            baseColor: softBlue,
                            highlightColor: whiteColor);
                      }),
                );
              }),
        ]));
  }
}
