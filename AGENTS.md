# AGENTS.md

## Workspace layout
- Git repo root is this folder. It holds several independent Flutter apps (`cinemapedia/`, `toktik/`, `widgets_app/`, `yes_no_app/`, `hello_world_app/`, `world_album_app/`, `animate_do_app/`). Each is its own `pubspec.yaml` project with no shared deps.
- Most active project: `cinemapedia/`. Work there unless told otherwise.

## cinemapedia overview
- Flutter movie catalog app using the TMDB API. Clean architecture + Riverpod 3 + go_router + drift (SQLite) for local favorites.
- Entry `lib/main.dart`: `WidgetsFlutterBinding.ensureInitialized()` must stay before `dotenv.load()`; plugins crash otherwise.
- Theme: `config/theme/app_theme.dart` (Material 3, green seed). Router: `config/router/app_router.dart`.

## Setup / env
- `.env` is gitignored and required. Copy `.env.template` -> `.env` and set `THE_MOVIEDB_KEY` (from themoviedb.org/settings/api). Startup fails without it.

## Commands
- Drift codegen: `dart run build_runner build --delete-conflicting-outputs` — regenerate `lib/config/database/database.g.dart` after editing table defs in `config/database/database.dart`.
- Lint: `flutter analyze` (flutter_lints via `analysis_options.yaml`). Format: `dart format`.
- No tests exist (`test/` is empty).

## Architecture (cinemapedia/lib)
- Layering: `domain/` (entities + abstract datasources/repositories) -> `infrastructure/` (datasources, mappers, models, repo impls) -> `presentation/` (providers, screens, widgets, delegates, views).
- Barrel files (`screens.dart`, `views.dart`, `widgets.dart`, `providers.dart`) re-export their folder; add new files to the barrel.
- Riverpod 3.x: `StateNotifierProvider`/`StateProvider` classes come from `package:flutter_riverpod/legacy.dart` (repo convention).
- Navigation: `StatefulShellRoute.indexedStack` with branches `/` (HomeView), `/categories` (FavoritesView), `/favorites` (FavoritesView). Detail is nested `movie/:id` under `/`; the only defined detail route is `/movie/:id` — push with `context.push('/movie/${movie.id}')` as in `custom_appbar.dart`.
- Favorites flow: drift tables in `config/database/database.dart` -> `infrastructure/datasources/drift_datasource.dart` + `infrastructure/repositories/local_storage_repository_impl.dart` -> providers in `presentation/providers/storage/` (`favoriteMoviesProvider` keeps the local cache; `isFavoriteMovieProvider` is a `FutureProvider.family<bool,int>` for per-movie heart state — invalidate it with `ref.invalidate` after toggling). `FavoritesView` renders the cache with `MovieMasonry` (staggered grid from `flutter_staggered_grid_view`) + `MoviePosterLink`.

## Gotchas
- Windows Flutter plugin builds require Developer Mode (symlinks). On "Building with plugins requires symlink support", run `start ms-settings:developers` and enable it.
- `sqlite3_flutter_libs` is pinned at EOL `0.6.0+eol`. On Android the native `libsqlite3.so` fails to load (ArgumentError `sqlite3_temp_directory`) so drift favorites crash on device; Windows desktop works. If this blocks you, consider a pure-Dart store.
- `.vscode/extensions.json` marks Java VS Code extensions as unwanted (they crashed the IDE); don't reinstall them.
