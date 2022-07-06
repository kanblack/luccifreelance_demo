import 'package:dartz/dartz.dart';
import 'package:demo_luci_web/src/feature/home/data/models/staff_info_responsive.dart';
import 'package:demo_luci_web/src/feature/home/data/models/time_line_responsive.dart';
import 'package:demo_luci_web/src/feature/home/domain/entities/authority_info.dart';
import 'package:demo_luci_web/src/feature/home/domain/entities/project.dart';
import 'package:demo_luci_web/src/feature/home/domain/entities/staff_info.dart';
import 'package:demo_luci_web/src/feature/home/domain/entities/time_line.dart';
import 'package:demo_luci_web/src/feature/home/domain/entities/work_info.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../../../../shared/error/failures.dart';
import '../../../../shared/network/network_info.dart';
import '../../../../shared/services/rest_api_service.dart';
import '../../domain/entities/group_time_line.dart';

class CentralizedHumanResourceManagementDataSource {
  final RestClient _client;
  final NetworkInfo _networkInfo;

  CentralizedHumanResourceManagementDataSource(this._client, this._networkInfo);

  Future<Either<Failure, StaffInfo>> getStaffInfo() async {
    try {
      bool isConnected = await _networkInfo.isConnected;
      if (isConnected) {
        StaffInfoResponsive? staffInfo = await _client.getStaffInfo();
        return Right(getStaffFromResponsive(staffInfo));
      } else {
        return Left(NoNetworkError());
      }
    } catch (e) {
      switch (e.runtimeType) {
        case DioError:
          final res = (e as DioError).response;
          return Left(ServerFailure(e.message));
        default:
          return Left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, List<GroupTimeLine>>> getTimeLine() async {
    try {
      bool isConnected = await _networkInfo.isConnected;
      if (isConnected) {
        List<TimeLineResponsive>? timeLine = await _client.getTimeLine();
        List<TimeLine> listTimeLine = getListTimeLineResponsive(timeLine);
        return Right(getGroupTimeLine(listTimeLine));
      } else {
        return Left(NoNetworkError());
      }
    } catch (e) {
      switch (e.runtimeType) {
        case DioError:
          final res = (e as DioError).response;
          return Left(ServerFailure(e.message));
        default:
          return Left(ServerFailure(e.toString()));
      }
    }
  }

  AuthorityInfo getAuthorityInfoFromResponsive(
      ThongTinXacThucResponsive? thongTinXacThucResponsive) {
    if (thongTinXacThucResponsive != null) {
      return AuthorityInfo(
          thongTinXacThucResponsive.maSoGiayTo ?? "",
          thongTinXacThucResponsive.ngayCap ?? "",
          thongTinXacThucResponsive.noiCap ?? "");
    } else {
      return AuthorityInfo("", "", "");
    }
  }

  Project getProjectFromResponsive(DsDuAnResponsive? dsDuAnResponsive) {
    if (dsDuAnResponsive != null) {
      return Project(dsDuAnResponsive.id ?? "", dsDuAnResponsive.tenDuAn ?? "",
          dsDuAnResponsive.role ?? "");
    } else {
      return Project("", "", "");
    }
  }

  List<Project> getListProjectResponsive(List<DsDuAnResponsive>? list) {
    List<Project> listData = [];
    if (list != null) {
      for (var element in list) {
        listData.add(getProjectFromResponsive(element));
      }
    }
    return listData;
  }

  TimeLine getTimeLineFromResponsive(TimeLineResponsive? timeLineResponsive) {
    if (timeLineResponsive != null) {
      return TimeLine(
          timeLineResponsive.id ?? "",
          timeLineResponsive.createdAt ?? "",
          timeLineResponsive.actionType ?? "");
    } else {
      return TimeLine("", "", "");
    }
  }

  List<TimeLine> getListTimeLineResponsive(List<TimeLineResponsive>? list) {
    List<TimeLine> listData = [];
    if (list != null) {
      for (var element in list) {
        listData.add(getTimeLineFromResponsive(element));
      }
    }
    return listData;
  }

  WorkInfo getWorkInfoResponsive(
      ThongTinCongViecResponsive? thongTinCongViecResponsive) {
    if (thongTinCongViecResponsive != null) {
      return WorkInfo(
          thongTinCongViecResponsive.boPhan ?? "",
          thongTinCongViecResponsive.quyenHan ?? "",
          thongTinCongViecResponsive.id ?? "");
    } else {
      return WorkInfo(
        "",
        "",
        "",
      );
    }
  }

  List<WorkInfo> getListWorkInfoResponsive(
      List<ThongTinCongViecResponsive>? list) {
    List<WorkInfo> listData = [];
    if (list != null) {
      for (var element in list) {
        listData.add(getWorkInfoResponsive(element));
      }
    }
    return listData;
  }

  StaffInfo getStaffFromResponsive(StaffInfoResponsive? staffInfoResponsive) {
    if (staffInfoResponsive != null) {
      return StaffInfo(
          staffInfoResponsive.maNhanVien ?? "",
          staffInfoResponsive.ho ?? "",
          staffInfoResponsive.tenLot ?? "",
          staffInfoResponsive.ten ?? "",
          staffInfoResponsive.tenDangNhap ?? "",
          staffInfoResponsive.sdt ?? "",
          staffInfoResponsive.email ?? "",
          staffInfoResponsive.gioiTinh ?? "",
          staffInfoResponsive.ngaySinh ?? "",
          staffInfoResponsive.diaChi ?? "",
          getAuthorityInfoFromResponsive(staffInfoResponsive.thongTinXacThuc),
          staffInfoResponsive.trangThai ?? "",
          staffInfoResponsive.AuthFactor ?? false,
          staffInfoResponsive.note ?? "",
          getListWorkInfoResponsive(staffInfoResponsive.thongTinCongViec),
          getListProjectResponsive(staffInfoResponsive.dsDuAn),
          staffInfoResponsive.chucVu ?? "");
    } else {
      return StaffInfo(
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          getAuthorityInfoFromResponsive(null),
          "",
          false,
          "",
          getListWorkInfoResponsive(null),
          getListProjectResponsive(null),
          "");
    }
  }

  List<GroupTimeLine> getGroupTimeLine(List<TimeLine> list) {
    List<GroupTimeLine> groupLine = [];
    if (list.isNotEmpty) {
      DateTime currentTime = DateFormat("yyyy-MM-dd").parse(list[0].createdAt);

      GroupTimeLine current = GroupTimeLine(currentTime, []);
      for (var element in list) {
        DateTime time = DateFormat("yyyy-MM-dd").parse(element.createdAt);
        if (time == currentTime) {
          current.timeLine.add(element);
        } else {
          groupLine.add(current);
          current = GroupTimeLine(time, []);
          currentTime = time;
        }
      }
    }
    return groupLine;
  }
}
