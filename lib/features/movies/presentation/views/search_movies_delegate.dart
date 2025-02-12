import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:tentwentyassesment/common/widget/loading_widget.dart';
import 'package:tentwentyassesment/core/app_utils.dart';
import 'package:tentwentyassesment/features/movies/data/models/genre.dart';
import 'package:tentwentyassesment/features/movies/domain/usecases/search_movies_usecase.dart';
import 'package:tentwentyassesment/features/movies/presentation/widgets/genre_item.dart';
import 'package:tentwentyassesment/features/movies/presentation/widgets/search_item.dart';

import '../../../../core/app_style.dart';
import '../../../../di.dart';
import '../../data/models/movie.dart';
import '../../domain/usecases/get_genres_usecase.dart';
import '../controllers/search_controller.dart';
import 'genre_detail_view.dart';
import 'movie_detail_view.dart';

class MovieSearchPage extends StatefulWidget {
  const MovieSearchPage({super.key});

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  List<Genre> genres = [];
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
    genres = availableGenres.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MovieSearchController>(
        init: MovieSearchController(getIt<SearchMoviesUseCase>(), getIt<GetGenresUseCase>()),
        builder: (controller) {
          return Column(
            children: [
              Container(
                padding: MediaQuery.of(context).padding,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 25),
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: _onQueryChanged,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: AppColors.semiWhite),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear, color: AppColors.semiWhite),
                              onPressed: _onClearSearchTap,
                            )
                          : null,
                      hintText: 'TV shows, movies and more',
                      hintStyle: TextStyle(fontSize: 15.0, color: AppColors.semiWhite30, fontWeight: FontWeight.w500),
                      contentPadding: const EdgeInsets.all(15),
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.transparent)),
                      // no border
                      focusedBorder:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.transparent)),
                      fillColor: AppColors.greySemiLight,
                      filled: true,
                    ),
                  ),
                ),
              ),
              if (controller.isLoading)
                LoadingWidget()
              else if (controller.movies.isNotEmpty)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 21),
                        child: Text('Top Results', style: textStyle12BlackNormal),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          itemCount: controller.movies.length,
                          itemBuilder: (context, index) {
                            final movie = controller.movies[index];
                            return GestureDetector(
                              onTap: () => _onMovieTap(movie),
                              child: SearchItem(item: movie),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              else if (_searchController.text.isNotEmpty)
                Center(child: Text('No results found.'))
              else
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.63,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      final genre = genres[index];
                      return InkWell(onTap: () => _onGenreTap(genre), child: GenreItem(genre: genre));
                    },
                  ),
                )
            ],
          );
        },
      ),
    );
  }

  void _onMovieTap(Movie movie) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailView(item: movie)));
  }

  void _onClearSearchTap() {
    _searchController.clear();
    Get.find<MovieSearchController>().setSearchQuery('');
  }

  void _onQueryChanged(String query) {
    _debouncer(() {
      Get.find<MovieSearchController>().setSearchQuery(query);
    });
  }

  void _onGenreTap(Genre genre) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => GenreSearchView(genre: genre)));
  }
}