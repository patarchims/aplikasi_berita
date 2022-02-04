import 'package:berita_app/models/iklan_web_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventPref {
  // static Future<User?> getUser() async {
  //   User? user;
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? stringUser = pref.getString('user');
  //   if (stringUser != null) {
  //     Map<String, dynamic> mapUser = jsonDecode(stringUser);
  //     user = User.fromJson(mapUser);
  //   }
  //   return user;
  // }

  static Future<void> save(IklanWeb iklan) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> list = (iklan as Iterable)
        .map((e) => IklanWeb.fromJson(e))
        .cast<String>()
        .toList();
    await pref.setStringList('as', list);
  }
  // static Future<void> saveIklan(IklanWeb iklan) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   List<String> list = (iklan as Iterable)
  //       .map((e) => IklanWeb.fromJson(e))
  //       .cast<String>()
  //       .toList();
  //   await pref.setStringList('as', list);
  // }

  static Future<void> setStringListValue(String key, List<String> value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setStringList(key, value);
  }

  // static Future<void> deleteUser() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   await pref.remove('user');
  // }
}
