import 'package:dio/dio.dart';
import 'package:cats_flutter_app/domain/entities/breed_cat.dart';
import 'package:cats_flutter_app/infraestructure/mappers/breed_cat_mapper.dart';
import 'package:cats_flutter_app/infraestructure/models/breed_cat_response.dart';
import 'package:cats_flutter_app/domain/datasources/breeds_datasource.dart';

class BreedsDatasourceImpl implements BreedsDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.thecatapi.com/v1'
  ));

  @override
  Future<List<BreedCat>> getBreedsList() async {

    final response = await dio.get('/breeds');

    if(response.statusCode == 200){
      final List<dynamic> data = response.data;
      final List<BreedCatResponse> breedCatsResponse = data.map((json) => BreedCatResponse.fromJson(json)).toList();

      final List<BreedCat> breedCats = breedCatsResponse
      .where((element) => element.referenceImageId != 'no-image')
      .map<BreedCat>((element) => 
        BreedCatMapper.breedCatResponseToEntity(element)
      ).toList();
      
      return breedCats;
    } else {
      return [];
    }
  }

}