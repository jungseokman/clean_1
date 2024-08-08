import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search/di/main_di.dart';
import 'package:image_search/presentaion/pages/home/home_page.dart';

void main(List<String> args) {
  runApp(const ImageApp());
}

class ImageApp extends StatelessWidget {
  const ImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: MainDi.getRepositoryProviders(),
      child: MultiBlocProvider(
        providers: MainDi.getBlocProviders(),
        child: MaterialApp(
          title: "Flutter Demo",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
