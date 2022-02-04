part of '../pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F7FC),
        body: Center(
          child: Image.asset(logoAssets + 'splash_logo.png'),
        ));
  }
}
