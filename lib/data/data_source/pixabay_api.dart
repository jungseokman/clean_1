import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/result.dart';

class PixabayApi {
  final http.Client client;
  PixabayApi({
    required this.client,
  });

  static const baseUrl = "https://pixabay.com/api/";
  static const key = "45304690-5ab2d77aa4c7f6783fd3b9b9d";

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client
          .get(Uri.parse("$baseUrl?key=$key&q=$query&image_type=photo"));

      Iterable hits = jsonDecode(response.body)['hits'];

      return Result.success(hits);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
