import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/constants/colors_constants.dart';
import '../../../../../shared/constants/dimens_constants.dart';
import 'department_and_authority_widget.dart';
import 'project_and_decentralization_widget.dart';

class WorkInfoAndProjectInfoWidget extends StatelessWidget {
  const WorkInfoAndProjectInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final extraLargerPadding = SizedBox(
      height: AppDimensPadding.extraLargePadding,
    );
    final largerPadding = SizedBox(
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
    final listWorkInfo = ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return DepartmentAndAuthorityWidget(
          department: "Test",
          authority: '2213',
          isTitle: false,
        );
      },
      itemCount: 2,
    );
    final listProjectAndDecentralization = ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ProjectAndDecentralization(
          decentralization: 'Dev',
          projectNumber: '1',
          projectName: 'Luci',
        );
      },
      itemCount: 2,
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        var size = MediaQuery.of(context).size;
        return Container(
          height: size.height * 1.14,
          padding:
              EdgeInsets.symmetric(horizontal: AppDimensPadding.contentPadding),
          decoration: BoxDecoration(color: back12Background),
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
        );
      },
    );
  }
}
