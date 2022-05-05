import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:measurement/app/modules/domain/repositories/auth_repository.dart';
import 'package:measurement/app/modules/domain/useCases/objects/objects_usecase.dart';
import 'package:measurement/app/modules/domain/useCases/user/auth_usecase.dart';
import 'package:measurement/app/modules/external/objects_service/auth_service.dart';
import 'package:measurement/app/modules/external/objects_service/implementations/auth_service_imp.dart';
import 'package:measurement/app/modules/external/objects_service/implementations/objects_service_imp.dart';
import 'package:measurement/app/modules/external/objects_service/objects_service.dart';
import 'package:measurement/app/modules/infra/repositories/auth_repository_imp.dart';
import 'package:measurement/app/modules/infra/repositories/objects_repository_imp.dart';
import 'package:measurement/app/modules/presentation/blocs/auth/auth_bloc.dart';
import 'package:measurement/app/modules/presentation/blocs/list_objects/list_objects_bloc.dart';

import '../../modules/domain/repositories/objects_repositories.dart';

class Injection {
  static void inject() {
    final getIt = GetIt.instance;

    // External
    getIt.registerLazySingleton<ObjectsService>(
        () => ObjectsServiceImp(Client()));

    getIt.registerLazySingleton<AuthService>(() => AuthServiceImp(Dio()));

    // Repositories
    getIt.registerLazySingleton<ObjectsRepository>(
        () => ObjectsRepositoryImp(getIt()));

    getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImp(getIt()));

    // useCases
    getIt.registerLazySingleton<ObjectsUseCase>(() => ObjectsUseCase(getIt()));
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCase(getIt()));

    // BLOC
    getIt.registerSingleton(ListObjectsBloc(getIt()));
    getIt.registerSingleton(AuthBloc(getIt()));
  }
}
