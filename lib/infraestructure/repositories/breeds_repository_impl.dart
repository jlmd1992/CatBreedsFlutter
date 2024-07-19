import 'package:cats_flutter_app/domain/entities/breed_cat.dart';
import 'package:cats_flutter_app/domain/repositories/breeds_repository.dart';
import 'package:cats_flutter_app/infraestructure/datasources/breeds_datasource_impl.dart';

class BreedsRepositoryImpl extends BreedsRepository {
  
  final BreedsDatasourceImpl datasource;

  BreedsRepositoryImpl(this.datasource);

  @override
  Future<List<BreedCat>> getBreedsList() async {

    return await datasource.getBreedsList();
  }

}