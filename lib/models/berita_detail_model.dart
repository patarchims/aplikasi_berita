part of 'models.dart';

class BeritaDetailModel {
  int id = 0;
  int idKategori = 0;
  String judul = "";
  String? gambar;
  String? tanggal;
  String? isi;
  int dibaca = 0;
  String? kategori;
  String? namaUser;

  BeritaDetailModel({
    required this.id,
    required this.idKategori,
    required this.judul,
    this.gambar,
    this.tanggal,
    this.isi,
    required this.dibaca,
    this.kategori,
    this.namaUser,
  });

  BeritaDetailModel.fromJson(json) {
    id = json['id'];
    idKategori = json["id_kategori"];
    judul = json["judul"];
    gambar = json["gambar"];
    tanggal = json["tanggal"];
    isi = json["isi"];
    dibaca = json["dibaca"];
    kategori = json["kategori"];
    namaUser = json["nama_user"];
  }
}
