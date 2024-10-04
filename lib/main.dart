import 'package:coffeeapp/coffee_image_bloc/coffee_image_bloc.dart';
import 'package:coffeeapp/data/data_provider/coffee_image_data_provider.dart';
import 'package:coffeeapp/data/repository/coffee_image_repository.dart';
import 'package:coffeeapp/local_image_bloc/local_image_bloc.dart';
import 'package:coffeeapp/presentation/screens/splash_page.dart';
import 'package:coffeeapp/utils/all_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CoffeeImageRepository(CoffeeImageDataProvider()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  CoffeeImageBloc(context.read<CoffeeImageRepository>())),
          BlocProvider(create: (context) => LocalImagesBloc())
        ],
        child: MaterialApp(
          title: AllStrings.name,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
