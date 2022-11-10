import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../model/movie_model.dart';

abstract class IMovieRepository {
  Future<bool> createMovie(MovieModel movie);
  Future<List<MovieModel>> getMovies();
  Future<List<MovieModel>> getAllMovies();
}

class MovieRepositoryHttp implements IMovieRepository {
  final baseUrl = 'https://crudcrud.com/api/3bc27192f55f4ea19da52411de0e8f29';

  @override
  Future<bool> createMovie(MovieModel movie) async {
    await http.post(
      Uri.parse('$baseUrl/movies'),
      body: movie.toJson(),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    return true;
  }

  @override
  Future<List<MovieModel>> getMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/movies'),
    );
    final list = List.from(jsonDecode(response.body));
    final movie = list.map((e) => MovieModel.fromMap(e)).toList();
    return movie;
  }

  @override
  Future<List<MovieModel>> getAllMovies() async {
    log("método de pegar todos os posts é chamado pelo controller");
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movies'),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      );
      if (response.statusCode == 200) {
        log("conclui requisição com sucesso e inicia tratamento de dados vindos da api");

        final list = List.from(jsonDecode(response.body));
        final moviesList = list.map((e) => MovieModel.fromMap(e)).toList();

        log("tratamentos feitos e retorna lista de posts para o controller");
        return moviesList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
