part of 'widgets.dart';

class CategoryBeritaCard extends StatelessWidget {
  final String? image;
  final int? jumlah;
  final String? name;
  const CategoryBeritaCard({Key? key, this.image, this.name, this.jumlah})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 120,
        // width: 74,
        child: Stack(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // height: 57,
                // width: 67,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Image.asset(
                    iconsAssets + "icon_category_berita.png",
                    fit: BoxFit.cover,
                    height: 39,
                    width: 31,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 40,
                child: Text(name.toString(),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 3,
                    style: blueTextStyle.copyWith(
                        fontSize: 10, fontWeight: FontWeight.bold)),
              )
            ]),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
              height: 16,
              width: 19,
              decoration: BoxDecoration(
                  color: const Color(0xFFFFB55F),
                  borderRadius: BorderRadius.circular(3)),
              child: Center(
                child: Text(jumlah.toString(),
                    style: whiteTextStyle.copyWith(
                      fontSize: 9,
                    )),
              )),
        ),
      ],
    ));
  }
}
