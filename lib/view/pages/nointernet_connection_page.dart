part of 'pages.dart';

class NoConnectionInternetPage extends StatelessWidget {
  const NoConnectionInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(imagesAssets + 'no_internet.png',
            //     fit: BoxFit.cover, height: 60.h, width: 40.w),
            const CircularProgressIndicator(),
            SizedBox(
              height: 30.h,
            ),
            const CustomText(
              text: 'Silakan periksa koneksi internet Anda..',
              fontSize: 14,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
