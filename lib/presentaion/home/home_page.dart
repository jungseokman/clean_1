import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search/presentaion/bloc/home_view_model_bloc.dart';
import 'package:image_search/presentaion/home/widgets/photo_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('이미지 검색 앱'),
        centerTitle: true,
        backgroundColor: const Color(0xffffffff),
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    context
                        .read<HomeViewModelBloc>()
                        .add(FetchPhotos(query: controller.text));
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          BlocBuilder<HomeViewModelBloc, HomeViewModelState>(
              builder: (context, state) {
            if (state.homeViewModelStatus == HomeViewModelStatus.loading) {
              return const CircularProgressIndicator();
            } else if (state.homeViewModelStatus ==
                HomeViewModelStatus.failure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              });

              return const SizedBox();
            } else {
              final photos = state.photos;

              return Expanded(
                  child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final photo = photos[index];
                  return PhotoWidget(
                    photo: photo,
                  );
                },
                itemCount: photos.length,
              ));
            }
          })
        ],
      ),
    );
  }
}
