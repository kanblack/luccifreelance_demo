import 'package:demo_luci_web/src/feature/home/domain/entities/authority_info.dart';
import 'package:demo_luci_web/src/feature/home/domain/entities/project.dart';
import 'package:demo_luci_web/src/feature/home/domain/entities/work_info.dart';

class StaffInfo {
  final String maNhanVien;
  final String ho;
  final String tenLot;
  final String ten;
  final String tenDangNhap;
  final String sdt;
  final String email;
  final String gioiTinh;
  final String ngaySinh;
  final String diaChi;
  final String chucVu;
  final AuthorityInfo authorityInfo;
  final String trangThai;
  final bool AuthFactor;
  final String note;
  final List<WorkInfo> workInfo;
  final List<Project> dsDuAn;
  StaffInfo(
      this.maNhanVien,
      this.ho,
      this.tenLot,
      this.ten,
      this.tenDangNhap,
      this.sdt,
      this.email,
      this.gioiTinh,
      this.ngaySinh,
      this.diaChi,
      this.authorityInfo,
      this.trangThai,
      this.AuthFactor,
      this.note,
      this.workInfo,
      this.dsDuAn,
      this.chucVu);
  String getStaffName() {
    return ho + " " + tenLot + " " + ten;
  }
}
