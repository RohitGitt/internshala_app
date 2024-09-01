import 'package:flutter/material.dart';
import 'package:internshala/ui/common/app_colors.dart';
import 'package:internshala/core/components/build_text_ui.dart';

Widget primaryButton({
  String? name,
  double? fontSize,
  bool? bold,
  double? width,
  Color? backgroundColor,
  Color? borderColor,
  Color? textColor,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      // width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: borderColor != null ? Border.all(color: borderColor) : null,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Align(
          alignment: Alignment.center,
          child: buildTextUI(
            text: name,
            bold: bold ?? true,
            textColor: textColor,
            fontSize: fontSize,
          )),
    ),
  );
}

Widget primaryTextField(
    {String? label,
    TextEditingController? controller,
    FocusNode? focusNode,
    void Function(String newValue)? onChanged,
    Color? labelColor,
    double? labelFontSize,
    FontWeight? labelWeight,
    int? maxLines,
    Widget? suffixWidget,
    FloatingLabelBehavior? floatingLabelBehavior,
    InputBorder? enableBorder,
    InputBorder? focusBorder}) {
  return TextFormField(
    controller: controller,
    focusNode: focusNode,
    onChanged: onChanged,
    maxLines: maxLines ?? 1,
    decoration: InputDecoration(
        suffix: suffixWidget,
        labelStyle: const TextStyle(overflow: TextOverflow.ellipsis),
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.always,
        label: buildTextUI(
            text: label, textColor: labelColor, fontWeight: labelWeight ?? FontWeight.w500 , fontSize: labelFontSize),
        enabledBorder: enableBorder ??
            const OutlineInputBorder(
                borderSide: BorderSide(color: kcBlue, width: 1)),
        focusedBorder: focusBorder ??
            const OutlineInputBorder(
                borderSide: BorderSide(color: kcBlue, width: 1))),
  );
}
