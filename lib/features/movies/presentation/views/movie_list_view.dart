import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tentwentyassesment/core/app_style.dart';
import 'package:tentwentyassesment/features/movies/data/models/movie.dart';
import 'package:tentwentyassesment/features/movies/presentation/views/search_movies_view.dart';
import '../../../../common/widget/app_bar.dart';
import '../controllers/upcomming_movies_controller.dart';
import '../widgets/movie_item.dart';
import 'movie_detail_view.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({super.key});


  void _onMovieItemTap(Movie item, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailView(item: item),
      ),
    );
  }
  void _onSearchTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchMoviesView()));
  }

  UpcomingMoviesController get controller => Get.find<UpcomingMoviesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        backgroundColor: AppColors.white,
        title: "Watch",
        actions: [
          IconButton(
            onPressed: () => _onSearchTap(context),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          return PagedListView<int, Movie>(
            pagingController: controller.pagingController,
            padding: const EdgeInsets.all(20),
            builderDelegate: PagedChildBuilderDelegate<Movie>(
              itemBuilder: (context, item, index) => InkWell(
                onTap: () => _onMovieItemTap(item, context),
                child: MovieItem(item: item),
              ),
              firstPageProgressIndicatorBuilder: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              newPageProgressIndicatorBuilder: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              noItemsFoundIndicatorBuilder: (_) => const Center(
                child: Text("No movies found"),
              ),
              firstPageErrorIndicatorBuilder: (_) => const Center(
                child: Text("Error loading movies"),
              ),
            ),
          );
        }
      ),
    );
  }
}