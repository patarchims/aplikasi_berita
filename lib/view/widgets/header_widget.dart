part of 'widgets.dart';

class HeaderWidget extends StatelessWidget {
  final bool? isBack;
  final Function? buttonBack;
  final Function? buttonSearch;
  final bool? isButtonSearch;
  final bool? isButtonShare;
  final Function? buttonShare;
  final Widget widget;
  const HeaderWidget(
      {Key? key,
      required this.widget,
      this.isBack,
      this.buttonBack,
      this.isButtonShare,
      this.buttonShare,
      this.isButtonSearch,
      this.buttonSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: softBlue,
      appBar: AppBar(
          title: Row(
        children: [
          // LOGO :
          (isBack == true)
              ? ClipOval(
                  child: Container(
                    color: darkGreyColor2,
                    width: 35,
                    height: 35,
                    child: Center(
                      child: IconButton(
                        iconSize: 30,
                        color: whiteColor,
                        onPressed: () {
                          if (buttonBack != null) {
                            buttonBack!();
                          }
                        },
                        icon: const Icon(Icons.search, size: 23),
                      ),
                    ),
                  ),
                )
              : Container(),

          Expanded(
              child: Image.asset(
            imagesAssets + 'logo_header.png',
            fit: BoxFit.cover,
          )),
          const SizedBox(
            width: 20,
          ),
          (isButtonSearch == true)
              ? ClipOval(
                  child: Container(
                    color: blueColor,
                    width: 35,
                    height: 35,
                    child: Center(
                      child: IconButton(
                        color: whiteColor,
                        onPressed: () {
                          if (buttonSearch != null) {
                            buttonSearch!();
                          }
                        },
                        icon: const Icon(Icons.search, size: 20),
                      ),
                    ),
                  ),
                )
              : ClipOval(
                  child: Container(
                    height: 35,
                    width: 35,
                    color: blueColor,
                    child: Center(
                      child: IconButton(
                        color: whiteColor,
                        onPressed: () {
                          if (buttonShare != null) {
                            buttonShare!();
                          }
                        },
                        icon: const Icon(Icons.share, size: 20),
                      ),
                    ),
                  ),
                )
        ],
      )),
      body: SafeArea(bottom: false, child: widget),
    );
  }
}
