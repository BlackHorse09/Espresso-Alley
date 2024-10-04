import 'package:coffeeapp/models/file_model.dart';

sealed class CoffeeImageState {}

class InitialCoffeeImageState extends CoffeeImageState {}

class CoffeeImageLoadingState extends CoffeeImageState {}

class CoffeeImageSuccessState extends CoffeeImageState {
  final FileModel image;
  final bool isSaving;
  final bool isSaved;
  final bool isAlreadyPresent;
  final bool saveError;
  CoffeeImageSuccessState(
      {required this.image,
      this.isSaving = false,
      this.isSaved = false,
      this.saveError = false,
      this.isAlreadyPresent = false});

  CoffeeImageSuccessState copyWith({
    bool? isSaving,
    bool? isSaved,
    bool? saveError,
    bool? isAlreadyPresent
  }) {
    return CoffeeImageSuccessState(
      image: image,
      isSaving: isSaving ?? this.isSaving,
      isSaved: isSaved ?? this.isSaved,
      saveError: saveError ?? this.saveError,
      isAlreadyPresent: isAlreadyPresent ?? this.isAlreadyPresent
    );
  }
}

class CoffeeImageFailureState extends CoffeeImageState {
  final String errStr;
  CoffeeImageFailureState(this.errStr);
}

class NoInternetConnectionState extends CoffeeImageState {}
