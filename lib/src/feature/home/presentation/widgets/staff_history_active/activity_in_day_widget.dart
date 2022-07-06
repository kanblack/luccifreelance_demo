import 'package:demo_luci_web/src/feature/home/domain/entities/group_time_line.dart';
import 'package:demo_luci_web/src/shared/constants/colors_constants.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/enums_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:demo_luci_web/src/shared/utils/enum_extension.dart';
import 'package:flutter/material.dart';

import 'activity_at_time_widget.dart';

class ActivityDayWidget extends StatelessWidget {
  final GroupTimeLine? timeLine;
  const ActivityDayWidget({Key? key, this.timeLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const paddingLarger = SizedBox(
      height: AppDimensPadding.largePadding,
    );
    const paddingSmall = SizedBox(
      height: AppDimensPadding.smallPadding,
    );
    const paddingWithSmall = SizedBox(
      width: AppDimensPadding.smallPadding,
    );
    final titleDay = SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.calendar_today_outlined,
            size: AppDimens.iconSmallSize,
            color: textNormal,
          ),
          paddingWithSmall,
          Text(
            timeLine?.getTime() ?? "",
            style: AppTextStyle.body1Medium,
          )
        ],
      ),
    );
    final listAction = timeLine != null
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ActivityAtTimeWidget(
                time: timeLine?.timeLine[index].getTime() ?? "",
                contentActivity: getActionTypeEnum(
                    timeLine?.timeLine[index].actionType ??
                        ActionTypeEnum.unKnow),
              );
            },
            itemCount: timeLine?.timeLine.length,
          )
        : Container();
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensPadding.contentPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [paddingSmall, titleDay, paddingLarger, listAction],
      ),
    );
  }
}
