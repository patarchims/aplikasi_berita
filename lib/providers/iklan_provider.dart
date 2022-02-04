import 'package:berita_app/api/api_db.dart';
import 'package:berita_app/models/iklan_web_model.dart';
import 'package:berita_app/providers/db_provider.dart';
import 'package:dio/dio.dart';

class IklanApiProvider {
  Future getAllEmployees() async {
    try {
      var response = await Dio().get(ApiDb.ads);
      Iterable iklanModel = (response.data['data'] as Iterable)
          .map((e) => DBProvider.db.createIklan(IklanWeb.fromJson(e)));

      return iklanModel;
    } on DioError catch (e) {
      return e.error;
    }
  }
}
