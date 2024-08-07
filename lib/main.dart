import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/ui/bloc/home_view_model_bloc.dart';
import 'package:image_search/ui/home/home_page.dart';

void main(List<String> args) {
  runApp(const ImageApp());
}

class ImageApp extends StatelessWidget {
  const ImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => HomeViewModelBloc(
          repository: PixabayApi(),
        ),
        child: const HomePage(),
      ),
    );
  }
}
