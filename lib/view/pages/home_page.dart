part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        title: Column(
          children: [
            Row(
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
            ),

            // NOTE : TAMPILKAN GET KATEGORI DI SINI

            // Container(
            //   width: double.infinity,
            //   color: Colors.white,
            //   child: Column(
            //     children: [
            //       FutureBuilder(
            //           future: newsProvider.getKategoriBerita(),
            //           builder: (context, AsyncSnapshot snapshot) {
            //             if (snapshot.data != null) {
            //               List<KategoriModel> data = snapshot.data;
            //               return SizedBox(
            //                 height: 35,
            //                 child: ListView(
            //                   scrollDirection: Axis.horizontal,
            //                   primary: false,
            //                   // itemExtent: selectedIndex.toDouble(),
            //                   controller: listController,
            //                   physics: const ScrollPhysics(
            //                       parent: BouncingScrollPhysics()),
            //                   children: data
            //                       .map((e) => Padding(
            //                             padding:
            //                                 const EdgeInsets.only(right: 24),
            //                             child: Column(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.end,
            //                               children: [
            //                                 InkWell(
            //                                   onTap: () {
            //                                     setState(() {
            //                                       selectedIndex =
            //                                           data.indexOf(e);
            //                                       pageController.jumpToPage(
            //                                           data.indexOf(e));
            //                                     });
            //                                   },
            //                                   child: SizedBox(
            //                                     height: 30,
            //                                     child: Text(
            //                                       e.nama.toString(),
            //                                       style: (data.indexOf(e) ==
            //                                               selectedIndex)
            //                                           ? blackTextStyle.copyWith(
            //                                               color: blueColor,
            //                                               fontSize: 18,
            //                                               fontWeight:
            //                                                   FontWeight.w500)
            //                                           : greyTextStyle.copyWith(
            //                                               fontSize: 18,
            //                                               fontWeight: FontWeight
            //                                                   .normal),
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           ))
            //                       .toList(),
            //                 ),
            //               );
            //             } else if (snapshot.hasError) {
            //               return Container(
            //                 alignment: Alignment.center,
            //                 child: const Text(
            //                   'Data Error!',
            //                   style: TextStyle(color: Colors.red),
            //                   textDirection: TextDirection.ltr,
            //                 ),
            //               );
            //             }
            //             // return shimerCard(context);
            //             return SizedBox(
            //               width: double.infinity,
            //               height: 25,
            //               child: ListView.builder(
            //                   scrollDirection: Axis.horizontal,
            //                   itemCount: 5,
            //                   itemBuilder: (context, index) {
            //                     return Shimmer.fromColors(
            //                       baseColor: softBlue,
            //                       highlightColor: whiteColor,
            //                       child: Container(
            //                           margin: const EdgeInsets.only(right: 6),
            //                           height: 25,
            //                           width: 100,
            //                           decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(10),
            //                             color: whiteColor,
            //                           )),
            //                     );
            //                   }),
            //             );
            //           }),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
