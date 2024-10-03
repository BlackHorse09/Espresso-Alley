class LocalImagesEvent {}

final class FetchAllLocalImages extends LocalImagesEvent {}

final class DeleteSingleFile extends LocalImagesEvent {
  final String file;
  DeleteSingleFile({required this.file});
}
