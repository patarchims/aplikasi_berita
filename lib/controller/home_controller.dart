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

  // callBerita(String value) async {
  //   try {
  //     postloading.value = true;
  //     var result = await beritaServices.getBerita(value);
  //     if (result != null) {
  //       getBerita.assignAll(result);
  //     } else {
  //       print("Data kosong");
  //     }
  //   } finally {
  //     postloading.value = false;
  //   }
  //   update();
  // }

  callKategori() async {
    try {
      postloading.value = true;
      var result = await KategoriServices.getKategori();
      if (result != null) {
        getKategori.addAll(result);
      } else {
        print("Data kosong");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }
}
