import 'package:berita_app/utils/helper/theme.dart';
import 'package:berita_app/view/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ShimerCard extends StatelessWidget {
  const ShimerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86 * 5 + 24,
      color: whiteColor,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(top: ([index].first == 0) ? 0 : 4),
                child: const ShimerNewsCard());
          }),
    );
  }
}
