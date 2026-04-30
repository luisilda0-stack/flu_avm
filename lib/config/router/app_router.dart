import 'package:go_router/go_router.dart';
import 'package:flu_avm/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/domus',
  routes: [
    GoRoute(
      path: '/domus',
      builder: (context, state) => const DomusScreen(),
    ),
    GoRoute(
      path: '/bands',
      builder: (context, state) => const BandsScreen(),
    ),
    GoRoute(
      path: '/numerator',
      builder: (context, state) => const NumeratorScreen(),
    ),
  ],
);