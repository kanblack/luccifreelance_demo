import 'package:dartz/dartz.dart';
import 'package:demo_luci_web/src/feature/home/data/data_sources/centralized_human_resource_management_data_source.dart';
import 'package:demo_luci_web/src/feature/home/domain/repositories/centralized_human_resource_management_repository.dart';
import 'package:demo_luci_web/src/shared/error/failures.dart';

import '../../domain/entities/group_time_line.dart';
import '../../domain/entities/staff_info.dart';

class CentralizedHumanResourceManagementRepositoryImpl
    extends CentralizedHumanResourceManagementRepository {
  final CentralizedHumanResourceManagementDataSource dataSource;

  CentralizedHumanResourceManagementRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, StaffInfo>> getStaffInfo() async {
    return await dataSource.getStaffInfo();
  }

  @override
  Future<Either<Failure, List<GroupTimeLine>>> getTimeLine() async {
    return await dataSource.getTimeLine();
  }
}
