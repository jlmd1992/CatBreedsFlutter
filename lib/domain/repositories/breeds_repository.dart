import 'package:cats_flutter_app/domain/entities/breed_cat.dart';

abstract class BreedsRepository{

  Future<List<BreedCat>> getBreedsList();

}