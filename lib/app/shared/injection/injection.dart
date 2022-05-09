import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:measurement/app/modules/domain/repositories/auth_repository.dart';
import 'package:measurement/app/modules/domain/repositories/camera_repository.dart';
import 'package:measurement/app/modules/domain/useCases/objects/objects_usecase.dart';
import 'package:measurement/app/modules/domain/useCases/user/auth_usecase.dart';
import 'package:measurement/app/modules/external/auth_service/auth_service.dart';
import 'package:measurement/app/modules/external/auth_service/implementations/auth_service_imp.dart';
import 'package:measurement/app/modules/external/objects_service/implementations/objects_service_imp.dart';
import 'package:measurement/app/modules/external/objects_service/objects_service.dart';
import 'package:measurement/app/modules/infra/repositories/auth_repository_imp.dart';
import 'package:measurement/app/modules/infra/repositories/camera_repository_imp.dart';
import 'package:measurement/app/modules/infra/repositories/objects_repository_imp.dart';
import 'package:measurement/app/modules/presentation/blocs/create_object_bloc/create_object_bloc.dart';
import 'package:measurement/app/modules/presentation/blocs/list_objects_bloc/list_objects_bloc.dart';
import 'package:measurement/app/modules/presentation/blocs/user_bloc/user_bloc.dart';

import '../../modules/domain/repositories/objects_repositories.dart';

class Injection {
  static void inject() async {
    final getIt = GetIt.instance;

    // External
    getIt.registerLazySingleton<ObjectsService>(() => ObjectsServiceImp(Dio()));

    getIt.registerLazySingleton<AuthService>(() => AuthServiceImp(Dio()));

    // Repositories
    getIt.registerLazySingleton<ObjectsRepository>(
        () => ObjectsRepositoryImp(getIt()));

    getIt.registerSingleton<AuthRepository>(AuthRepositoryImp(getIt()));

    getIt.registerSingleton<CameraRepository>(CameraRepositoryImp());

    // useCases
    getIt.registerLazySingleton<ObjectsUseCase>(() => ObjectsUseCase(getIt()));
    getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCase(getIt()));

    // BLOC
    getIt.registerSingleton(ListObjectsBloc(getIt()));
    getIt.registerSingleton(CreateObjectBloc(getIt()));
    getIt.registerSingleton(UserBloc(getIt()));

    // CONTROLLERS

    // getIt.registerSingleton(AuthController(getIt(), getIt()));
  }
}
