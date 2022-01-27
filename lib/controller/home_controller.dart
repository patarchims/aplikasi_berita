part of 'controller.dart';

class HomeController extends GetxController {
  List<BeritaModel> getBerita = [];
  List<KategoriModel> getKategori = [];

  List<BeritaModel> get headline => getBerita.obs;

  List<KategoriModel> get kategori => getKategori.obs;

  KategoriServices kategoriServices = KategoriServices();
  BeritaServices beritaServices = BeritaServices();

  var postloading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // callBerita('headline');
    callKategori();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  callKategori() async {
    try {
      postloading.value = true;
      var result = await KategoriServices.getKategori();
      // ignore: unnecessary_null_comparison
      if (result != null) {
        getKategori.addAll(result);
      } else {
        // ignore: avoid_print
        print("Data kosong");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }
}
