import 'dart:convert';

import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;
  PixabayApi({
    required this.client,
  });

  static const baseUrl = "https://pixabay.com/api/";
  static const key = "45304690-5ab2d77aa4c7f6783fd3b9b9d";

  Future<Iterable> fetch(String query) async {
    final response = await client
        .get(Uri.parse("$baseUrl?key=$key&q=$query&image_type=photo"));

    Iterable hits = jsonDecode(response.body)['hits'];

    return hits;
  }
}
