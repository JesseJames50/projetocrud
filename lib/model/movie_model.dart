import 'dart:convert';

class MovieModel {
  final String? movie;
  final String? description;
  final String? id;

  MovieModel(
    this.movie,
    this.description, [
    this.id,
  ]);

  Map<String, dynamic> toMap() {
    return {
      'movie': movie,
      'description': description,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    final model = MovieModel(
      map['movie'] ?? map['movie'],
      map['description'] ?? map['description'],
      map['_id'],
    );
    return model;
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  MovieModel copyWith({
    String? movie,
    String? description,
  }) {
    return MovieModel(
      movie ?? this.movie,
      description ?? this.description,
      id ?? id,
    );
  }
}
