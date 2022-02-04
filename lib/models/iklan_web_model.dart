class IklanWeb {
  String? link;
  String? urlImage;
  int? kategori;

  IklanWeb({
    this.link,
    this.urlImage,
    this.kategori,
  });

  IklanWeb.fromJson(json) {
    link = json['link'].toString();
    urlImage = json["gambar"].toString();
    kategori = json["kategori"];
  }

  Map<String, dynamic> toJson() =>
      {'link': link, 'gambar': urlImage, 'kategori': kategori};
}
