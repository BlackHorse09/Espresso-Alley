import 'package:coffeeapp/data/data_provider/coffee_image_data_provider.dart';
import 'package:coffeeapp/utils/image_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class MockPathProvider extends PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    return '/app_docs_directory';
  }
}

void main() {
  late String imageUrl;
  late ImageOperations operations;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = MockPathProvider();
    operations = ImageOperations();
    final provider = CoffeeImageDataProvider();
    final model = await provider.getCoffeeImage();
    imageUrl = model.file;
  });

  test("Check images saved locally", () async {
    final files = await operations.getAllSavedImages();
    expect(files, []);
  });

  test("Check image already saved", () async {
    final status = await operations.isImageAlreadySaved(imageUrl);
    expect(status, false);
  });
}
