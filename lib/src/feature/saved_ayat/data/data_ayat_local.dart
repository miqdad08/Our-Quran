import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../surah_detail/domain/model/ayat.dart';
import '../../surah_detail/domain/model/surat_detail_model.dart';

class DataAyatLocal {

  static List<Ayat> listDataSavedAyatLocal = [];

  static const savedAyatKey = 'savedAyatKey';

  static getSavedAyat() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(savedAyatKey) ?? '';
    // return List<SuratDetailModel>.from(jsonDecode(result).map((x) => SuratDetailModel.fromJson(x),),).toList();
    return jsonDecode(result);
  }

  static removeSavedAyat()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(savedAyatKey);
  }

  static void setSavedAyat(SuratDetailModel suratDetailModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(savedAyatKey, jsonEncode(suratDetailModel.toMap()));
  }


}

class SavedAyatLocal {
  static const String savedAyatLocalKey = 'savedAyatLocalKey';

  static Future<bool> getSavedAyatLocal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(savedAyatLocalKey) ?? false;
  }

  static void setSavedAyatLocal(bool isSaved) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(savedAyatLocalKey, isSaved);
  }

  static void savedAyatRemove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(savedAyatLocalKey);
  }
}
