part of '../widgets.dart';

class NewsCardDaerah extends StatelessWidget {
  final Function? onTap;
  final String imageUrl;
  final String? title;
  const NewsCardDaerah(
      {Key? key, this.onTap, required this.imageUrl, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 11, top: 11),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ChaceImage(
                    imageUrl: imageUrl.toString(),
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 2.8)),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.8,
            child: Text(
              title.toString(),
              style: whiteTextStyle.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              // softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
