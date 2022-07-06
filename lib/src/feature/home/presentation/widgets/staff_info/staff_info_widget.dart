import 'package:demo_luci_web/src/feature/home/domain/entities/staff_info.dart';
import 'package:demo_luci_web/src/feature/home/presentation/widgets/staff_info/avatar_staff_widget.dart';
import 'package:demo_luci_web/src/feature/home/presentation/widgets/staff_info/staff_info_detail_widget.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

class StaffInfoWidget extends StatelessWidget {
  final StaffInfo? staffInfo;
  const StaffInfoWidget({Key? key, required this.staffInfo}) : super(key: key);

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
    const staffInfoDetail = StaffInfoDetailWidget();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var size = MediaQuery.of(context).size;
        return Container(
          height: size.height * 1.14,
          decoration: const BoxDecoration(color: Colors.black12),
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
