import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cats_flutter_app/domain/repositories/breeds_repository.dart';
import 'package:cats_flutter_app/infraestructure/datasources/breeds_datasource_impl.dart';
import 'package:cats_flutter_app/infraestructure/repositories/breeds_repository_impl.dart';


final breedsRepositoryProvider = Provider<BreedsRepository>((ref) {
  return BreedsRepositoryImpl(BreedsDatasourceImpl());
});