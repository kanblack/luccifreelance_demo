import 'package:dartz/dartz.dart';

import '../../../../shared/error/failures.dart';
import '../entities/group_time_line.dart';
import '../entities/staff_info.dart';
import '../entities/time_line.dart';

abstract class CentralizedHumanResourceManagementRepository {
  Future<Either<Failure, StaffInfo>> getStaffInfo();
  Future<Either<Failure, List<GroupTimeLine>>> getTimeLine();
}
