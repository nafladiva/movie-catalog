import 'package:get_it/get_it.dart';

import 'data/repositories/repository.dart';
import 'data/sources/sources.dart';
import 'presentation/cubit/cubit.dart';

final locator = GetIt.instance;

void init() {
  //Cubit
  locator.registerFactory(
    () => NavbarCubit(),
  );

  locator.registerFactory(
    () => MovieCubit(repository: locator()),
  );

  //Repository
  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  //Remote data sources
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );

  //Local data sources
  locator.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(hiveDatabase: locator()),
  );

  //Hive database
  locator.registerLazySingleton<HiveLocalDatabase>(
    () => HiveLocalDatabase(),
  );
}
