import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/model/photo.dart';

class PhotoProvider extends InheritedWidget {
  PhotoProvider({
    super.key,
    required super.child,
    required this.api,
  });

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  final PixabayApi api;

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, "No Pixabay found in context");
    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
