part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int)? onTap;

  const CustomTabBar({
    Key? key,
    required this.selectedIndex,
    required this.titles,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: titles
            .map((e) => Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (onTap != null) {
                            onTap!(titles.indexOf(e));
                            
                          }
                        },
                        child: Text(
                          e,
                          style: (titles.indexOf(e) == selectedIndex)
                              ? blackTextStyle.copyWith(
                                  color: blueColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)
                              : greyTextStyle.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
