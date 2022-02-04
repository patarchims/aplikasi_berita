import 'package:berita_app/utils/helper/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IklanWidget extends StatelessWidget {
  final String image;
  final double? height;
  const IklanWidget({Key? key, required this.image, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: CachedNetworkImage(
        key: ValueKey(key),
        imageUrl: image.toString(),
        fit: BoxFit.fitWidth,
        height: height,
        width: Get.width,
        // placeholder: (context, url) => Image.asset(
        //   imagesAssets + 'image_default.png',
        //   fit: BoxFit.cover,
        //   height: 50,
        // ),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.red,
          size: 24,
        ),
      ),
    );
  }
}

class IklanBig extends StatelessWidget {
  final String image;
  const IklanBig({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: CachedNetworkImage(
        key: ValueKey(key),
        imageUrl: image.toString(),
        fit: BoxFit.fitWidth,
        width: Get.width,
        placeholder: (context, url) => Image.asset(
          imagesAssets + 'image_default.png',
          fit: BoxFit.cover,
          height: 50,
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: Colors.red,
          size: 24,
        ),
      ),
    );
  }
}
