import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cats_flutter_app/domain/entities/breed_cat.dart';
import 'package:cats_flutter_app/presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detail',
      name: BreedDetailScreen.name,
      builder: (context, state) {
        final breed = state.extra as BreedCat?;
        if (breed == null) {
          return const Scaffold(
            body: Center(child: Text('Breed cat not send')),
          );
        }
        return BreedDetailScreen(breedCat: breed);
      },
    )
  ]
);