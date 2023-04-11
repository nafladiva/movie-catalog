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
