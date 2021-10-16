part of 'widgets.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
      children: [
        // LOGO :
        Expanded(
            child: Image.asset(
          imagesAssets + 'logo_header.png',
          fit: BoxFit.cover,
        )),
        const SizedBox(
          width: 20,
        ),
        ClipOval(
          child: Container(
            color: blueColor,
            width: 35,
            height: 35,
            child: Center(
              child: IconButton(
                iconSize: 30,
                color: whiteColor,
                onPressed: () {},
                icon: const Icon(Icons.search, size: 23),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
