import 'package:flutter/material.dart';
import 'package:internshala/gen/assets.gen.dart';
import 'package:internshala/ui/common/app_colors.dart';
import 'package:internshala/ui/common/ui_helpers.dart';
import 'package:internshala/ui/components/build_text_ui.dart';
import 'package:internshala/ui/components/primary_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class MultiCheckBoxFilterAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Color? appBarBackgroundColor;
  final bool? showBackButton;
  final void Function()? onBackButtonClick;
  final void Function()? onClearAllClick;
  final void Function()? onApplyClick;

  const MultiCheckBoxFilterAppBar({
    super.key,
    required this.title,
    this.appBarBackgroundColor,
    this.showBackButton,
    this.onClearAllClick,
    this.onApplyClick,
    this.onBackButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        hSpace(primaryHorizontalScreenPadding),
        if (showBackButton == true)
          IconButton(
              onPressed: () {
                if (onBackButtonClick != null) onBackButtonClick!();
              },
              icon: Image.asset(
                Assets.images.arrowLeft.path,
                width: 25,
              )),
        hSpace(10),
        buildTextUI(text: title, fontSize: appBarTitleFontSize, bold: true)
            .expand(),
        SizedBox(
            width: 80,
            height: 35,
            child: primaryButton(
                name: "Clear all",
                textColor: kcBlue,
                fontSize: 20,
                bold: false,
                onTap: onClearAllClick)),
        hSpace(20),
        SizedBox(
            width: 80,
            height: 35,
            child: primaryButton(
                name: "Apply",
                backgroundColor: kcLightBlue,
                textColor: kcWhite,
                onTap: onApplyClick)),
        hSpace(primaryHorizontalScreenPadding)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}
