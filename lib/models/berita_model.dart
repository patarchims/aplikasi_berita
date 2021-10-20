part of 'models.dart';

class BeritaModel {
  static int? currentPage;
  int? id;
  int? idKategori;
  String? judul;
  String? subJudul;
  String? gambar;
  String? tanggal;
  String? isi;
  int? dibaca;
  String? kategori;
  String? namaUser;
  String? seo;

  BeritaModel({
    required this.id,
    required this.idKategori,
    required this.judul,
    this.subJudul,
    this.gambar,
    required this.tanggal,
    this.isi,
    required this.dibaca,
    required this.kategori,
    required this.namaUser,
    this.seo,
  });

  BeritaModel.fromJson(json) {
    id = json['id'];
    idKategori = json["id_kategori"];
    judul = json["judul"];
    subJudul = json["sub_judul"];
    gambar = json["gambar"];
    tanggal = json["tanggal"];
    isi = json["isi"];
    dibaca = json["dibaca"];
    kategori = json["kategori"];
    namaUser = json["nama_user"];
    seo = json["seo"];
  }
}
