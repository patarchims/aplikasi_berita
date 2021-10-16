part of 'widgets.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final Alignment alignment;
  final int? maxLines;
  final double? height;

  const CustomText({
    Key? key,
    this.text = '',
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.maxLines,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: color,
          fontSize: fontSize.sp,
          height: height,
        ),
        // ),
        maxLines: maxLines,
      ),
    );
  }
}
