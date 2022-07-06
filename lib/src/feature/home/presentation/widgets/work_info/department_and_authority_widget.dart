import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/constants/colors_constants.dart';

class DepartmentAndAuthorityWidget extends StatelessWidget {
  final bool isTitle;
  final String department;
  final String authority;
  const DepartmentAndAuthorityWidget(
      {Key? key,
      required this.isTitle,
      required this.department,
      required this.authority})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingLarge = SizedBox(
      width: AppDimensPadding.largePadding,
    );
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isTitle
              ? AppDimensPadding.tinyPadding
              : AppDimensPadding.smallPadding),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: back12Background,
      ))),
      child: Row(
        children: [
          Expanded(
            child: Text(
              department,
              style: isTitle ? AppTextStyle.body1Bold : AppTextStyle.body1,
            ),
          ),
          paddingLarge,
          Expanded(
            child: Text(
              authority,
              style: isTitle ? AppTextStyle.body1Bold : AppTextStyle.body1,
            ),
          )
        ],
      ),
    );
  }
}
