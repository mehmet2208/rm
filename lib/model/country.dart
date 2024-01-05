class Country {
  int id;
  String isim;
  String durum;
  String resim;

  Country.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        isim = map["name"] ?? "",
        durum = map["status"] ?? "",
        resim = map["image"] ?? "";
}
