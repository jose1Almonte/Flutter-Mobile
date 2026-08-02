import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  // @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  // @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMoviesMap = ref.watch(favoriteMoviesProvider);
    final favoriteMovies = favoriteMoviesMap.values.toList();
    final colors = Theme.of(context).colorScheme;
    if (favoriteMovies.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_border, size: 100, color: colors.primary),
              Text("No tienes peliculas favoritas", style: TextStyle(color: colors.secondary),)
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: MovieMasonry(
        movies: favoriteMovies,
        loadNextPage: () =>
            ref.read(favoriteMoviesProvider.notifier).loadNextPage(),
      ),
    );
  }
}
