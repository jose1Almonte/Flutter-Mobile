import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath != '' 
    ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
    : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8PgItrmj9SWhclDBAmjlyFsC4w9tEKTcvDTbc2puQtQ&s',
    genreIds: moviedb.genreIds.map((e) => e.toString(),).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: moviedb.posterPath != ''
    ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
    : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx_JClYKXGmovqPzj57OhEhvujwLZvVKNd4h9idCmiL9uPfvYHf6ppdNQC&s=10',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath != '' 
    ? 'https://image.tmdb.org/t/p/w500/${moviedb.backdropPath}'
    : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8PgItrmj9SWhclDBAmjlyFsC4w9tEKTcvDTbc2puQtQ&s',
    genreIds: moviedb.genres.map((e) => e.name,).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: moviedb.posterPath != ''
    ? 'https://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
    : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8PgItrmj9SWhclDBAmjlyFsC4w9tEKTcvDTbc2puQtQ&s',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
