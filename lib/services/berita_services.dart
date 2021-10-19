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
}
