import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentaion/bloc/home_view_model_bloc.dart';

void main() {
  late HomeViewModelBloc bloc;
  late FakePhotoApiRepository repository;

  setUp(() {
    repository = FakePhotoApiRepository();
    bloc = HomeViewModelBloc(repository: repository);
  });

  tearDown(() {
    bloc.close();
  });

  blocTest<HomeViewModelBloc, HomeViewModelState>(
    '스트림이 잘 동작해야 한다',
    build: () => bloc,
    act: (bloc) async {
      bloc.add(const FetchPhotos(query: 'apple'));
      await Future.delayed(const Duration(milliseconds: 600));
      bloc.add(const FetchPhotos(query: 'apple'));
    },
    expect: () => [
      HomeViewModelState.initial()
          .copyWith(homeViewModelStatus: HomeViewModelStatus.loading),
      HomeViewModelState.initial().copyWith(
          homeViewModelStatus: HomeViewModelStatus.success, photos: fakePhotos),
      HomeViewModelState.initial().copyWith(
          homeViewModelStatus: HomeViewModelStatus.loading, photos: fakePhotos),
      HomeViewModelState.initial().copyWith(
          homeViewModelStatus: HomeViewModelStatus.success, photos: fakePhotos),
    ],
  );
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return Result.success(fakePhotos);
  }
}

final List<Photo> fakePhotos = [
  const Photo(
    id: 195893,
    pageURL: "https://pixabay.com/en/blossom-bloom-flower-195893/",
    type: "photo",
    tags: "blossom, bloom, flower",
    previewURL:
        "https://cdn.pixabay.com/photo/2013/10/15/09/12/flower-195893_150.jpg",
    previewWidth: 150,
    previewHeight: 84,
    webformatURL: "https://pixabay.com/get/35bbf209e13e39d2_640.jpg",
    webformatWidth: 640,
    webformatHeight: 360,
    largeImageURL: "https://pixabay.com/get/ed6a99fd0a76647_1280.jpg",
    imageWidth: 4000,
    imageHeight: 2250,
    imageSize: 4731420,
    views: 7671,
    downloads: 6439,
    likes: 5,
    comments: 2,
    userId: 48777,
    user: "Josch13",
    userImageURL:
        "https://cdn.pixabay.com/user/2013/11/05/02-10-23-764_250x250.jpg",
    collections: 0,
  ),
];
