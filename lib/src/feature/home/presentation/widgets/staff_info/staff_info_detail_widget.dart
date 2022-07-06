import 'package:demo_luci_web/src/feature/home/domain/entities/staff_info.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import 'field_info_staff_widget.dart';

class StaffInfoDetailWidget extends StatelessWidget {
  final StaffInfo? staffInfo;
  const StaffInfoDetailWidget({Key? key, this.staffInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final staffCode = FieldInfoStaffWidget(
      title: S.current.lbl_staff_code,
      content: staffInfo?.maNhanVien ?? "",
    );
    final userName = FieldInfoStaffWidget(
      title: S.current.lbl_user_name,
      content: staffInfo?.tenDangNhap ?? "",
    );
    final email = FieldInfoStaffWidget(
      title: S.current.lbl_email,
      content: staffInfo?.email ?? "",
    );
    final phoneNumber = FieldInfoStaffWidget(
      title: S.current.lbl_phone_number,
      content: staffInfo?.sdt ?? "",
    );
    final dateOfBirth = FieldInfoStaffWidget(
      title: S.current.lbl_day_of_birth,
      content: staffInfo?.ngaySinh ?? "",
    );
    final gender = FieldInfoStaffWidget(
      title: S.current.lbl_gender,
      content: staffInfo?.gioiTinh ?? "",
    );
    final address = FieldInfoStaffWidget(
      title: S.current.lbl_address,
      content: staffInfo?.diaChi ?? "",
    );
    final idCard = FieldInfoStaffWidget(
      title: S.current.lbl_id_card,
      content: staffInfo?.authorityInfo.maGiayTo ?? "",
    );
    final dateRange = FieldInfoStaffWidget(
      title: S.current.lbl_date_range,
      content: staffInfo?.authorityInfo.ngayCap ?? "",
    );
    final placeForIdentityCard = FieldInfoStaffWidget(
      title: S.current.lbl_place_for_identity_card,
      content: staffInfo?.authorityInfo.noiCap ?? "",
    );
    final note = FieldInfoStaffWidget(
      title: S.current.lbl_note,
      content: staffInfo?.note ?? "",
    );
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensPadding.contentPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          staffCode,
          userName,
          email,
          phoneNumber,
          dateOfBirth,
          gender,
          address,
          idCard,
          dateRange,
          placeForIdentityCard,
          note
        ],
      ),
    );
  }
}
