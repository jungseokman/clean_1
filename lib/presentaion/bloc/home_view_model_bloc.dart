import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_search/data/data_source/result.dart';

import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/usecase/get_photos_usecase.dart';

part 'home_view_model_event.dart';
part 'home_view_model_state.dart';

class HomeViewModelBloc extends Bloc<HomeViewModelEvent, HomeViewModelState> {
  final GetPhotosUsecase getPhotosUsecase;

  HomeViewModelBloc({
    required this.getPhotosUsecase,
  }) : super(HomeViewModelState.initial()) {
    on<FetchPhotos>((event, emit) async {
      emit(state.copyWith(homeViewModelStatus: HomeViewModelStatus.loading));

      final Result<List<Photo>> result = await getPhotosUsecase(event.query);

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
