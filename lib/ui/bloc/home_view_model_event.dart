part of 'home_view_model_bloc.dart';

sealed class HomeViewModelEvent extends Equatable {
  const HomeViewModelEvent();

  @override
  List<Object> get props => [];
}

class FetchPhotos extends HomeViewModelEvent {
  final String query;
  const FetchPhotos({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}
