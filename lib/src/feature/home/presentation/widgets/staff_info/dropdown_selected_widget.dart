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
        offset: Offset(-20, 0),
        isExpanded: true,
        alignment: Alignment.bottomCenter,
        icon: Container(),
        buttonPadding: EdgeInsets.zero,
        dropdownPadding: EdgeInsets.zero,
        itemPadding: const EdgeInsets.symmetric(
            horizontal: AppDimensPadding.contentPadding),
        dropdownDecoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppDimensBorder.bottomSheetBorder)),
        hint: Text(
          S.current.lbl_option,
          style: AppTextStyle.caption1.merge(
              const TextStyle(color: appBarColor, fontWeight: FontWeight.bold)),
        ),
        items: [
          DropdownMenuItem<String>(
            value: items[0],
            child: Text(
              items[0],
              style: AppTextStyle.caption1,
            ),
          ),
          DropdownMenuItem<String>(
            value: items[1],
            child: Text(
              items[1],
              style: AppTextStyle.caption1,
            ),
          ),
          const DropdownMenuItem<Divider>(
              enabled: false, child: SizedBox(height: 1, child: Divider())),
          DropdownMenuItem<String>(
            value: items[2],
            child: Text(items[2],
                style: AppTextStyle.caption1.apply(color: textButtonDelete)),
          )
        ],
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        buttonWidth: 100,
      ),
    );
  }
}
