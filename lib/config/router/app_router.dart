import 'package:go_router/go_router.dart';
import 'package:flu_avm/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
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
            return Placeholder();
          },
        ), // GoRoute
      ],
    ), // GoRoute
  ],
);