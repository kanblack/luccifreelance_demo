import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constants/colors_constants.dart';
import 'dropdown_selected_widget.dart';

class AvatarStaffWidget extends StatelessWidget {
  const AvatarStaffWidget({Key? key}) : super(key: key);

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
      child: Container(),
    );
    final staffInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phạm Ngọc Thắng",
          style: AppTextStyle.heading3Bold,
        ),
        Text("Developer", style: AppTextStyle.body1),
        Text("Active", style: AppTextStyle.body1)
      ],
    );
    final textButtonDropDown = DropDownSelectWidget();
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensPadding.contentPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          avatarStaff,
          tinyPadding,
          Expanded(child: staffInfo),
          normalPadding,
          textButtonDropDown
        ],
      ),
    );
  }
}
