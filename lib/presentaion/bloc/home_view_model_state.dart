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
    required this.errorMessage,
  });

  final HomeViewModelStatus homeViewModelStatus;
  final List<Photo> photos;
  final String errorMessage;

  factory HomeViewModelState.initial() {
    return const HomeViewModelState(
      photos: [],
      homeViewModelStatus: HomeViewModelStatus.initial,
      errorMessage: "",
    );
  }

  @override
  List<Object> get props => [homeViewModelStatus, photos, errorMessage];

  HomeViewModelState copyWith({
    HomeViewModelStatus? homeViewModelStatus,
    List<Photo>? photos,
    String? errorMessage,
  }) {
    return HomeViewModelState(
      homeViewModelStatus: homeViewModelStatus ?? this.homeViewModelStatus,
      photos: photos ?? this.photos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'HomeViewModelState(homeViewModelStatus: $homeViewModelStatus, photos: $photos, errorMessage: $errorMessage)';
}
