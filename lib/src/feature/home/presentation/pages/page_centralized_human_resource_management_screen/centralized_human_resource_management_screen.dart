import 'package:demo_luci_web/src/feature/home/data/models/staff_info_responsive.dart';
import 'package:demo_luci_web/src/shared/constants/colors_constants.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../injection_container.dart';
import '../../../../../shared/component/app_dialog.dart';
import '../../../data/models/time_line_responsive.dart';
import '../../../domain/entities/group_time_line.dart';
import '../../../domain/entities/staff_info.dart';
import '../../../domain/entities/time_line.dart';
import '../../blocs/centralized_human_resource_management_bloc.dart';
import '../../widgets/staff_history_active/history_activity_widget.dart';
import '../../widgets/staff_info/staff_info_widget.dart';
import '../../widgets/work_info/work_info_and_project_info_widget.dart';

class CentralizedHumanResourceManagementScreen extends StatelessWidget {
  const CentralizedHumanResourceManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CentralizedHumanResourceManagementBloc>(
      create: (context) => getIt<CentralizedHumanResourceManagementBloc>(),
      child: const CentralizedHumanResourceManagementStateScreen(),
    );
  }
}

class CentralizedHumanResourceManagementStateScreen extends StatefulWidget {
  const CentralizedHumanResourceManagementStateScreen({Key? key})
      : super(key: key);

  @override
  State<CentralizedHumanResourceManagementStateScreen> createState() =>
      _CentralizedHumanResourceManagementStateScreenState();
}

class _CentralizedHumanResourceManagementStateScreenState
    extends State<CentralizedHumanResourceManagementStateScreen> {
  StaffInfo? staffInfo;
  List<GroupTimeLine>? timeLine;

  @override
  void initState() {
    context
        .read<CentralizedHumanResourceManagementBloc>()
        .add(RequestGetStaffInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const paddingLeftTitle = SizedBox(
      width: AppDimensPadding.largePadding,
    );
    final titlePage = BlocBuilder<CentralizedHumanResourceManagementBloc,
        CentralizedHumanResourceManagementState>(
      builder: (context, state) {
        return Container(
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
                staffInfo?.getStaffName() ?? "",
                style: AppTextStyle.body1,
              )
            ],
          ),
        );
      },
    );
    return BlocConsumer<CentralizedHumanResourceManagementBloc,
        CentralizedHumanResourceManagementState>(
      listener: (context, state) async {
        if (state is GetStaffInfoSuccess) {
          staffInfo = state.staffInfo;
          context
              .read<CentralizedHumanResourceManagementBloc>()
              .add(RequestGetTimeLineEvent());
        } else if (state is GetTimeLineSuccess) {
          timeLine = state.list;
        } else if (state is Failure) {
          context
              .read<CentralizedHumanResourceManagementBloc>()
              .add(ChangeState());
          await showErrDialogApp(
              context: context,
              title: 'Opp!',
              content: state.message,
              defaultActionText: 'Ok');
        }
      },
      builder: (context, state) {
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
                children: [
                  Flexible(
                      flex: 2,
                      child: StaffInfoWidget(
                        staffInfo: staffInfo,
                      )),
                  Flexible(
                      flex: 4,
                      child: HistoryActivityWidget(
                        timeLine: timeLine,
                      )),
                  Flexible(
                      flex: 2,
                      child: WorkInfoAndProjectInfoWidget(
                        staffInfo: staffInfo,
                      )),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}