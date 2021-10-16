import 'package:berita_app/helper/binding.dart';
import 'package:berita_app/helper/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view/control_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? const Size(375, 812)
            : const Size(812, 375),
        builder: () => GetMaterialApp(
          initialBinding: Binding(),
          theme: ThemeData(primarySwatch: ColorPalette.materialWhiteColor),
          home: const ControlView(),
          debugShowCheckedModeBanner: false,
          title: 'Berita Gampong',
        ),
      ),
    );
  }
}
