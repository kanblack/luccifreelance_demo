import 'package:demo_luci_web/src/feature/home/domain/entities/staff_info.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/imgs_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constants/colors_constants.dart';
import 'dropdown_selected_widget.dart';

class AvatarStaffWidget extends StatelessWidget {
  final StaffInfo? staffInfo;
  const AvatarStaffWidget({Key? key, this.staffInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tinyPadding = SizedBox(
      width: AppDimensPadding.smallPadding,
    );
    const normalPadding = SizedBox(
      width: AppDimensPadding.normalPadding,
    );
    final avatarStaff = CircleAvatar(
      backgroundColor: shadowColor,
      radius: AppAvatarSize.normalSize,
      child: Image.network("https://i.pravatar.cc/300"),
    );
    final staffInfoWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          staffInfo?.getStaffName() ?? "",
          style: AppTextStyle.heading3Bold,
        ),
        Text(staffInfo?.chucVu ?? "", style: AppTextStyle.body1),
        Text(staffInfo?.trangThai ?? "", style: AppTextStyle.body1)
      ],
    );
    const textButtonDropDown = DropDownSelectWidget();
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensPadding.contentPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                avatarStaff,
                tinyPadding,
                Expanded(child: staffInfoWidget)
              ],
            ),
          ),
          normalPadding,
          textButtonDropDown
        ],
      ),
    );
  }
}
