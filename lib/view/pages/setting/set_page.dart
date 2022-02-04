import 'package:berita_app/models/iklan_model.dart';
import 'package:berita_app/models/iklan_web_model.dart';
import 'package:berita_app/providers/db_provider.dart';
import 'package:berita_app/providers/iklan_provider.dart';
import 'package:berita_app/utils/helper/theme.dart';
import 'package:berita_app/view/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPage extends StatefulWidget {
  const SetPage({Key? key}) : super(key: key);

  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  // final _userController = Get.put(UserController());
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Container(),
        home: Scaffold(
            backgroundColor: blueColor,
            body: FutureBuilder(
                future: _loadFromApi(),
                // ignore: avoid_types_as_parameter_names
                builder: (_, context) {
                  return Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 52,
                          width: 52,
                          child: CircularProgressIndicator(
                            color: whiteColor,
                            strokeWidth: 2,
                          ),
                        ),
                        SizedBox(
                            height: 42,
                            child: Image.asset(
                              iconsAssets + 'logo_loading.png',
                            )),
                      ],
                    ),
                  );
                })));
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = IklanApiProvider();
    await apiProvider.getAllEmployees();
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
      Get.off(() => const MainPage());
    });
  }

  _buildEmployeeListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllIklan(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<IklanWeb> iklan = snapshot.data;
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  "${index + 1}",
                  style: const TextStyle(fontSize: 20.0),
                ),
                title: Text(iklan[index].urlImage.toString()),
                subtitle: const Text('EMAIL: '),
              );
            },
          );
        }
      },
    );
  }
}
