import 'package:demo_luci_web/src/feature/home/domain/entities/staff_info.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/constants/colors_constants.dart';
import '../../../../../shared/constants/dimens_constants.dart';
import 'department_and_authority_widget.dart';
import 'project_and_decentralization_widget.dart';

class WorkInfoAndProjectInfoWidget extends StatelessWidget {
  final StaffInfo? staffInfo;
  const WorkInfoAndProjectInfoWidget({
    Key? key,
    this.staffInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const largerPadding = SizedBox(
      height: AppDimensPadding.largePadding,
    );
    final titleWorkInfo = SizedBox(
      width: double.infinity,
      child: Text(
        S.current.lbl_work_info,
        style: AppTextStyle.heading3Bold,
      ),
    );
    final titleProjectAndDecentralization = SizedBox(
      width: double.infinity,
      child: Text(
        S.current.lbl_project_in_charge_and_decentralization,
        style: AppTextStyle.heading3Bold,
      ),
    );
    final titleDepartmentAndAuthority = DepartmentAndAuthorityWidget(
      department: S.current.lbl_department,
      authority: S.current.lbl_authority,
      isTitle: true,
    );
    final listWorkInfo = (staffInfo != null)
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return DepartmentAndAuthorityWidget(
                department: staffInfo?.workInfo[index].boPhan ?? "",
                authority: staffInfo?.workInfo[index].quyenHan ?? "",
                isTitle: false,
              );
            },
            itemCount: staffInfo?.workInfo.length,
          )
        : const DepartmentAndAuthorityWidget(
            department: "",
            authority: "",
            isTitle: false,
          );
    final listProjectAndDecentralization = (staffInfo != null)
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProjectAndDecentralization(
                decentralization: staffInfo?.dsDuAn[index].role ?? "",
                projectNumber: (index + 1).toString(),
                projectName: staffInfo?.dsDuAn[index].role ?? "",
              );
            },
            itemCount: staffInfo?.dsDuAn.length,
          )
        : const ProjectAndDecentralization(
            decentralization: "",
            projectNumber: "",
            projectName: "",
          );
    return LayoutBuilder(
      builder: (context, constraints) {
        var size = MediaQuery.of(context).size;
        return Container(
          height: size.height * 1.14,
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimensPadding.contentPadding),
          decoration: const BoxDecoration(color: back12Background),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                largerPadding,
                titleWorkInfo,
                largerPadding,
                titleDepartmentAndAuthority,
                listWorkInfo,
                largerPadding,
                titleProjectAndDecentralization,
                listProjectAndDecentralization,
              ],
            ),
          ),
        );
      },
    );
  }
}
