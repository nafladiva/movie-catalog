import 'package:get_it/get_it.dart';
import 'package:gowatch/presentation/cubit/navbar/navbar_cubit.dart';

import 'data/repositories/repository.dart';
import 'data/sources/sources.dart';

final locator = GetIt.instance;

void init() {
  //Cubit
  locator.registerFactory(
    () => NavbarCubit(),
  );

  //Repository
  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  //Remote data sources
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );
}
