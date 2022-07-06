import 'package:demo_luci_web/src/shared/constants/colors_constants.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import 'activity_at_time_widget.dart';

class ActivityDayWidget extends StatelessWidget {
  final String time;
  final List<String> action;
  const ActivityDayWidget({Key? key, required this.time, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingLarger = SizedBox(
      height: AppDimensPadding.largePadding,
    );
    final paddingSmall = SizedBox(
      height: AppDimensPadding.smallPadding,
    );
    final titleDay = SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            size: AppDimens.iconSmallSize,
            color: textNormal,
          ),
          Text(
            time,
            style: AppTextStyle.body1Medium,
          )
        ],
      ),
    );
    final listAction = ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ActivityAtTimeWidget(
          time: '16:30:24, 16/02/200',
          contentActivity: 'Chinh sua bat dong san',
        );
      },
      itemCount: 2,
    );
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppDimensPadding.contentPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [paddingSmall, titleDay, paddingLarger, listAction],
      ),
    );
  }
}
