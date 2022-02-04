part of '../widgets.dart';

class NewsCard extends StatelessWidget {
  final Function? onTap;
  final String? imageUrl;
  final String? title;
  final String? category;
  final String? date;
  final Function? categoryOnTap;
  const NewsCard(
      {Key? key,
      this.imageUrl,
      this.title,
      this.category,
      this.date,
      this.onTap,
      this.categoryOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        color: whiteColor,
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 11, top: 11),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ChaceImage(
                    imageUrl: imageUrl.toString(),
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 3)),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Note : Judul dan Keterangan Tanggal
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
                  child: Text(
                    title.toString(),
                    style: whiteTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                ),
                const SizedBox(height: 6),
                BadgetWidget(
                  onTap: () {
                    if (categoryOnTap != null) {
                      categoryOnTap!();
                    }
                  },
                  textColor: blackColor,
                  badgeColor: Colors.amber,
                  category: category,
                  tanggal: date.toString(),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
