part of 'widgets.dart';

class CardCategoryWidget extends StatelessWidget {
  final String name;
  const CardCategoryWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ChaceImage(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.height / 5,
          imageUrl:
              "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80",
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                const Color(0xFF262437).withOpacity(0.84),
                const Color(0xFFFFFFFF).withOpacity(0),
              ],
            ),
          ),
        ),
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Text(name,
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(fontSize: 20))),
    ]);
  }
}
