import 'package:coffeeapp/models/file_model.dart';
import 'package:coffeeapp/utils/all_strings.dart';
import 'package:dio/dio.dart';

class CoffeeImageDataProvider {
  Future<FileModel> getCoffeeImage() async {
    Dio dio = Dio();
    try {
      final response =
          await dio.get(AllStrings.apiUrl);
      if (response.statusCode == 200) {
        return FileModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load file');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
