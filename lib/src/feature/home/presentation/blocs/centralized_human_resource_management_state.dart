part of 'centralized_human_resource_management_bloc.dart';

@immutable
abstract class CentralizedHumanResourceManagementState {}

class CentralizedHumanResourceManagementInitial
    extends CentralizedHumanResourceManagementState {}

class GetStaffInfoSuccess extends CentralizedHumanResourceManagementState {
  final StaffInfo staffInfo;

  GetStaffInfoSuccess(this.staffInfo);
}

class GetTimeLineSuccess extends CentralizedHumanResourceManagementState {
  final List<GroupTimeLine> list;

  GetTimeLineSuccess(this.list);
}

class Failure extends CentralizedHumanResourceManagementState {
  final String message;

  Failure(this.message);
}
