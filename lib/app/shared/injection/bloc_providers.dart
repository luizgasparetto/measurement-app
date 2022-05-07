import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:measurement/app/modules/presentation/blocs/auth/auth_bloc.dart';
import 'package:measurement/app/modules/presentation/blocs/create_object/create_object_bloc.dart';
import 'package:measurement/app/modules/presentation/blocs/list_objects/list_objects_bloc.dart';

class BlocProviders {
  static List<BlocProvider> getProviders() {
    return [
      BlocProvider<ListObjectsBloc>(
        create: (_) => GetIt.I.get<ListObjectsBloc>()..add(GetObjectsEvent()),
      ),
      BlocProvider<AuthBloc>(create: (_) => GetIt.I.get<AuthBloc>()),
      BlocProvider<CreateObjectBloc>(
        create: (_) => GetIt.I.get<CreateObjectBloc>(),
      )
    ];
  }
}
