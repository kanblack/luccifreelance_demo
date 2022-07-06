import 'package:dartz/dartz.dart';

import '../../../../shared/error/failures.dart';
import '../../../../shared/usecases/usecase.dart';
import '../entities/staff_info.dart';
import '../repositories/centralized_human_resource_management_repository.dart';

class GetStaffInfo implements UseCase<StaffInfo, bool> {
  final CentralizedHumanResourceManagementRepository _repository;

  GetStaffInfo(this._repository);

  @override
  Future<Either<Failure, StaffInfo>> call(bool p) {
    return _repository.getStaffInfo();
  }
}
