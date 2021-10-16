part of 'widgets.dart';

class ShimerHeadlineWidget extends StatelessWidget {
  const ShimerHeadlineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: softBlue,
        highlightColor: whiteColor,
        child: Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whiteColor,
          ),
        ));
  }
}
