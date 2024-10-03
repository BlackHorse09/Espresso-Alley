sealed class CoffeeImageEvent {}

final class CoffeeImageFetchImageData extends CoffeeImageEvent {}

final class SaveCoffeeImage extends CoffeeImageEvent {
  final String image;
  SaveCoffeeImage({required this.image});
}
