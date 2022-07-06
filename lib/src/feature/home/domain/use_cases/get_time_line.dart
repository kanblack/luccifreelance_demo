import 'package:dartz/dartz.dart';

import '../../../../shared/error/failures.dart';
import '../../../../shared/usecases/usecase.dart';
import '../entities/group_time_line.dart';
import '../entities/time_line.dart';
import '../repositories/centralized_human_resource_management_repository.dart';

class GetTimeLine implements UseCase<List<GroupTimeLine>, bool> {
  final CentralizedHumanResourceManagementRepository _repository;

  GetTimeLine(this._repository);

  @override
  Future<Either<Failure, List<GroupTimeLine>>> call(bool params) {
    return _repository.getTimeLine();
  }
}
