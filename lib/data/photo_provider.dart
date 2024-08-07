import 'package:flutter/material.dart';
import 'package:image_search/ui/home_view_model.dart';

class PhotoProvider extends InheritedWidget {
  final HomeViewModel viewModel;

  const PhotoProvider({
    super.key,
    required super.child,
    required this.viewModel,
  });

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, "No Pixabay found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }
}
