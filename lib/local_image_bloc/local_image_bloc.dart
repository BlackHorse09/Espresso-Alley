import 'dart:io';

import 'package:coffeeapp/local_image_bloc/local_image_event.dart';
import 'package:coffeeapp/local_image_bloc/local_image_state.dart';
import 'package:coffeeapp/utils/image_operation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalImagesBloc extends Bloc<LocalImagesEvent, LocalImagesState> {
  LocalImagesBloc() : super(InitialLocalImagesState()) {
    on<FetchAllLocalImages>(_getAllLocalImages);
    on<DeleteSingleFile>(_deleteSingleFile);
  }

  void _getAllLocalImages(
    FetchAllLocalImages event,
    Emitter<LocalImagesState> emit,
  ) async {
    final imageOperations = ImageOperations();
    emit(LocalImagesLoading());
    final List<File> files = await imageOperations.getAllSavedImages();
    emit(LocalImagesSuccess(localFiles: files));
  }

  void _deleteSingleFile(
    DeleteSingleFile event,
    Emitter<LocalImagesState> emit,
  ) async {
    final currentState = state;
    final operations = ImageOperations();
    if (currentState is LocalImagesSuccess) {
      await operations.deleteSingleLocalFile(event.file);
    }
  }
}
