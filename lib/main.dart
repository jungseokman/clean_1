import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository.dart/photo_api_repository_impl.dart';
import 'package:image_search/presentaion/bloc/home_view_model_bloc.dart';
import 'package:image_search/presentaion/home/home_page.dart';
import 'package:http/http.dart' as http;

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
          repository:
              PhotoApiRepositoryImpl(api: PixabayApi(client: http.Client())),
        ),
        child: const HomePage(),
      ),
    );
  }
}
