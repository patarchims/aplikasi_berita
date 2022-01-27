import 'package:berita_app/helper/binding.dart';
import 'package:berita_app/helper/color_palette.dart';
import 'package:berita_app/providers/providers.dart';
import 'package:berita_app/routes/routes.dart';
import 'package:berita_app/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
        builder: () => MultiProvider(
          providers: [
            // NOTE : PROVIDER HERE
            ChangeNotifierProvider(
              create: (context) => NewsProvider(),
            ),
          ],
          child: GetMaterialApp(
            getPages: AppPages.pages,
            defaultTransition: Transition.fade,
            initialBinding: Binding(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: ColorPalette.materialWhiteColor),
            home: const ControlView(),
            title: 'Berita Gampong',
          ),
        ),
      ),
    );
  }
}
