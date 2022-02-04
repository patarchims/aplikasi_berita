import 'package:berita_app/providers/providers.dart';
import 'package:berita_app/utils/helper/theme.dart';
import 'package:berita_app/view/pages/category/categori.dart';
import 'package:berita_app/view/widgets/news/list_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class TerkiniWidget extends StatefulWidget {
  const TerkiniWidget({Key? key}) : super(key: key);

  @override
  TerkiniWidgetState createState() => TerkiniWidgetState();
}

class TerkiniWidgetState extends State<TerkiniWidget> {
  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return Container(
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
                  Get.to(() =>
                      const CategoryPageWithAppBar(categoryTerkini: "terkini"));
                },
                child: Text(
                  "LIHAT SEMUA",
                  style: blueTextStyle.copyWith(fontSize: 12),
                ),
              )
            ],
          ),

          // Note : BERITA TERKINI :

          ListCategory(newsProvider: newsProvider, idBerita: 'terkini'),
          const SizedBox(height: 12),
          const BannerAd(size: BannerSize.ADAPTIVE),
        ],
      ),
    );
  }
}
