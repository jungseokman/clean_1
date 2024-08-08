import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository.dart/photo_api_repository_impl.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/usecase/get_photos_usecase.dart';
import 'package:image_search/presentaion/bloc/home_view_model_bloc.dart';

class HomeViewModelDi {
  static List<RepositoryProvider> getRepositoryProviders() {
    return [
      RepositoryProvider<http.Client>(create: (_) => http.Client()),
      RepositoryProvider<PixabayApi>(
        create: (context) => PixabayApi(
          client: RepositoryProvider.of<http.Client>(context),
        ),
      ),
      RepositoryProvider<PhotoApiRepository>(
        create: (context) => PhotoApiRepositoryImpl(
          api: RepositoryProvider.of<PixabayApi>(context),
        ),
      )
    ];
  }

  static List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<HomeViewModelBloc>(
        create: (context) => HomeViewModelBloc(
          getPhotosUsecase: GetPhotosUsecase(
              repository: RepositoryProvider.of<PhotoApiRepository>(context)),
        ),
      ),
    ];
  }
}
