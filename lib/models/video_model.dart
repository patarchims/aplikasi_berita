part of 'models.dart';

class VideoModel {
  int idVideo;
  String? judul;
  String? videKode;
  String? image;

  VideoModel({
    required this.idVideo,
    this.judul,
    this.videKode,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'idVideo': idVideo,
      'judul': judul,
      'videKode': videKode,
      'image': image,
    };
  }

  factory VideoModel.fromJson(json) {
    return VideoModel(
      idVideo: json['id'],
      judul: json['judul'],
      videKode: json['kode'],
      image: json['gambar'],
    );
  }
}
