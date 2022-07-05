import 'package:demo_luci_web/src/shared/constants/colors_constants.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AvatarAppBarWidget extends StatefulWidget {
  const AvatarAppBarWidget({Key? key}) : super(key: key);

  @override
  State<AvatarAppBarWidget> createState() => _AvatarAppBarWidgetState();
}

class _AvatarAppBarWidgetState extends State<AvatarAppBarWidget> {
  final smallPadding = SizedBox(
    width: AppDimensPadding.smallPadding,
  );
  final iconNotification = ResponsiveVisibility(
    visible: false,
    visibleWhen: const [Condition.largerThan(name: MOBILE)],
    child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_none_outlined,
          color: Colors.white,
        )),
  );
  final avatar = CircleAvatar(
    radius: AppAvatarSize.smallSize,
    backgroundColor: Colors.blue,
  );
  final userName = ResponsiveVisibility(
    visible: false,
    visibleWhen: const [Condition.largerThan(name: MOBILE)],
    child: Text(
      "Chu tiến Long",
      style: AppTextStyle.caption1.apply(color: AppColors.textAppbar),
    ),
  );
  final buttonDropDown = ResponsiveVisibility(
    visible: false,
    visibleWhen: const [Condition.largerThan(name: MOBILE)],
    child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        )),
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        iconNotification,
        avatar,
        smallPadding,
        userName,
        buttonDropDown
      ],
    );
  }
}
