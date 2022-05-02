import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:measurement/app/modules/domain/useCases/objects/objects_usecase.dart';
import 'package:measurement/app/modules/external/objects_service/implementations/objects_service_imp.dart';
import 'package:measurement/app/modules/external/objects_service/objects_service.dart';
import 'package:measurement/app/modules/infra/repositories/objects_repository_imp.dart';
import 'package:measurement/app/modules/presentation/blocs/list_objects/list_objects_bloc.dart';

import '../../modules/domain/repositories/objects_repositories.dart';

class Injection {
  static void inject() {
    final getIt = GetIt.instance;

    // External
    getIt.registerLazySingleton<ObjectsService>(
        () => ObjectsServiceImp(Client()));

    // Repositories
    getIt.registerLazySingleton<ObjectsRepository>(
        () => ObjectsRepositoryImp(getIt()));

    // useCases
    getIt.registerLazySingleton<ObjectsUseCase>(() => ObjectsUseCase(getIt()));

    // Bloc
    getIt.registerSingleton(ListObjectsBloc(getIt()));
  }
}
