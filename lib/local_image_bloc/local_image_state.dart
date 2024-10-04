import 'dart:io';

sealed class LocalImagesState {}

final class InitialLocalImagesState extends LocalImagesState {}

final class LocalImagesLoading extends LocalImagesState {}

final class LocalImagesSuccess extends LocalImagesState {
  final List<File> localFiles;
  LocalImagesSuccess({required this.localFiles});
}
