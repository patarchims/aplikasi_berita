class IklanModel {
  String? link;
  String? urlImage;

  IklanModel({
    required this.link,
    required this.urlImage,
  });

  IklanModel.fromJson(json) {
    link = json['link'].toString();
    urlImage = json["gambar"].toString();
  }
}
