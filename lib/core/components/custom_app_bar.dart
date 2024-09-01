import 'package:flutter/material.dart';
import 'package:internshala/gen/assets.gen.dart';
import 'package:internshala/ui/common/ui_helpers.dart';
import 'package:internshala/core/components/build_text_ui.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? appBarBackgroundColor;
  final bool? showSearchIcon;
  final bool? showBackButton;
  final void Function()? onClickDrawer;
  final void Function()? onClickSearch;
  final void Function()? onBackButtonClick;

  const CustomAppBar({
    super.key,
    required this.title,
    this.appBarBackgroundColor,
    this.showSearchIcon,
    this.showBackButton,
    this.onClickDrawer,
    this.onClickSearch,
    this.onBackButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        hSpace(10),
        showBackButton == true
            ? IconButton(
                onPressed: () {
                  if (onBackButtonClick != null) onBackButtonClick!();
                },
                icon: Image.asset(
                  Assets.images.arrowLeft.path,
                  width: 25,
                )

                
                )
            : IconButton(
                onPressed: () {
                  if (onClickDrawer != null) onClickDrawer!();
                },
                icon: Image.asset(
                  Assets.images.drawer.path,
                  width: 25,
                )),
        hSpace(10),
        buildTextUI(text: title, fontSize: appBarTitleFontSize, bold: true)
            .expand(),
        if (showSearchIcon == true)
          IconButton(
              onPressed: () {
                if(onClickSearch != null){
                  onClickSearch!();
                }
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}
