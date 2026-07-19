import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomeScreen(childView: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              name: HomeScreen.name,
              builder: (context, state) => const HomeView(),
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  name: MovieScreen.name,
                  builder: (context, state) {
                    final movieId = state.pathParameters['id'] ?? 'no-id';

                    return MovieScreen(movieId: movieId);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/categories',
              builder: (context, state) => FavoritesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => FavoritesView(),
            ),
          ],
        ),

        // Rutas padre/hijo
        // GoRoute(
        //   path: '/',
        //   name: HomeScreen.name,
        //   builder: (context, state) => const HomeScreen(childView: FavoritesView(),),
        //   routes: [
        //   GoRoute(
        //     path: 'movie/:id',
        //     name: MovieScreen.name,
        //     builder: (context, state) {
        //       final movieId = state.pathParameters['id'] ?? 'no-id';

        //       return MovieScreen(movieId: movieId,);
        //     },
        //   ),

        //   ]
        // ),
      ],
    ),
  ],
);
