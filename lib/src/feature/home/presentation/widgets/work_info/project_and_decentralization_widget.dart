import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import '../../../../../shared/constants/colors_constants.dart';

import '../../../../../../generated/l10n.dart';

class ProjectAndDecentralization extends StatelessWidget {
  final String projectNumber;
  final String projectName;
  final String decentralization;
  const ProjectAndDecentralization(
      {Key? key,
      required this.projectNumber,
      required this.projectName,
      required this.decentralization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const largerPadding = SizedBox(
      height: AppDimensPadding.largePadding,
    );
    const normalPadding = SizedBox(
      height: AppDimensPadding.normalPadding,
    );
    const smallPadding = SizedBox(
      height: AppDimensPadding.smallPadding,
    );
    final accessedButton = MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              S.current.lbl_accessed_features,
              style: AppTextStyle.body1Medium.apply(color: textButton),
              overflow: TextOverflow.ellipsis,
            ),
            Icon(
              Icons.arrow_drop_down,
              color: textButton,
              size: AppDimens.iconSmallSize,
            )
          ],
        ),
      ),
    );
    final projectNumberWidget = Text(
      S.current.lbl_project + projectNumber,
      style: AppTextStyle.body1,
    );
    final projectNameWidget = Text(
      S.current.lbl_project + projectName,
      style: AppTextStyle.body1Medium,
    );
    final titleDecentralizationWidget = Text(
      S.current.lbl_decentralization,
      style: AppTextStyle.body1,
    );
    final decentralizationWidget = Text(
      decentralization,
      style: AppTextStyle.body1Medium,
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          largerPadding,
          projectNumberWidget,
          smallPadding,
          projectNameWidget,
          largerPadding,
          titleDecentralizationWidget,
          smallPadding,
          decentralizationWidget,
          normalPadding,
          accessedButton
        ],
      ),
    );
  }
}
