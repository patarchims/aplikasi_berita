part of 'models.dart';

class RedaksiModel {
  String? nama;
  String? isi;

  RedaksiModel({
    this.nama,
    this.isi,
  });

  RedaksiModel.fromJson(json) {
    nama = json['nama'];
    isi = json['isi'];
  }
}
