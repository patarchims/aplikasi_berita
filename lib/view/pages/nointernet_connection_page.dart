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
            Image.asset(imagesAssets + 'no_internet.png',
                fit: BoxFit.cover, height: 350.h, width: double.infinity),
            const CircularProgressIndicator(),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 9),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: blueColor),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: CustomText(
                    text: 'Silakan periksa koneksi internet Anda..',
                    fontSize: 16,
                    color: whiteColor,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
