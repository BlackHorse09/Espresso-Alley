import 'package:coffeeapp/data/data_provider/coffee_image_data_provider.dart';
import 'package:coffeeapp/models/file_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CoffeeImageDataProvider coffeeImageDataProvider;

  setUp(() {
    coffeeImageDataProvider = CoffeeImageDataProvider();
  });

  test("Testing API to give an image URL.", () async {
    final fileModel = await coffeeImageDataProvider.getCoffeeImage();

    expect(fileModel, isA<FileModel>());
  });
}
