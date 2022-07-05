import 'package:demo_luci_web/src/feature/home/presentation/widgets/staff_info/avatar_staff_widget.dart';
import 'package:demo_luci_web/src/feature/home/presentation/widgets/staff_info/staff_info_detail_widget.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/constants/block_spacing.dart';
import 'field_info_staff_widget.dart';

class StaffInfoWidget extends StatelessWidget {
  const StaffInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingNormal = SizedBox(height: AppDimensPadding.contentPadding);
    final avatarStaffWidget = AvatarStaffWidget();
    final titleStaffInfo = Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppDimensPadding.contentPadding),
      child: Text(
        S.current.lbl_title_staff_info,
        style: AppTextStyle.heading2Bold,
      ),
    );
    const staffInfoDetail =  StaffInfoDetailWidget();

    return ResponsiveConstraints(
      constraintsWhen: blockWidthConstraints,
      child: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paddingNormal,
            avatarStaffWidget,
            paddingNormal,
            Divider(),
            paddingNormal,
            titleStaffInfo,
            paddingNormal,
            staffInfoDetail
          ],
        ),
      ),
    );
  }
}
