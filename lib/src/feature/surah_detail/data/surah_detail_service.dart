import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../const/api_const.dart';
import '../domain/model/surat_detail_model.dart';

class SurahDetailService {
  final http.Client client;

  SurahDetailService({required this.client});

  Future<Either<String, SuratDetailModel>> getDetailSurat(
      int nomorSurat) async {
    try {
      final response =
          await client.get(Uri.parse('${ApiConst.baseUrl}/surat/$nomorSurat'));
      return Right(SuratDetailModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      print(e);
      return left(e.toString());
    }
  }


}
