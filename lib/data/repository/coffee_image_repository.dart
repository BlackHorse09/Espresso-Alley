

import 'package:coffeeapp/data/data_provider/coffee_image_data_provider.dart';
import 'package:coffeeapp/models/file_model.dart';

class CoffeeImageRepository {
  final CoffeeImageDataProvider dataProvider;
  CoffeeImageRepository(this.dataProvider);

  Future<FileModel> getCoffeeImage() async {
    try {
      final data = await dataProvider.getCoffeeImage();
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
