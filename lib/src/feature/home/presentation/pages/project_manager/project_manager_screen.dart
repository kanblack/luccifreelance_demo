import 'package:demo_luci_web/src/shared/constants/colors_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../widgets/staff_info/avatar_staff_widget.dart';
import '../../widgets/staff_info/staff_info_widget.dart';

class ProjectManagerScreen extends StatefulWidget {
  const ProjectManagerScreen({Key? key}) : super(key: key);

  @override
  State<ProjectManagerScreen> createState() => _ProjectManagerScreenState();
}

class _ProjectManagerScreenState extends State<ProjectManagerScreen> {
  @override
  Widget build(BuildContext context) {
    final paddingLeftTitle = SizedBox(
      width: 24,
    );
    final titlePage = Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Row(
        children: [
          paddingLeftTitle,
          Text(
            S.current.lbl_centralized_human_resource_management,
            style: AppTextStyle.body1Medium.apply(color: AppColors.textButton),
          ),
          const Text(
            " / ",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "Phạm Ngoc Thắng",
            style: AppTextStyle.body1,
          )
        ],
      ),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          titlePage,
          Row(
            children: [
              Flexible(flex: 2, child: StaffInfoWidget()),
              Flexible(flex: 3, child: Container()),
              Flexible(flex: 2, child: AvatarStaffWidget()),
            ],
          )
        ],
      ),
    );
  }
}
