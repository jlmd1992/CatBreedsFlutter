import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cats_flutter_app/domain/entities/breed_cat.dart';
import 'package:cats_flutter_app/presentation/providers/breeds/breeds_repository_provider.dart';


final getBreedsProvider = StateNotifierProvider<BreedsNotifier, List<BreedCat>>((ref) {

  final fetchBreeds = ref.watch(breedsRepositoryProvider).getBreedsList;

  final notifier = BreedsNotifier(fetchBreeds: fetchBreeds);

  notifier.getBreedsList();

  return notifier;

});

typedef BreedCatCallback = Future<List<BreedCat>> Function();

class BreedsNotifier extends StateNotifier<List<BreedCat>> {

  final BreedCatCallback fetchBreeds;

  BreedsNotifier({
    required this.fetchBreeds
  }):super([]);

  Future<void> getBreedsList() async {
    final List<BreedCat> breedList = await fetchBreeds();
    state = breedList;
  }
}

final searchTextProvider = StateProvider<String>((ref) => '');

final filteredBreedsProvider = Provider<List<BreedCat>>((ref) {
  final searchText = ref.watch(searchTextProvider).toLowerCase();
  final breedCats = ref.watch(getBreedsProvider);
  if (searchText.isEmpty) return breedCats;
  return breedCats.where((breed) => breed.name.toLowerCase().contains(searchText)).toList();
});