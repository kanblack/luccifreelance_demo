import 'package:demo_luci_web/src/shared/constants/colors_constants.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

class ActivityAtTimeWidget extends StatelessWidget {
  final String time;
  final String contentActivity;
  const ActivityAtTimeWidget(
      {Key? key, required this.time, required this.contentActivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingLarger = SizedBox(
      height: AppDimensPadding.largePadding,
    );
    const paddingNormal = SizedBox(
      height: AppDimensPadding.normalPadding,
    );

    final dateTime = SizedBox(
      child: Text(
        time,
        style: AppTextStyle.caption1,
      ),
    );
    final fieldAction = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensPadding.contentPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: back12Background,
      ),
      child: Text(
        contentActivity,
        style: AppTextStyle.body1Bold,
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dateTime,
        paddingNormal,
        fieldAction,
        paddingLarger,
      ],
    );
  }
}
