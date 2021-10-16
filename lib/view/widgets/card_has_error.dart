part of 'widgets.dart';

class CardHasErrorWidget extends StatelessWidget {
  final String? title;
  const CardHasErrorWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
              color: dangerColor, width: 2, style: BorderStyle.solid)),
      child: Text(
        (title != null) ? 'Data Error!' : title.toString(),
        style: const TextStyle(color: Colors.red),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
