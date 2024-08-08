import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search/di/home_view_model_di.dart';

class MainDi {
  //static final Dio dio = Dio();

  static List<RepositoryProvider> getRepositoryProviders() {
    return [
      //RepositoryProvider<Dio>(create: (_) => dio),
      ...HomeViewModelDi.getRepositoryProviders(),
    ];
  }

  static List<BlocProvider> getBlocProviders() {
    return [
      ...HomeViewModelDi.getBlocProviders(),
    ];
  }
}
