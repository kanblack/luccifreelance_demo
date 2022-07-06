import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../shared/component/input_text_field.dart';
import '../../../../../shared/constants/colors_constants.dart';
import '../../../../../shared/constants/dimens_constants.dart';

class SearchHistoryWidget extends StatefulWidget {
  const SearchHistoryWidget({Key? key}) : super(key: key);

  @override
  State<SearchHistoryWidget> createState() => _SearchHistoryWidgetState();
}

class _SearchHistoryWidgetState extends State<SearchHistoryWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const smallPadding = SizedBox(
      width: AppDimensPadding.smallPadding,
    );
    final title = SizedBox(
      child: Text(
        S.current.lbl_search_action,
        style: AppTextStyle.caption1,
      ),
    );
    final fieldSearch = SizedBox(
      height: AppDimens.heightFieldSearch,
      width: AppDimens.widthFieldSearch,
      child: CommonInputTextFormField(
        controller: searchController,
        textInputAction: TextInputAction.done,
        hint: '',
        isSearch: true,
      ),
    );
    final time = SizedBox(
      child: Text(
        S.current.lbl_time,
        style: AppTextStyle.caption1,
      ),
    );
    final buttonAll = ResponsiveRowColumnItem(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              time,
              smallPadding,
              Text(
                S.current.lbl_all,
                style: AppTextStyle.body1Medium.apply(color: textButton),
                overflow: TextOverflow.ellipsis,
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: textButton,
                size: AppDimens.iconSmallSize,
              )
            ],
          ),
        ),
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensPadding.contentPadding,
          vertical: AppDimensPadding.contentPadding),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [title, smallPadding, fieldSearch, smallPadding, buttonAll],
      ),
    );
  }
}
