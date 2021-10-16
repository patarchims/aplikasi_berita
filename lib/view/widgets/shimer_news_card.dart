part of 'widgets.dart';

class ShimerNewsCard extends StatelessWidget {
  const ShimerNewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: softBlue,
      highlightColor: whiteColor,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 86,
              width: 86,
              margin: const EdgeInsets.only(right: 11, top: 11),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width - 30 - 86,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(10)),
            ),
          ]),
    );
  }
}
