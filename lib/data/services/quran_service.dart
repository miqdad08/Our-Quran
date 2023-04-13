import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myquran/data/api_const.dart';
import 'package:myquran/data/models/surat_detail_model.dart';
import 'package:myquran/data/models/surat_model.dart';

class QuranService {
  final http.Client client;

  QuranService({required this.client});

  Future<Either<String, List<SuratModel>>> getAllSurat() async {
    try {
      final response = await client.get(Uri.parse('${ApiConst.baseUrl}/surat'));
      return Right(
        List<SuratModel>.from(
          jsonDecode(response.body).map(
            (x) => SuratModel.fromJson(x),
          ),
        ).toList(),
      );
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, SuratDetailModel>> getDetailSurat(int nomorSurat) async {
    try {
      final response = await client.get(Uri.parse('${ApiConst.baseUrl}/surat/$nomorSurat'));
      return Right(SuratDetailModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return left(e.toString());
    }
  }
}
