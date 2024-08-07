import 'package:dio/dio.dart';
import 'package:image_search/model/photo.dart';

class PixabayApi {
  final baseUel = "https://pixabay.com/api/";
  final key = "45304690-5ab2d77aa4c7f6783fd3b9b9d";

  Future<List<Photo>> fetch(String query) async {
    final dio = Dio();
    final response =
        await dio.get("$baseUel?key=$key&q=$query&image_type=photo");

    Iterable hits = response.data['hits'];

    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
