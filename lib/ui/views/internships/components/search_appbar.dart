
import 'package:flutter/material.dart';
import 'package:internshala/gen/assets.gen.dart';
import 'package:internshala/ui/common/app_colors.dart';
import 'package:internshala/ui/common/ui_helpers.dart';
import 'package:internshala/ui/components/primary_widgets.dart';

class SearchAppBar extends StatelessWidget {

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? appBarBackgroundColor;
  final Color? labelColor;
  final bool? showCrossIcon;
  final bool? showBackButton;
  final void Function()? onClickDismiss;
  final void Function()? onBackButtonClick;
  final void Function(String value)? onChanged;

  const SearchAppBar({
    Key? key,
    this.controller,
    this.focusNode,
    this.labelColor,
    this.onChanged,
    this.appBarBackgroundColor,
    this.showCrossIcon,
    this.showBackButton,
    this.onClickDismiss,
    this.onBackButtonClick,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: const EdgeInsets.symmetric(horizontal: primaryHorizontalScreenPadding ),
      color: appBarBackgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (showBackButton == true)
            IconButton(
              onPressed: () {
                if (onBackButtonClick != null) onBackButtonClick!();
              },
              icon: Image.asset(
                Assets.images.arrowLeft.path,
                width: 25,
              ),
            ),
            hSpace(10),
          Expanded(
            flex: 1,
            child: primaryTextField(
              label: "Category, Location or Company",
              controller: controller,
              focusNode: focusNode,
              focusBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kcLightBlack , width: 0.3)
              ),
              labelColor: labelColor,
              labelWeight: FontWeight.w400,
              labelFontSize: 17,
              maxLines: 1,
              enableBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kcLightBlack , width: 0.3)

              ),
              suffixWidget: showCrossIcon == true ? IconButton(
                padding: EdgeInsets.only(top: 20),
                iconSize: 30,
              onPressed: () {
                if (onClickDismiss != null) onClickDismiss!();
              },
              icon: Image.asset(Assets.images.dismiss.path , width: 15,),
            ): null ,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              onChanged: onChanged,
            ),
          ),
          
        ],
      ),
    );
  }


}