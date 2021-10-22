part of 'widgets.dart';

class ChaceImage extends StatelessWidget {
  final String imageUrl;
  final String? imagePhone;
  final double? height;
  final double? width;

  const ChaceImage(
      {Key? key,
      required this.imageUrl,
      this.imagePhone = 'image_default.png',
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: ValueKey(key),
      imageUrl: imageUrl.toString(),
      fit: BoxFit.cover,
      height: height,
      width: width,
      placeholder: (context, url) => Image.asset(
        imagesAssets + imagePhone.toString(),
        fit: BoxFit.cover,
        height: 240,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
        size: 24,
      ),
    );
  }
}
