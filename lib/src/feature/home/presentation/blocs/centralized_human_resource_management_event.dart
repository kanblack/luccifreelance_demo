part of 'centralized_human_resource_management_bloc.dart';

@immutable
abstract class CentralizedHumanResourceManagementEvent {}

class RequestGetStaffInfoEvent extends CentralizedHumanResourceManagementEvent {
}

class RequestGetTimeLineEvent extends CentralizedHumanResourceManagementEvent {}

class RequestGetProjectInfoEvent
    extends CentralizedHumanResourceManagementEvent {}

class RequestGetErr extends CentralizedHumanResourceManagementEvent {}

class ChangeState extends CentralizedHumanResourceManagementEvent {}
