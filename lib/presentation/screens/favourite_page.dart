import 'dart:io';

import 'package:coffeeapp/local_image_bloc/local_image_bloc.dart';
import 'package:coffeeapp/local_image_bloc/local_image_event.dart';
import 'package:coffeeapp/local_image_bloc/local_image_state.dart';
import 'package:coffeeapp/presentation/widgets/app_loader.dart';
import 'package:coffeeapp/presentation/widgets/empty_local_image_widget.dart';
import 'package:coffeeapp/presentation/widgets/favourite_background_image.dart';
import 'package:coffeeapp/presentation/widgets/local_images_list_widget.dart';
import 'package:coffeeapp/utils/all_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<File> allFiles = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    context.read<LocalImagesBloc>().add(FetchAllLocalImages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AllStrings.favourite),
        ),
        body: Stack(
          children: [
            const FavouriteBackgroundImage(),
            BlocBuilder<LocalImagesBloc, LocalImagesState>(
                builder: (context, state) {
              if (state is LocalImagesLoading) {
                return const AppLoaderWidget();
              } else if (state is LocalImagesSuccess) {
                return state.localFiles.isEmpty
                    ? const EmptyLocalImageWidget()
                    : SingleChildScrollView(
                        child: Column(
                          children: state.localFiles.map((file) {
                            return LocalImagesListWidget(
                                filePath: file.path,
                                onDeletePressed: () {
                                  context
                                      .read<LocalImagesBloc>()
                                      .add(DeleteSingleFile(file: file.path));
                                  context
                                      .read<LocalImagesBloc>()
                                      .add(FetchAllLocalImages());
                                });
                          }).toList(),
                        ),
                      );
              } else {
                return Container();
              }
            }),
          ],
        ));
  }
}
