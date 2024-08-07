import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_search/data/data_source/result.dart';

import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';

part 'home_view_model_event.dart';
part 'home_view_model_state.dart';

class HomeViewModelBloc extends Bloc<HomeViewModelEvent, HomeViewModelState> {
  final PhotoApiRepository repository;

  HomeViewModelBloc({
    required this.repository,
  }) : super(HomeViewModelState.initial()) {
    on<FetchPhotos>((event, emit) async {
      emit(state.copyWith(homeViewModelStatus: HomeViewModelStatus.loading));
      final Result<List<Photo>> result = await repository.fetch(event.query);

      result.when(success: (photos) {
        emit(state.copyWith(
            homeViewModelStatus: HomeViewModelStatus.success, photos: photos));
      }, error: (e) {
        emit(state.copyWith(
          homeViewModelStatus: HomeViewModelStatus.failure,
          errorMessage: e,
        ));
      });
    });
  }
}
