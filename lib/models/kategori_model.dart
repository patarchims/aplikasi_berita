part of 'models.dart';

class KategoriModel {
  int? id;
  String? nama;
  int? jumlah;

  KategoriModel({
    required this.nama,
    required this.jumlah,
    required this.id,
  });

  KategoriModel.fromJson(json) {
    id = json['id'];
    nama = json['nama'].toString();
    jumlah = json['jumlah'];
  }
}
