import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'route_page_state.dart';

class RoutePageCubit extends Cubit<RoutePageState> {
  RoutePageCubit() : super(RoutePageProjectManagement());
  void showPageProjectManagement() {
    emit(RoutePageProjectManagement());
  }

  void showPageCentralizedDepartmentManagement() {
    emit(RoutePageCentralizedDepartmentManagement());
  }

  void showPageCentralizedHumanResourceManagement() {
    emit(RoutePageCentralizedHumanResourceManagement());
  }

  void showPageConfiguration() {
    emit(RoutePageConfiguration());
  }
}
