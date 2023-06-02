
class SavedAyat {
  String id;
  String surah;
  int ayat;
  int indexAyat;
  int lastRead;
  String ayatText;
  String ayatTranslate;

  SavedAyat({
    required this.id,
    required this.surah,
    required this.ayat,
    required this.indexAyat,
    required this.lastRead,
    required this.ayatText,
    required this.ayatTranslate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'surah': surah,
      'ayat': ayat,
      'index_ayat': indexAyat,
      'last_read': lastRead,
    };
  }

  factory SavedAyat.fromMap(Map<String, dynamic> map) {
    return SavedAyat(
      id: map['id'],
      surah: map['surah'],
      ayat: map['ayat'],
      indexAyat: map['index_ayat'],
      lastRead: map['last_read'],
      ayatText: map['ayat_text'],
      ayatTranslate: map['ayat_translate'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "ayat": ayat,
        "index_ayat": indexAyat,
        "last_read": lastRead,
        "ayat_text": ayatText,
        "ayat_translate": ayatTranslate,
      };

  factory SavedAyat.fromJson(Map<String, dynamic> json) => SavedAyat(
        id: json["id"],
        surah: json["surah"],
        ayat: json["ayat"],
        indexAyat: json["index_ayat"],
        lastRead: json["last_read"],
        ayatText: json['ayat_text'],
        ayatTranslate: json["ayat_translate"],
      );
}
