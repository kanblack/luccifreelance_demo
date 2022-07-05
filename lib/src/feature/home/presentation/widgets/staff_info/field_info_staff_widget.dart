import 'package:demo_luci_web/src/shared/constants/colors_constants.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

class FieldInfoStaffWidget extends StatelessWidget {
  final String title;
  final String content;
  const FieldInfoStaffWidget(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingSmall = SizedBox(
      height: AppDimensPadding.normalPadding,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensPadding.contentPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.heading3,
          ),
          paddingSmall,
          Text(
            content,
            style: AppTextStyle.body1Medium,
          )
        ],
      ),
    );
  }
}
