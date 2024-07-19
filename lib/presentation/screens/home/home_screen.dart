import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cats_flutter_app/presentation/widgets/breeds/cat_breed_view.dart';
import 'package:cats_flutter_app/presentation/providers/breeds/breeds_providers.dart';
import 'package:cats_flutter_app/presentation/widgets/shared/custom_search_bar.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('CatBreeds'),
      ),
      body: _HomeView(),
    );
  }

}

class _HomeView extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final catBreeds = ref.watch(filteredBreedsProvider);

    return Column(
      children: [
        const CustomSearchBar(),
        Expanded(
          child: ListView.builder(
            itemCount: catBreeds.length,
            itemBuilder: (context, index) {
              final breed = catBreeds[index];
              return CatBreedView(breed: breed);
            },
          )
        )
      ],
    );
  }

}

/*class _CatBreedView extends StatelessWidget {
  const _CatBreedView({
    required this.breed,
  });

  final BreedCat breed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        child: InkWell(
          onTap: (){
            context.push('/detail', extra: breed);
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(        
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      breed.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Text(
                      'Mas...',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Stack(
                    children: [
                      const Center(child: CircularProgressIndicator()),
                      Center(
                        child: Image.network(
                          breed.imageId,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pais de origen: ${breed.country}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Inteligencia: ${breed.intelligence}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}*/