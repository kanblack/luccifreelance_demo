import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import 'field_info_staff_widget.dart';

class StaffInfoDetailWidget extends StatelessWidget {
  const StaffInfoDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final staffCode = FieldInfoStaffWidget(
      title: S.current.lbl_staff_code,
      content: "GCH18133",
    );
    final userName = FieldInfoStaffWidget(
      title: S.current.lbl_user_name,
      content: "thangpn",
    );
    final email = FieldInfoStaffWidget(
      title: S.current.lbl_email,
      content: "thangpn0207@gmail.com",
    );
    final phoneNumber = FieldInfoStaffWidget(
      title: S.current.lbl_phone_number,
      content: "09184174294",
    );
    final dateOfBirth = FieldInfoStaffWidget(
      title: S.current.lbl_day_of_birth,
      content: "02/07/2002",
    );
    final gender = FieldInfoStaffWidget(
      title: S.current.lbl_gender,
      content: "Nam",
    );
    final address = FieldInfoStaffWidget(
      title: S.current.lbl_address,
      content: "Trần Thái Thông",
    );
    final idCard = FieldInfoStaffWidget(
      title: S.current.lbl_id_card,
      content: "1239746174910",
    );
    final dateRange = FieldInfoStaffWidget(
      title: S.current.lbl_date_range,
      content: "02/09/2011",
    );
    final placeForIdentityCard = FieldInfoStaffWidget(
      title: S.current.lbl_place_for_identity_card,
      content: "Hà Nội",
    );
    final note = FieldInfoStaffWidget(
      title: S.current.lbl_note,
      content: "Quản lý bản thân",
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
