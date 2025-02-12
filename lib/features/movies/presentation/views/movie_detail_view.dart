import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwentyassesment/common/widget/custom_chip.dart';
import 'package:tentwentyassesment/common/widget/network_image.dart';
import 'package:tentwentyassesment/common/widget/outlined_button.dart';
import 'package:tentwentyassesment/common/widget/primary_button.dart';
import 'package:tentwentyassesment/core/app_style.dart';
import 'package:tentwentyassesment/features/movies/presentation/controllers/movie_detail_controller.dart';
import 'package:tentwentyassesment/features/movies/presentation/views/play_trailer_view.dart';
import 'package:tentwentyassesment/features/movies/presentation/widgets/movies_loading.dart';

import '../../../../core/app_mixins.dart';
import '../../../../core/app_utils.dart';
import '../../../../di.dart';
import '../../data/models/movie.dart';
import '../../data/models/trailer.dart';
import '../../domain/usecases/get_movie_details_use_case.dart';
import '../../domain/usecases/get_trailer_usercase.dart';

class MovieDetailView extends StatefulWidget {
  final Movie item;

  const MovieDetailView({super.key, required this.item});

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> with LoadingStateMixin {
  Future<void> fetchData() async {
    await withLoading(() async {
      // Your async operation here
      await Future.delayed(Duration(seconds: 1));
    });
  }

  void _onGetTickTap() {}

  Future<void> _onWatchTrailerTap() async {
    final controller = Get.find<MovieDetailController>();
    await withLoading(() async {
      final trailers = await controller.getTrailer();
      if (trailers?.trailers.isNotEmpty ?? false) {
        if (!context.mounted) return;

        _showTrailerBottomSheet(trailers!.trailers);
      }
    });
  }

  void _showTrailerBottomSheet(List<Trailer> trailers) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Available trailers", style: textStyle18MediumBlack),
            ),
            ListView.separated(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: trailers.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final trailer = trailers[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.play_circle_outline),
                    title: Text(trailer.name + " (${trailer.size}p)", style: textStyle14SemiBoldBlack),
                    onTap: () {
                      Navigator.pop(context); // Close the bottom sheet
                      _navigateToTrailer(trailer.url);
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToTrailer(String videoId) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => YoutubePlayerPage(videoId: videoId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildGenre(),
                  SizedBox(height: 15),
                  Text("Overview", style: textStyle14SemiBoldBlack),
                  SizedBox(height: 14),
                  Text(
                    widget.item.overview,
                    style: textStyle12RegularSemiMoreLight,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.height * 0.57;

    final dateTimeString = dateFormatter(widget.item.releaseDate);
    return SliverAppBar(
      expandedHeight: expandedHeight,
      pinned: true,
      stretch: true,
      floating: false,
      backgroundColor: Colors.black,
      collapsedHeight: kToolbarHeight,
      leadingWidth: 80,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.arrow_back_ios, color: AppColors.white),
        ),
      ),
      title: Text("Watch", style: textStyle16MediumWhite),
      centerTitle: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Hero image
            Hero(
              tag: widget.item.id,
              child: CommonNetWorkImage(imageUrl: widget.item.posterPath ?? widget.item.backdropPath ?? "", height: expandedHeight),
            ),
            // Top gradient
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(gradient: AppColors.blackGradient2),
              ),
            ),
            // Bottom gradient
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(gradient: AppColors.blackGradient),
              ),
            ),
            // Action buttons
            Positioned(
              bottom: 34,
              left: 66,
              right: 66,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (dateTimeString != null)
                    Text("In Theaters $dateTimeString", style: textStyle16MediumWhite, textAlign: TextAlign.center),
                  if (dateTimeString != null) SizedBox(height: 20),
                  SolidButton.primary(onPressed: _onGetTickTap, text: "Get Tickets"),
                  SizedBox(height: 10),
                  ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder: (context, loading, child) => OutlinedButtonIcon.primary(
                      onPressed: loading ? () {} : _onWatchTrailerTap,
                      text: "Watch Trailer",
                      icon: loading
                          ? CupertinoActivityIndicator(
                              color: AppColors.blueLight,
                            )
                          : Icon(Icons.play_arrow, color: AppColors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenre() {
    return GetBuilder<MovieDetailController>(
        init: MovieDetailController(widget.item,
            getMovieDetailsUseCase: getIt<GetMovieDetailsUseCase>(), getTrailerUserCase: getIt<GetTrailerUserCase>()),
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 27),
              Text("Genres", style: textStyle14SemiBoldBlack),
              SizedBox(height: 14),
              controller.isLoading
                  ? GenresLoadingShimmer()
                  : (controller.movie.genres?.isEmpty ?? true)
                      ? SizedBox.shrink()
                      : Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: controller.movie.genres!.map(
                            (e) {
                              final genre = e;
                              final index = controller.movie.genres!.indexOf(e);
                              if (genre.name != null) {
                                return CustomChip(
                                  text: genre.name!,
                                  backgroundColor: ColorHelper.getRandomChipColor(index),
                                );
                              }

                              /// If not supported genre, returning empty widget
                              return const SizedBox();
                            },
                          ).toList(),
                        ),
              SizedBox(height: 22),
              Divider(color: AppColors.greyLight, thickness: 1),
            ],
          );
        });
  }
}
