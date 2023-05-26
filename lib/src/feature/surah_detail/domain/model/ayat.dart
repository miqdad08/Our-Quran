import 'dart:convert';

class Ayat {
  Ayat({
    this.id,
    this.surah,
    this.nomor,
    this.ar,
    this.tr,
    this.idn,
  });

  int? id;
  int? surah;
  int? nomor;
  String? ar;
  String? tr;
  String? idn;

  factory Ayat.fromRawJson(String str) => Ayat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ayat.fromJson(Map<String, dynamic> json) =>
      Ayat(
        id: json["id"],
        surah: json["surah"],
        nomor: json["nomor"],
        ar: json["ar"],
        tr: json["tr"],
        idn: json["idn"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "surah": surah,
        "nomor": nomor,
        "ar": ar,
        "tr": tr,
        "idn": idn,
      };
}