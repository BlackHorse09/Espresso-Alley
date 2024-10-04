import 'package:coffeeapp/coffee_image_bloc/coffee_image_bloc.dart';
import 'package:coffeeapp/coffee_image_bloc/coffee_image_event.dart';
import 'package:coffeeapp/coffee_image_bloc/coffee_image_state.dart';
import 'package:coffeeapp/presentation/widgets/app_loader.dart';
import 'package:coffeeapp/presentation/widgets/background_widgets.dart';
import 'package:coffeeapp/presentation/widgets/home_app_bar.dart';
import 'package:coffeeapp/presentation/widgets/image_error_widget.dart';
import 'package:coffeeapp/presentation/widgets/image_two_buttons.dart';
import 'package:coffeeapp/presentation/widgets/no_internet_widget.dart';
import 'package:coffeeapp/utils/all_strings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> fileNames = [];

  @override
  void initState() {
    super.initState();
    context.read<CoffeeImageBloc>().add(CoffeeImageFetchImageData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffD2B48C),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const SizedBox.shrink(),
          title: const Text(AllStrings.name),
          centerTitle: true,
          actions: const [FavouriteWidget()],
        ),
        body: Stack(
          children: [
            const FirstBackgroundWidget(),
            const SecondBackgroundWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  BlocConsumer<CoffeeImageBloc, CoffeeImageState>(
                      listener: (context, state) {
                    if (state is CoffeeImageSuccessState) {
                      if (state.isSaved) {
                        showSnackBar(
                            context, AllStrings.imageSaved, Colors.greenAccent);
                      }
                      if (state.isAlreadyPresent) {
                        showSnackBar(context, AllStrings.imageSavedAlready,
                            Colors.blueAccent);
                      }
                      if (state.saveError) {
                        showSnackBar(context, AllStrings.somethingWentWrong,
                            Colors.redAccent);
                      }
                    }
                  }, builder: (context, state) {
                    if (state is CoffeeImageLoadingState) {
                      return const AppLoaderWidget();
                    } else if (state is CoffeeImageSuccessState) {
                      return ImageTwoButtons(
                          imageUrl: state.image.file,
                          onNotFavouritePressed: () {
                            context
                                .read<CoffeeImageBloc>()
                                .add(CoffeeImageFetchImageData());
                          },
                          onFavouritePressed: () async {
                            context
                                .read<CoffeeImageBloc>()
                                .add(SaveCoffeeImage(image: state.image.file));
                            await Future.delayed(const Duration(seconds: 1));
                            context
                                .read<CoffeeImageBloc>()
                                .add(CoffeeImageFetchImageData());
                          },
                          isSaving: state.isSaving);
                    } else if (state is NoInternetConnectionState) {
                      return const NoInternetWidget();
                    } else {
                      return const ImageErrorWidget();
                    }
                  }),
                ],
              ),
            ),
          ],
        ));
  }

  void showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.black),
        ),
        duration: const Duration(milliseconds: 800),
        backgroundColor: color,
      ),
    );
  }
}
