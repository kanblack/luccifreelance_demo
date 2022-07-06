import 'package:demo_luci_web/src/shared/constants/colors_constants.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../../generated/l10n.dart';
import '../../widgets/staff_history_active/history_activity_widget.dart';
import '../../widgets/staff_info/avatar_staff_widget.dart';
import '../../widgets/staff_info/staff_info_widget.dart';
import '../../widgets/work_info/work_info_and_project_info_widget.dart';

class ProjectManagerScreen extends StatefulWidget {
  const ProjectManagerScreen({Key? key}) : super(key: key);

  @override
  State<ProjectManagerScreen> createState() => _ProjectManagerScreenState();
}

class _ProjectManagerScreenState extends State<ProjectManagerScreen> {
  @override
  Widget build(BuildContext context) {
    const paddingLeftTitle = SizedBox(
      width: AppDimensPadding.largePadding,
    );
    final titlePage = Container(
      width: double.infinity,
      height: AppDimens.heightTitlePage,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Row(
        children: [
          paddingLeftTitle,
          Text(
            S.current.lbl_centralized_human_resource_management,
            style: AppTextStyle.body1Medium.apply(color: appBarColor),
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          titlePage,
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Flexible(flex: 2, child: StaffInfoWidget()),
              Flexible(flex: 4, child: HistoryActivityWidget()),
              Flexible(flex: 2, child: WorkInfoAndProjectInfoWidget()),
            ],
          )
        ],
      ),
    );
  }
}
