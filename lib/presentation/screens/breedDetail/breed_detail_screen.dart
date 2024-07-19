import 'package:flutter/material.dart';
import 'package:cats_flutter_app/domain/entities/breed_cat.dart';

class BreedDetailScreen extends StatelessWidget{

  static const name = 'detail-screen';
  final BreedCat breedCat;

  const BreedDetailScreen({
    super.key, 
    required this.breedCat
  });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(breedCat.name),
      ),
      body: _DetailBreedCatView(breed: breedCat),
    );
  }

}

class _DetailBreedCatView extends StatelessWidget {

  final BreedCat breed;

  const _DetailBreedCatView({
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.network(
              breed.imageId,
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text('Breed description: ${breed.description}')
                ),
                ListTile(
                  title: Text('Country origin: ${breed.country}')
                ),
                ListTile(
                  title: Text('Intelligence: ${breed.intelligence}')
                ),
                ListTile(
                  title: Text('Adaptability: ${breed.adaptability}')
                ),
                ListTile(
                  title: Text('Life span: ${breed.lifeSpan} years')
                ),
                const SizedBox(
                  height: 24,
                )
              ]
            ),
          ),
        )
      ],
    );
  }
}