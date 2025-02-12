import 'package:flutter/material.dart';
import 'package:tentwentyassesment/features/movies/data/models/genre.dart';

class GenreDetailView extends StatefulWidget {
  final Genre genre;
  const GenreDetailView({super.key, required this.genre});

  @override
  State<GenreDetailView> createState() => _GenreDetailViewState();
}

class _GenreDetailViewState extends State<GenreDetailView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
