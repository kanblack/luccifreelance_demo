import 'package:bloc/bloc.dart';
import 'package:demo_luci_web/src/feature/home/domain/use_cases/get_staff_info.dart';
import 'package:demo_luci_web/src/feature/home/domain/use_cases/get_time_line.dart';
import 'package:demo_luci_web/src/shared/blocs_app/loading_cubit/loading_cubit.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/group_time_line.dart';
import '../../domain/entities/staff_info.dart';
import '../../domain/entities/time_line.dart';

part 'centralized_human_resource_management_event.dart';
part 'centralized_human_resource_management_state.dart';

class CentralizedHumanResourceManagementBloc extends Bloc<
    CentralizedHumanResourceManagementEvent,
    CentralizedHumanResourceManagementState> {
  CentralizedHumanResourceManagementBloc(
      this.loadingCubit, this.getStaffInfo, this.getTimeLine)
      : super(CentralizedHumanResourceManagementInitial()) {
    on<RequestGetStaffInfoEvent>(_onGetStaffInfo);
    on<RequestGetTimeLineEvent>(_onGetTimeLine);
    on<RequestGetErr>(_onGetErr);
    on<ChangeState>(_onChangeState);
  }
  final LoadingCubit loadingCubit;
  final GetStaffInfo getStaffInfo;
  final GetTimeLine getTimeLine;

  void _onGetStaffInfo(RequestGetStaffInfoEvent event,
      Emitter<CentralizedHumanResourceManagementState> emitter) async {
    //loadingCubit.showLoading();
    await getStaffInfo(true).then((response) {
      //   loadingCubit.hideLoading();
      response.fold((l) => emitter(Failure(l.message)), (r) {
        emitter(GetStaffInfoSuccess(r));
      });
    });
  }

  void _onGetTimeLine(RequestGetTimeLineEvent event,
      Emitter<CentralizedHumanResourceManagementState> emitter) async {
    loadingCubit.showLoading();
    await getTimeLine(true).then((response) {
      loadingCubit.hideLoading();
      response.fold((l) => emitter(Failure(l.message)), (r) {
        emitter(GetTimeLineSuccess(r));
      });
    });
  }

  void _onGetErr(RequestGetErr event,
      Emitter<CentralizedHumanResourceManagementState> emitter) async {
    emitter(Failure("Some thing wrong"));
  }

  void _onChangeState(ChangeState event,
      Emitter<CentralizedHumanResourceManagementState> emitter) async {
    emitter(CentralizedHumanResourceManagementInitial());
  }
}
