import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_luci_web/src/shared/blocs_app/route_page_cubit/route_page_cubit.dart';
import 'package:get_it/get_it.dart';

import 'src/shared/blocs_app/loading_cubit/loading_cubit.dart';
import 'src/shared/network/network_info.dart';
import 'src/shared/services/dio_manager.dart';
import 'src/shared/services/local_store_service.dart';
import 'src/shared/services/rest_api_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  _configureBlocs();
  _configureUseCases();
  _configureRepositories();
  _configureDataSources();
  _configureCores();
}

void _configureBlocs() {
  getIt.registerLazySingleton(() => LoadingCubit());
  getIt.registerLazySingleton(() => RoutePageCubit());
}

void _configureUseCases() {}

void _configureRepositories() {}

void _configureDataSources() {}

void _configureCores() {
  getIt.registerLazySingleton<RestClient>(() {
    return RestClient(getIt<DioManager>().dio);
  });
  getIt.registerLazySingleton(() => DioManager(getIt(), getIt()));

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  getIt.registerFactory(() => Connectivity());

  getIt.registerLazySingleton(() => LocalStorageService());
}
