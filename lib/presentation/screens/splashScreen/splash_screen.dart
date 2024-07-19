import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cats_flutter_app/presentation/providers/breeds/breeds_providers.dart';

class SplashScreen extends StatelessWidget {
  
  static const name = 'splash-screen';

  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    return const _SplashScreenView();
  }
}

class _SplashScreenView extends ConsumerStatefulWidget {

  const _SplashScreenView();

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends ConsumerState<_SplashScreenView> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getBreedsProvider.notifier).fetchBreeds();
      if (mounted) {
        context.replace('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final breedCats = ref.watch(filteredBreedsProvider);

    if(breedCats.isEmpty) const Center(child: CircularProgressIndicator());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cat.png',
              width: 300
            ),
            const SizedBox(height: 20),
            const Text(
              'CatBreeds',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}