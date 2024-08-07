import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';

part 'home_view_model_event.dart';
part 'home_view_model_state.dart';

class HomeViewModelBloc extends Bloc<HomeViewModelEvent, HomeViewModelState> {
  final PhotoApiRepository repository;

  HomeViewModelBloc({
    required this.repository,
  }) : super(HomeViewModelState.initial()) {
    on<FetchPhotos>((event, emit) async {
      emit(state.copyWith(homeViewModelStatus: HomeViewModelStatus.loading));
      try {
        final photos = await repository.fetch(event.query);
        emit(state.copyWith(
            homeViewModelStatus: HomeViewModelStatus.success, photos: photos));
      } catch (e) {
        print(e);
        emit(state.copyWith(homeViewModelStatus: HomeViewModelStatus.failure));
      }
    });
  }
}
