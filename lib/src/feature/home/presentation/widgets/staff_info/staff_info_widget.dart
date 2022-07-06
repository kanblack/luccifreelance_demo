import 'package:demo_luci_web/src/feature/home/domain/entities/staff_info.dart';
import 'package:demo_luci_web/src/feature/home/presentation/widgets/staff_info/avatar_staff_widget.dart';
import 'package:demo_luci_web/src/feature/home/presentation/widgets/staff_info/staff_info_detail_widget.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/constants/colors_constants.dart';

class StaffInfoWidget extends StatelessWidget {
  final StaffInfo? staffInfo;
  const StaffInfoWidget({
    Key? key,
    this.staffInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingNormal = SizedBox(height: AppDimensPadding.contentPadding);
    final avatarStaffWidget = AvatarStaffWidget(
      staffInfo: staffInfo,
    );
    final titleStaffInfo = Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensPadding.contentPadding),
      child: Text(
        S.current.lbl_title_staff_info,
        style: AppTextStyle.heading2Bold,
      ),
    );
    final staffInfoDetail = StaffInfoDetailWidget(
      staffInfo: staffInfo,
    );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var size = MediaQuery.of(context).size;
        return Container(
          padding: EdgeInsets.only(left: AppDimensPadding.tinyPadding),
          height: size.height * 1.14,
          width: 400,
          decoration: const BoxDecoration(
              color: back12Background,
              border: Border(right: BorderSide(color: borderColor))),
          child: SingleChildScrollView(
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
      },
    );
  }
}
