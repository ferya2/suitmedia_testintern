import 'package:dio/dio.dart';
import 'package:test_suitmedia/models/person_models.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<PersonModel> fetchData() async {
    try {
      final response = await _dio.get('https://reqres.in/api/users');
      if (response.statusCode == 200) {
        return PersonModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
