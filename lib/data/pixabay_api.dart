import 'dart:convert';

import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository {
  static const baseUrl = "https://pixabay.com/api/";
  static const key = "45304690-5ab2d77aa4c7f6783fd3b9b9d";

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();

    final response = await client
        .get(Uri.parse("$baseUrl?key=$key&q=$query&image_type=photo"));

    Iterable hits = jsonDecode(response.body)['hits'];

    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
