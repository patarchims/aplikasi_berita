import 'dart:convert';
import 'package:berita_app/api/api.dart';
import 'package:berita_app/api/api_db.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiClient extends Api implements ApiDb {
  static ApiClient client = ApiClient._singleTon();

  factory ApiClient() {
    return client;
  }

  ApiClient._singleTon();

  laporkanError(String judulError, String pesanError) {
//    buat method untuk laporan
  }

  @override
  Future<void> delete(
      {String url = ApiDb.baseUrl,
      Map<String, String>? headers,
      Function(bool status, String message, Map<String, dynamic> response)?
          callback}) async {
    http.delete(Uri.parse(url), headers: headers).then((res) {
      callback!(res.statusCode == 200,
          res.statusCode == 200 ? "Sukses" : "Gagal", jsonDecode(res.body));
      debugPrint("print apa aja yang kamu butuhkan");
    }).catchError((err) {
      callback!(false, err.toString(), {});
      laporkanError("judulError", "pesanError");
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      callback!(false, "Timeout", {});
      laporkanError("judulError", "pesanError");
    });
  }

  @override
  Future<void> get(
      {String url = ApiDb.baseUrl,
      Map<String, String>? headers,
      Function(bool status, String message, Map<String, dynamic> response)?
          callback}) async {
    http.get(Uri.parse(url), headers: headers).then((res) {
      callback!(res.statusCode == 200,
          res.statusCode == 200 ? "Sukses" : "Gagal", jsonDecode(res.body));
    }).catchError((err) {
      callback!(false, err.toString(), {});
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      callback!(false, "Timeout", {});
    });
  }

  @override
  Future<void> post(
      {String url = ApiDb.baseUrl,
      Map<String, String>? headers,
      Map<String, String>? body,
      Function(bool status, String message, Map<String, dynamic> response)?
          callback}) async {
    http.post(Uri.parse(url), headers: headers, body: body).then((res) {
      callback!(res.statusCode == 200,
          res.statusCode == 200 ? "Sukses" : "Gagal", jsonDecode(res.body));
    }).catchError((err) {
      callback!(false, err.toString(), {});
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      callback!(false, "Timeout", {});
    });
  }

  @override
  Future<void> put(
      {String url = ApiDb.baseUrl,
      Map<String, String>? headers,
      Map<String, String>? body,
      Function(bool status, String message, Map<String, dynamic> response)?
          callback}) async {
    http.put(Uri.parse(url), headers: headers, body: body).then((res) {
      callback!(res.statusCode == 200,
          res.statusCode == 200 ? "Sukses" : "Gagal", jsonDecode(res.body));
    }).catchError((err) {
      callback!(false, err.toString(), {});
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      callback!(false, "Timeout", {});
    });
  }
}
