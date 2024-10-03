import 'dart:io';

import 'package:coffeeapp/utils/all_strings.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ImageOperations {
  Future<ImageSaveStatus> saveImageLocally(String imageUrl) async {
    Dio dio = Dio();
    try {
      bool alreadySaved = await isImageAlreadySaved(imageUrl);
      if (alreadySaved) {
        return ImageSaveStatus.ALREADY;
      }

      final response = await dio.get(imageUrl,
          options: Options(responseType: ResponseType.bytes));
      if (response.statusCode == 200) {
        final bytes = response.data;

        final path = await _getLocalPath();

        final fileName =
            "${AllStrings.uniqueImageName}${imageUrl.split("/").last}";

        final file = File('$path/$fileName');

        await file.writeAsBytes(bytes);

        return ImageSaveStatus.SUCCESS;
      } else {
        return ImageSaveStatus.FAILURE;
      }
    } catch (e) {
      return ImageSaveStatus.FAILURE;
    }
  }

  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<bool> isImageAlreadySaved(String imageUrl) async {
    final path = await _getLocalPath();
    final fileName = imageUrl.split("/").last;
    final filePath = '$path/${AllStrings.uniqueImageName}$fileName';

    final file = File(filePath);
    return file.exists(); 
  }

  Future<List<File>> getAllSavedImages() async {
    final file = await getApplicationDocumentsDirectory();
    final path = file.path;
    final directory = Directory(path);

   
    try {
      final imageFiles = directory
          .listSync()
          .where((file) =>
              file is File && file.path.contains(AllStrings.uniqueImageName))
          .map((e) => File(e.path))
          .toList();

      return imageFiles;
    } catch (e) {
      return [];
    }
  }

  Future<bool> deleteSingleLocalFile(String imagePath) async {
    final file = File(imagePath);
    if (await file.exists()) {
      await file.delete();
      return true;
    } else {
      return false;
    }
  }
}

enum ImageSaveStatus { SUCCESS, ALREADY, FAILURE }
