import 'package:coffeeapp/coffee_image_bloc/coffee_image_event.dart';
import 'package:coffeeapp/coffee_image_bloc/coffee_image_state.dart';
import 'package:coffeeapp/data/repository/coffee_image_repository.dart';
import 'package:coffeeapp/utils/image_operation.dart';
import 'package:coffeeapp/utils/internet_connection_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeImageBloc extends Bloc<CoffeeImageEvent, CoffeeImageState> {
  final CoffeeImageRepository coffeeImageRepository;
  CoffeeImageBloc(this.coffeeImageRepository)
      : super(InitialCoffeeImageState()) {
    on<CoffeeImageFetchImageData>(_getCoffeeImage);
    on<SaveCoffeeImage>(_saveCoffeeImage);
  }

  void _getCoffeeImage(
    CoffeeImageFetchImageData event,
    Emitter<CoffeeImageState> emit,
  ) async {
    try {
      final connectivity =
          await InternetConnectionChecker().hasInternetConnection();
      if (connectivity) {
        emit(CoffeeImageLoadingState());
        final coffeeData = await coffeeImageRepository.getCoffeeImage();
        emit(CoffeeImageSuccessState(image: coffeeData));
      } else {
        emit(NoInternetConnectionState());
      }
    } catch (e) {
      emit(CoffeeImageFailureState(e.toString()));
    }
  }

  void _saveCoffeeImage(
    SaveCoffeeImage event,
    Emitter<CoffeeImageState> emit,
  ) async {
    final saveImage = ImageOperations();
    final currentState = state;
    if (currentState is CoffeeImageSuccessState) {
      emit(currentState.copyWith(
          isSaving: true,
          isSaved: false,
          saveError: false,
          isAlreadyPresent: false));
      ImageSaveStatus status = await saveImage.saveImageLocally(event.image);
      if (status == ImageSaveStatus.SUCCESS) {
        emit(currentState.copyWith(
            isSaving: false,
            isSaved: true,
            saveError: false,
            isAlreadyPresent: false));
      } else if (status == ImageSaveStatus.ALREADY) {
        emit(currentState.copyWith(
            isSaving: false,
            isSaved: false,
            saveError: false,
            isAlreadyPresent: true));
      } else {
        emit(currentState.copyWith(
            saveError: true,
            isAlreadyPresent: false,
            isSaved: false,
            isSaving: false));
      }
    }
  }
}
