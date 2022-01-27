part of 'providers.dart';

class NewsProvider extends ChangeNotifier {
  getBerita(String value, BuildContext context) async {
    try {
      var result = await http.get(Uri.parse(ApiDb.berita + value));
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Awesome Snackbar!'),
          action: SnackBarAction(
            label: 'Action',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
    }
  }

  getKategoriBerita() async {
    var result = await http.get(Uri.parse(ApiDb.kategori));
    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      List<KategoriModel> beritaModel = (data['data'] as Iterable)
          .map((e) => KategoriModel.fromJson(e))
          .toList();
      return beritaModel;
    } else {
      return <KategoriModel>[];
    }
  }

  static getBeritaById({int? valueId, int page = 1}) async {
    var result = await http.get(
        Uri.parse(ApiDb.kategori + valueId.toString() + "/${page.toString()}"));
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
  }

  getBeritaTerkait(int valueId) async {
    var result = await http.get(Uri.parse(ApiDb.terkait + valueId.toString()));
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

  getRedaksi() async {
    var result = await http.get(Uri.parse(ApiDb.redaksi));
    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      RedaksiModel beritaModel = RedaksiModel.fromJson(data);
      return beritaModel;
    } else {
      return <RedaksiModel>[];
    }
  }

  getVideo({int page = 1, int amount = 5}) async {
    var result = await http.get(Uri.parse(
        ApiDb.videoLink + "/${page.toString()}/${amount.toString()}"));
    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      List<VideoModel> videoModel = (data['data'] as Iterable)
          .map((e) => VideoModel.fromJson(e))
          .toList();
      return videoModel;
    } else {
      return <VideoModel>[];
    }
  }
}
