import 'package:go_router/go_router.dart';
import 'package:flu_avm/presentation/screens/screens.dart';
import 'package:flu_avm/presentation/screens/pokemons/pokemon_screen.dart';
import 'package:flu_avm/presentation/screens/extracciones/extracciones_splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const InicioScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const DomusScreen(),
    ),
    GoRoute(
      path: '/numerator-river',
      builder: (context, state) => const NumeratorScreens(),
    ),
    GoRoute(
      path: '/bands',
      builder: (context, state) => const BandsScreen(),
    ),
    GoRoute(
      path: '/charta',
      builder: (context, state) => const ChartaScreen(),
    ),
    GoRoute(
      path: '/request',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '1';
            return PokemonScreen(pokemonId: id);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/extracciones-intro',
      builder: (context, state) => const ExtracccionesSplashScreen(),
    ),
    GoRoute(
      path: '/extracciones',
      builder: (context, state) => const ExtraccionesScreen(),
      routes: [
        GoRoute(
          path: ':mineral',
          builder: (context, state) {
            final mineral = state.pathParameters['mineral'] ?? '';
            return ExtraccionScreen(mineral: mineral);
          },
        ),
      ],
    ),
  ],
);