import 'package:dartz/dartz.dart' as Dartz;
import 'package:demo_luci_web/src/shared/constants/text_style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/themes/common.dart';
import '../constants/colors_constants.dart';
import '../constants/dimens_constants.dart';
import '../utils/valid_text_field.dart';

class CommonInputTextFormField extends StatefulWidget {
  final String hint;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final String? labelText;
  final TextInputType keyboardType;
  final GestureTapCallback? onSuffixIconTap;
  final GestureTapCallback? onPrefixIconTap;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onChanged;
  final OnValidate? onValidate;
  final TextEditingController controller;
  final bool? isSearch;
  final bool? isReadOnly;
  final double? borderRadius;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormat;
  const CommonInputTextFormField(
      {Key? key,
      required this.hint,
      this.prefixIconPath,
      this.suffixIconPath,
      this.labelText,
      this.keyboardType = TextInputType.text,
      this.onSuffixIconTap,
      this.onPrefixIconTap,
      required this.textInputAction,
      this.onChanged,
      this.onValidate,
      required this.controller,
      this.isReadOnly,
      this.borderRadius,
      this.focusNode,
      this.inputFormat,
      this.isSearch})
      : super(key: key);

  @override
  _CommonInputTextFormFieldState createState() =>
      _CommonInputTextFormFieldState();
}

class _CommonInputTextFormFieldState extends State<CommonInputTextFormField> {
  String? errorMessage;
  bool isReadOnly = false;
  bool isShowSuffixIcon = false;
  @override
  void initState() {
    if (widget.isReadOnly != null) {
      isReadOnly = widget.isReadOnly!;
    }
    widget.controller.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GestureDetector? prefixIcon;
    if (widget.suffixIconPath != null) {
      prefixIcon = GestureDetector(
          onTap: widget.onSuffixIconTap,
          child: SizedBox(
              height: AppDimens.buttonSize,
              child: SvgPicture.asset(
                widget.suffixIconPath!,
                fit: BoxFit.scaleDown,
              )));
    } else {
      prefixIcon = null;
    }
    final Widget? suffixIcon;
    if (widget.prefixIconPath != null && widget.isSearch != true) {
      suffixIcon = GestureDetector(
          onTap: widget.onPrefixIconTap,
          child: SizedBox(
              height: AppDimens.buttonSize,
              child: SvgPicture.asset(
                widget.prefixIconPath!,
                fit: BoxFit.scaleDown,
              )));
    } else if (widget.isSearch == true) {
      suffixIcon = const Icon(
        Icons.search,
        color: iconLockupColor,
        size: AppDimens.iconSmallSize,
      );
    } else {
      suffixIcon = null;
    }
    ;

    return Focus(
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          isShowSuffixIcon = true;
        } else {
          isShowSuffixIcon = false;
        }
        setState(() {});
      },
      child: TextFormField(
        autocorrect: false,
        inputFormatters: widget.inputFormat,
        validator: (value) {
          if (widget.onValidate != null && value != null) {
            return widget.onValidate!(value)
                .fold((l) => l.errorMessage, (r) => null);
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.disabled,
        readOnly: isReadOnly,
        focusNode: widget.focusNode,
        style: AppTextStyle.caption1.copyWith(fontSize: 12),
        cursorColor: textNormal,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(AppDimensPadding.tinyPadding),
            suffixIcon: !isReadOnly ? suffixIcon : null,
            prefixIcon: prefixIcon,
            errorText: errorMessage,
            errorMaxLines: AppDimensOther.maxLineErrorText,
            hintText: widget.hint,
            labelText: widget.labelText,
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius != null
                  ? BorderRadius.circular(widget.borderRadius ?? 0)
                  : borderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius != null
                  ? BorderRadius.circular(widget.borderRadius ?? 0)
                  : borderRadius,
            )),
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
          //validate(value);
        },
      ),
    );
  }

  void validate(String value) {
    Dartz.Either<Invalid, Valid> result = getValidateResult(value);
    setState(() {
      errorMessage =
          result.fold((invalid) => invalid.errorMessage, (valid) => null);
    });
  }

  Dartz.Either<Invalid, Valid> getValidateResult(String value) {
    if (widget.onValidate != null) {
      return widget.onValidate!(value);
    }
    return Dartz.Right(Valid());
  }
}
