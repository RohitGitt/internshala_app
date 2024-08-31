import 'package:flutter/material.dart';
import 'package:internshala/gen/assets.gen.dart';
import 'package:internshala/ui/common/ui_helpers.dart';
import 'package:internshala/ui/components/build_text_ui.dart';
import 'package:internshala/ui/components/dump_ui.dart';
import 'package:velocity_x/velocity_x.dart';

Widget buildJobInfoItemUI({
  String? title,
  String? comapanyName,
  String? hiringStatusLabel,
  String? companyLogoPath,
  String? location,
  String? startDate,
  String? duration,
  String? currency,
  String? salary,
  String? employmentType,
  String? posted,
  void Function()? onClickViewDetails,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(secondaryHorizontalScreenPadding),
    decoration: BoxDecoration(border: Border.all(width: 0.1)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHiringInfoUI(label: hiringStatusLabel),
        vSpace(10),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextUI(
                    text: title , fontSize: 25, bold: true),
                buildTextUI(
                  text: comapanyName,
                  fontSize: 18,
                )
              ],
            ).expand(),
            if (companyLogoPath != null)
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: imageLoadingUI(
                      url: companyLogoPath, width: 80, height: 40))
          ],
        ),
        vSpace(20),
        buildRowInfoWithLabelAndPrefixUI(
            iconPath: Assets.images.location.path, label: location),
        vSpace(20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildRowInfoWithLabelAndPrefixUI(
                    iconPath: Assets.images.start.path,
                    label: startDate)
                .expand(),
            buildRowInfoWithLabelAndPrefixUI(
                    iconPath: Assets.images.calendar.path,
                    label: duration)
                .expand(),
          ],
        ),
        vSpace(20),
        buildRowInfoWithLabelAndPrefixUI(
            iconPath: Assets.images.money.path,
            label: "${currency ?? "N/A"} ${salary ?? "N/A"}"),
        vSpace(20),
        buildTextWithContainer(text: employmentType),
        vSpace(20),
        buildRowInfoWithLabelAndPrefixUI(
            iconPath: Assets.images.watch.path, label: posted),
        vSpace(20),
        const Divider(
          thickness: 1,
          height: 0.5,
        ),
        // vSpace(10),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                if (onClickViewDetails != null) onClickViewDetails();
              },
              child:
                  buildTextUI(text: "View details", bold: true, fontSize: 15)),
        )
      ],
    ),
  );
}
