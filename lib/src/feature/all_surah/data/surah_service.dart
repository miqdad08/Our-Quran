import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myquran/src/feature/all_surah/domain/model/surat_model.dart';

import '../../../const/api_const.dart';

class SurahService {
  final http.Client client;

  SurahService({required this.client});

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
}
