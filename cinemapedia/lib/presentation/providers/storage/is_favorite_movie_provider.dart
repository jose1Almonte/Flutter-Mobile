import 'package:cinemapedia/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//                                <Lo que vamos a responder, lo que vamos a recibir>
// final isFavoriteMovieProvider = FutureProvider.family.autoDispose<bool, int>((ref, movieId) {
final isFavoriteMovieProvider = FutureProvider.family<bool, int>((ref, movieId) {
  
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return localStorageRepository.isFavoriteMovie(movieId);
},);