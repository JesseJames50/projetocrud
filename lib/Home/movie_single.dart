import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/movie_model.dart';

class SingleMoviePage extends StatelessWidget {
  final MovieModel movieModel;

  const SingleMoviePage({
    super.key,
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    final routeSettings = ModalRoute.of(context)?.settings;
    log("Nome da rota: ${routeSettings?.name}");
    log("${routeSettings?.arguments}");
    return Scaffold(
      body: Column(
        children: [
          Text(movieModel.movie.toString()),
          Text(movieModel.description.toString()),
        ],
      ),
    );
  }
}
