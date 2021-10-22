part of 'services.dart';

class BeritaServices {
  // NOTE: GET DATA HEADLINE
  Future<List<BeritaModel>> getBerita(String value) async {
    var result = await http.get(Uri.parse(ApiDb.berita + value.toString()));
    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      List<BeritaModel> beritaModel = (data['data'] as Iterable)
          .map((e) => BeritaModel.fromJson(e))
          .toList();
      return beritaModel;
    } else {
      return <BeritaModel>[];
    }
  }

  static Future<List<BeritaModel>> getBeritaByCategory(
      {int? valueId, int page = 1}) async {
    List<BeritaModel> beritaModel = [];
    try {
      var result = await http.get(Uri.parse(
          ApiDb.kategori + valueId.toString() + "/${page.toString()}"));
      if (result.statusCode == 200) {
        var data = jsonDecode(result.body);
        BeritaModel.currentPage = data['halaman'];
        List<BeritaModel> beritaModel = (data['data'] as Iterable)
            .map((e) => BeritaModel.fromJson(e))
            .toList();
        return beritaModel;
      } else {
        return <BeritaModel>[];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return beritaModel;
  }
}
