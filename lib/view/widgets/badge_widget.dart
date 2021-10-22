part of 'widgets.dart';

class BadgetWidget extends StatelessWidget {
  final Color? badgeColor;
  final String? category;
  final String? tanggal;
  final Color? textColor;
  final Function? onTap;
  const BadgetWidget(
      {Key? key,
      this.badgeColor,
      this.textColor,
      this.category,
      this.tanggal,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: MediaQuery.of(context).size.width / 5.5,
          child: ElevatedButton(
            onPressed: () {
              // Fungsi Ketika Button Diklik
              if (onTap != null) {
                onTap!();
              }
            },
            style: ElevatedButton.styleFrom(
              primary: badgeColor,
            ),
            child: Text(
              category.toString(),
              overflow: TextOverflow.ellipsis,
              style: whiteTextStyle.copyWith(
                  color: textColor ?? whiteColor, fontSize: 9),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Container(height: 16, width: 3, color: const Color(0xFFE5E5E5)),
        const SizedBox(width: 6),
        Text(
          tanggal.toString(),
          style: whiteTextStyle.copyWith(
              color: textColor ?? whiteColor,
              fontSize: 9,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
          maxLines: 2,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }
}
