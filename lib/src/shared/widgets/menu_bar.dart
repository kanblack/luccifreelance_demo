import 'package:demo_luci_web/injection_container.dart';
import 'package:demo_luci_web/src/shared/blocs_app/route_page_cubit/route_page_cubit.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../generated/l10n.dart';
import '../constants/colors_constants.dart';
import 'avatar_app_bar_widget.dart';

class MenuBarWidget extends StatelessWidget {
  const MenuBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = SizedBox(
      width: AppDimensPadding.normalPadding,
    );
    const paddingTiny = SizedBox(
      width: AppDimensPadding.normalPadding,
    );
    final logo = ResponsiveVisibility(
      visible: false,
      visibleWhen: const [Condition.largerThan(name: MOBILE)],
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(
              AppDimensPadding.smallPadding,
            ),
            decoration: BoxDecoration(
                color: logoBackground, borderRadius: BorderRadius.circular(15)),
            child: const Text(
              "Logo",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
    final projectManagerButton = ResponsiveRowColumnItem(
      child: TextButton(
        onPressed: () {
          getIt<RoutePageCubit>().showPageProjectManagement();
        },
        child: Text(
          S.current.lbl_project_management,
          style: AppTextStyle.appBarTitle.apply(color: textAppbar),
        ),
      ),
    );
    final centralizedDepartmentManagement = ResponsiveRowColumnItem(
      child: TextButton(
        onPressed: () {
          getIt<RoutePageCubit>().showPageCentralizedDepartmentManagement();
        },
        child: Text(
          S.current.lbl_centralized_department_management,
          style: AppTextStyle.appBarTitle.apply(color: textAppbar),
        ),
      ),
    );
    final centralizedHumanResourceManagement = ResponsiveRowColumnItem(
      child: TextButton(
        onPressed: () {
          getIt<RoutePageCubit>().showPageCentralizedHumanResourceManagement();
        },
        child: Text(
          S.current.lbl_centralized_human_resource_management,
          style: AppTextStyle.appBarTitle.apply(color: textAppbar),
        ),
      ),
    );
    final configuration = ResponsiveRowColumnItem(
      child: TextButton(
        onPressed: () {
          getIt<RoutePageCubit>().showPageConfiguration();
        },
        child: Text(
          S.current.lbl_configuration,
          style: AppTextStyle.appBarTitle.apply(color: textAppbar),
        ),
      ),
    );
    final responsiveProjectAndDepartment = ResponsiveRowColumn(
      layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      columnMainAxisAlignment: MainAxisAlignment.center,
      children: [projectManagerButton, centralizedDepartmentManagement],
    );
    final responsiveHumaneAndConfig = ResponsiveRowColumn(
      layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      columnMainAxisAlignment: MainAxisAlignment.center,
      children: [centralizedHumanResourceManagement, configuration],
    );
    const avatarUserWidget = ResponsiveVisibility(
      visible: false,
      visibleWhen: const [Condition.largerThan(name: MOBILE)],
      child: AvatarAppBarWidget(),
    );
    return Container(
      decoration: const BoxDecoration(color: appBarColor, boxShadow: [
        BoxShadow(color: shadowColor, offset: Offset(0, 2), blurRadius: 4)
      ]),
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensPadding.contentPadding,
          vertical: AppDimensPadding.smallPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          paddingTiny,
          logo,
          padding,
          responsiveProjectAndDepartment,
          padding,
          responsiveHumaneAndConfig,
          const Spacer(),
          avatarUserWidget
        ],
      ),
    );
  }
}
