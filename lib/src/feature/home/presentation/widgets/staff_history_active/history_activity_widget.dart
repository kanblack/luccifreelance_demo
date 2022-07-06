import 'package:demo_luci_web/src/feature/home/domain/entities/group_time_line.dart';
import 'package:demo_luci_web/src/feature/home/presentation/widgets/staff_history_active/activity_in_day_widget.dart';
import 'package:demo_luci_web/src/feature/home/presentation/widgets/staff_history_active/search_history_widget.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/constants/colors_constants.dart';
import '../../../domain/entities/time_line.dart';

class HistoryActivityWidget extends StatefulWidget {
  const HistoryActivityWidget({Key? key}) : super(key: key);

  @override
  State<HistoryActivityWidget> createState() => _HistoryActivityWidgetState();
}

class _HistoryActivityWidgetState extends State<HistoryActivityWidget> {
  @override
  Widget build(BuildContext context) {
    final titlePage = Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimensPadding.contentPadding,
          horizontal: AppDimensPadding.contentPadding),
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: shadowColor))),
      child: Text(
        S.current.lbl_history_activity,
        style: AppTextStyle.heading1Bold,
      ),
    );
    const searchWidget = SearchHistoryWidget();

    final listHisTory = ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ActivityDayWidget();
      },
      itemCount: 2,
    );
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var size = MediaQuery.of(context).size;
        return SizedBox(
          height: size.height * 1.14,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [titlePage, searchWidget, listHisTory],
          ),
        );
      },
    );
  }
}
