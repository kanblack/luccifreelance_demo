import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_luci_web/src/feature/home/data/data_sources/centralized_human_resource_management_data_source.dart';
import 'package:demo_luci_web/src/feature/home/data/repositories/centralized_human_resource_management_repository_impl.dart';
import 'package:demo_luci_web/src/feature/home/domain/repositories/centralized_human_resource_management_repository.dart';
import 'package:demo_luci_web/src/feature/home/domain/use_cases/get_staff_info.dart';
import 'package:demo_luci_web/src/feature/home/domain/use_cases/get_time_line.dart';
import 'package:demo_luci_web/src/feature/home/presentation/blocs/centralized_human_resource_management_bloc.dart';
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
  getIt.registerFactory(
      () => CentralizedHumanResourceManagementBloc(getIt(), getIt(), getIt()));
}

void _configureUseCases() {
  getIt.registerLazySingleton(() => GetTimeLine(getIt()));
  getIt.registerLazySingleton(() => GetStaffInfo(getIt()));
}

void _configureRepositories() {
  getIt.registerLazySingleton<CentralizedHumanResourceManagementRepository>(
      () => CentralizedHumanResourceManagementRepositoryImpl(getIt()));
}

void _configureDataSources() {
  getIt.registerLazySingleton(
      () => CentralizedHumanResourceManagementDataSource(getIt(), getIt()));
}

void _configureCores() {
  getIt.registerLazySingleton<RestClient>(() {
    return RestClient(getIt<DioManager>().dio);
  });
  getIt.registerLazySingleton(() => DioManager(getIt(), getIt()));

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  getIt.registerFactory(() => Connectivity());

  getIt.registerLazySingleton(() => LocalStorageService());
}
