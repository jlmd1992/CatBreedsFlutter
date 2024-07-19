import 'package:cats_flutter_app/domain/entities/breed_cat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatBreedView extends StatelessWidget {

  final BreedCat breed;
  
  const CatBreedView({
    super.key, 
    required this.breed,
  });

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
}