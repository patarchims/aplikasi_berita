part of '../widgets.dart';

class HeadLineWidget extends StatelessWidget {
  final Function? onTap;
  final String imageURL;
  final String? title;
  final Color? badgeColor;
  final String? category;
  final String? dateTime;
  final Function? categoryOnTap;
  const HeadLineWidget(
      {Key? key,
      required this.imageURL,
      this.title,
      this.badgeColor = Colors.white,
      this.category,
      this.dateTime,
      this.categoryOnTap,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ChaceImage(
              imageUrl: imageURL.toString(),
              height: 240,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: blueColor.withOpacity(0.75),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Note : Judul dan Keterangan Tanggal
                    Text(
                      title.toString(),
                      style: whiteTextStyle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 6),
                    BadgetWidget(
                      onTap: () {
                        if (categoryOnTap != null) {
                          categoryOnTap!();
                        }
                      },
                      badgeColor: Colors.amber,
                      category: category,
                      tanggal: dateTime.toString(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
