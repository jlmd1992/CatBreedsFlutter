import 'package:cats_flutter_app/domain/entities/breed_cat.dart';
import 'package:cats_flutter_app/infraestructure/models/breed_cat_response.dart';

class BreedCatMapper {

  static BreedCat breedCatResponseToEntity(BreedCatResponse response) {

    return BreedCat(
      id: response.id,
      name: response.name, 
      country: response.origin, 
      description: response.description, 
      temperament: response.temperament, 
      imageId: (response.referenceImageId != '') 
        ? 'https://cdn2.thecatapi.com/images/${response.referenceImageId}.jpg'
        : 'no-image', 
      lifeSpan: response.lifeSpan,
      adaptability: response.adaptability, 
      intelligence: response.intelligence, 
      childFriendly: response.childFriendly, 
      dogFriendly: response.dogFriendly, 
      energyLevel: response.energyLevel
    );
  }
}