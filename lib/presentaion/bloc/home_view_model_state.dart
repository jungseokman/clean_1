part of 'home_view_model_bloc.dart';

enum HomeViewModelStatus {
  initial,
  loading,
  success,
  failure,
}

class HomeViewModelState extends Equatable {
  const HomeViewModelState({
    required this.homeViewModelStatus,
    required this.photos,
  });

  final HomeViewModelStatus homeViewModelStatus;
  final List<Photo> photos;

  factory HomeViewModelState.initial() {
    return const HomeViewModelState(
        photos: [], homeViewModelStatus: HomeViewModelStatus.initial);
  }

  @override
  List<Object> get props => [homeViewModelStatus, photos];

  HomeViewModelState copyWith({
    HomeViewModelStatus? homeViewModelStatus,
    List<Photo>? photos,
  }) {
    return HomeViewModelState(
      homeViewModelStatus: homeViewModelStatus ?? this.homeViewModelStatus,
      photos: photos ?? this.photos,
    );
  }

  @override
  String toString() =>
      'HomeViewModelState(homeViewModelStatus: $homeViewModelStatus, photos: $photos)';
}
