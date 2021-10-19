part of 'services.dart';

class KategoriServices {
  // NOTE : GET KATEGORI
  static Future<List<KategoriModel>> getKategori() async {
    var result = await http.get(Uri.parse(ApiDb.kategori));
    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      // print(data);
      List<KategoriModel> kategoriModel = (data['data'] as Iterable)
          .map((e) => KategoriModel.fromJson(e))
          .toList();
      return kategoriModel;
    } else {
      return <KategoriModel>[];
    }
  }
}
