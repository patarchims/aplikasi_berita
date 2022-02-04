part of '../pages.dart';

class RedaksiPage extends StatelessWidget {
  const RedaksiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    return HeaderWidget(
      isButtonSearch: true,
      buttonSearch: () {
        //  NOTE : LAKUKAN PENCARIAN DI SINI
      },
      isBack: false,
      widget: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: FutureBuilder(
            future: newsProvider.getRedaksi(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                RedaksiModel data = snapshot.data;

                return ListView(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(data.nama.toString(),
                        style: blueTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w300)),
                    Html(data: data.isi),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return const CardHasErrorWidget();
              }
              return Shimmer.fromColors(
                  baseColor: softBlue,
                  highlightColor: whiteColor,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(top: 16),
                      color: whiteColor,
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                    ),
                    itemCount: 20,
                  ));
            }),
      ),
    );
  }
}
