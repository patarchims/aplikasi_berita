import 'dart:convert';

import 'package:berita_app/api/api_db.dart';
import 'package:berita_app/models/iklan_model.dart';
import 'package:berita_app/utils/event/event_pref.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IklanServices {
  static Future getIklan(int number, BuildContext context) async {
    print('GET API IKLAN');
    try {
      var result = await http.get(Uri.parse(ApiDb.ads + number.toString()));
      if (result.statusCode == 200) {
        var data = jsonDecode(result.body);

        List<IklanModel> iklanModel = (data['data'] as Iterable)
            .map((e) => IklanModel.fromJson(e))
            .toList();

        List<String> iklan = (data['data'] as Iterable)
            .map((e) => IklanModel.fromJson(e))
            .cast<String>()
            .toList();

        await EventPref.setStringListValue('iklan', iklan);

        return iklanModel;
      } else {
        return <IklanModel>[];
      }
    } catch (e) {
      print(Error.safeToString(e));
    }
  }
}
