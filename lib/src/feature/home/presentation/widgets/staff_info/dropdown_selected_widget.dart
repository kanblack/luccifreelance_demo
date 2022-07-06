import 'package:demo_luci_web/src/shared/constants/colors_constants.dart';
import 'package:demo_luci_web/src/shared/constants/dimens_constants.dart';
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

class DropDownSelectWidget extends StatefulWidget {
  const DropDownSelectWidget({Key? key}) : super(key: key);

  @override
  State<DropDownSelectWidget> createState() => _DropDownSelectWidgetState();
}

class _DropDownSelectWidgetState extends State<DropDownSelectWidget> {
  String? selectedValue;
  final List<String> items = [
    'Dừng Hoạt Động',
    'Đổi mật khẩu',
    'Xoá nhân sự',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.current.lbl_option,
              style: AppTextStyle.caption1.merge(const TextStyle(
                  color: textButton, fontWeight: FontWeight.bold)),
            ),
            const Icon(
              Icons.arrow_drop_down,
              size: AppDimens.iconSmallSize,
              color: textButton,
            )
          ],
        ),
        offset: const Offset(-80, 0),
        alignment: Alignment.bottomCenter,
        dropdownDecoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppDimensBorder.bottomSheetBorder)),
        items: [
          DropdownMenuItem<String>(
            value: items[0],
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                items[0],
                style: AppTextStyle.caption1,
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: items[1],
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                items[1],
                style: AppTextStyle.caption1,
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: items[2],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 1,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(items[2],
                          style: AppTextStyle.caption1.apply(
                            color: textButtonDelete,
                          ))),
                ))
              ],
            ),
          )
        ],
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        itemHeight: 48,
        // itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 160,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownElevation: 8,
        itemPadding: EdgeInsets.zero,
      ),
    );
  }
}
