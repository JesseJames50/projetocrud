import 'dart:developer';
import '../model/movie_model.dart';
import 'movie_repository.dart';

class MovieController {
  final IMovieRepository movieRepository;

  MovieController(this.movieRepository);

  Future<void> createMovie(MovieModel movie) async {
    await movieRepository.createMovie(movie);
  }

  Future<List<MovieModel>> getMovies() async {
    return await movieRepository.getMovies();
  }

  Future<List<MovieModel>> getAllMovies() async {
    log("método para pegar todos os posts. É chamado pela view");
    try {
      final result = await movieRepository.getAllMovies();
      return result;
    } catch (e) {
      rethrow;
    }
  }

//   Future<bool> deleteMovie(String id) async {
//     return await homeRepository.deleteMovie(id);
//   }

}
