import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_suitmedia/models/person_models.dart';
import 'package:test_suitmedia/service/fetchapi_service.dart';

class ThirdScreenProvider with ChangeNotifier {
  PersonModel? personModel;

  Future<void> getData() async {
    try {
      personModel = await ApiService().fetchData();
      notifyListeners();
      print(personModel!.data[0]);
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.response?.statusCode}');
      }
    } finally {
      notifyListeners();
    }
  }
}
