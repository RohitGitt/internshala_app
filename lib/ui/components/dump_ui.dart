import 'package:flutter/material.dart';
import 'package:internshala/app/app.logger.dart';
import 'package:internshala/gen/assets.gen.dart';
import 'package:internshala/ui/common/app_colors.dart';
import 'package:internshala/ui/common/ui_helpers.dart';
import 'package:internshala/ui/components/build_text_ui.dart';
import 'package:internshala/ui/views/filter/model/check_box_model.dart';
import 'package:internshala/ui/views/internships/model/Internship.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

Widget buildCustomText(
    {String? title,
    double? height,
    Color? titleColor,
    double? titleFontSize,
    int? count,
    void Function()? onTap,
    Color? backgroundColor,
    Color? borderColor,
    double? borderRadius,
    Color? suffixIconColor,
    Color? prefixIconColor,
    double? hPad,
    double? vPad,
    String? prefix,
    String? suffix,
    bool? showAleastText,
    void Function()? onPrefixIconClick,
    void Function()? onSuffixIconClick}) {
  return InkWell(
    onTap: () {
      if (onTap != null) {
        onTap();
      }
    },
    child: FittedBox(
      child: Container(
        height: height ?? 40,
        padding:
            EdgeInsets.symmetric(horizontal: hPad ?? 10, vertical: vPad ?? 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: borderColor != null ? Border.all(color: borderColor) : null,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 5),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showAleastText == true)
                buildTextUI(
                    text: "Atleast ",
                    textColor: titleColor,
                    bold: true,
                    fontSize: 17),
              if (prefix != null)
                InkWell(
                    onTap: () {
                      if (onPrefixIconClick != null) {
                        onPrefixIconClick();
                      }
                    },
                    child: Image.asset(
                      prefix,
                      width: 20,
                      color: prefixIconColor,
                    )).pOnly(top: 3),
              if (prefix != null) hSpace(3),
              buildTextUI(
                  text: title,
                  textColor: titleColor,
                  // bold: true,
                  fontWeight: FontWeight.w400,
                  fontSize: titleFontSize ?? 17),
              hSpace(5),
              if (suffix != null)
                InkWell(
                    onTap: () {
                      if (onSuffixIconClick != null) {
                        onSuffixIconClick();
                      }
                    },
                    child: Image.asset(
                      suffix,
                      width: 15,
                      height: 10,
                      color: suffixIconColor,
                      fit: BoxFit.contain,
                    ).pOnly(top: 5)),
              if (count != null)
                VxCircle(
                  radius: 20,
                  child: Align(
                      alignment: Alignment.center,
                      child: buildTextUI(
                          text: count.toString(),
                          fontSize: 10,
                          bold: true,
                          textColor: kcWhite)),
                ).pOnly(top: 3),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildHiringInfoUI({
  String? label,
}) {
  return Container(
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        borderRadius: const BorderRadius.all(Radius.circular(5))),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          Assets.images.upwardSign.path,
          width: 20,
          color: kcBlue,
        ),
        hSpace(10),
        buildTextUI(text: label)
      ],
    ),
  );
}

Widget imageLoadingUI(
    {required String url,
    bool? returnNullOnError,
    double? width,
    double? height}) {
  return Image.network(
    url,
    width: width,
    height: height,
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) {
        return child;
      } else {
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ),
        );
      }
    },
    errorBuilder:
        (BuildContext context, Object exception, StackTrace? stackTrace) {
      return Image.asset(
        Assets.images.errorMark.path,
        width: width,
        height: height,
        fit: BoxFit.fill,
      );
    },
    fit: BoxFit.cover, // You can set the fit according to your needs
  );
}

Widget buildRowInfoWithLabelAndPrefixUI(
    {required String iconPath, String? label}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 15,
        height: 15,
        child: Image.asset(iconPath),
      ),
      hSpace(10),
      buildTextUI(text: label)
    ],
  );
}

Widget buildTextWithContainer(
    {String? text, Color? backgroundColor, double? hPad, double? vPad}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: hPad ?? 10, vertical: vPad ?? 5),
    decoration: BoxDecoration(
        color: backgroundColor ?? kcVeryLightBlack,
        borderRadius: const BorderRadius.all(Radius.circular(5))),
    child: buildTextUI(text: text),
  );
}

Widget buildAddButton({String? title, void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.add,
          color: kcBlue,
        ),
        hSpace(15),
        buildTextUI(
            text: title,
            textColor: kcBlue,
            fontSize: 17,
            fontWeight: FontWeight.w500)
      ],
    ),
  );
}

Widget buildCheckBox(
    {String? label,
    double? labelFontSize,
    required bool value,
    double? midPad,
    void Function()? onTap,
    void Function(bool?)? onChanged}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // CheckboxListTile(value: value, onChanged: onChanged),
        Checkbox(
          value: value,
          onChanged: (value) {
            if (onTap != null) onTap();
          },
        ),
        hSpace(midPad ?? 5),
        buildTextUI(text: label, fontSize: labelFontSize)
      ],
    ),
  );
}

Widget buildLabel({String? label}) {
  return buildTextUI(
      text: label,
      textColor: kcLightBlack,
      fontWeight: FontWeight.w500,
      fontSize: 15);
}

Widget buildBoxInput({
  String? label,
  String? hintText,
  String? suffixIcon,
  bool? showHintTextAsInput,
  void Function()? onTap,
  void Function()? onHintTextSuffixTap,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (label != null) buildLabel(label: label),
      if (label != null) vSpace(10),
      InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(width: 0.1),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(showHintTextAsInput == true) 
              Container(
                height: 38,
                padding: EdgeInsets.symmetric(horizontal: 5 , vertical: 0),
                decoration: BoxDecoration(
                  // color: showHintTextAsInput == true ? kcBlue : null,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: buildCustomText(title:hintText , titleColor: showHintTextAsInput == false ? kcBlack: kcWhite , backgroundColor: showHintTextAsInput == true ? kcBlue : kcWhite ,
                 titleFontSize: 15 ,  
                 
                onSuffixIconClick: () {
                  if(onHintTextSuffixTap != null){
                    onHintTextSuffixTap();
                  }
                },
                suffix: showHintTextAsInput == true ? Assets.images.dismiss.path : null ,
                suffixIconColor: showHintTextAsInput == true ? kcWhite : null
                )
                ),
              if(showHintTextAsInput != true)
                buildTextUI(text: hintText, textColor: kcLightBlack, fontSize: 15 , ),
              
              if (suffixIcon != null)
                Image.asset(
                  suffixIcon,
                  width: 20,
                )
            ],
          ),
        ),
      )
    ],
  );
}

Widget builFiltersCheckBox({
  required String? label,
  required bool checked,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(mainAxisSize: MainAxisSize.min, children: [
      buildCheckBox(
        label: label,
        labelFontSize: 15,
        value: checked,
        onTap: onTap,
        onChanged: (p0) {
          onTap!();
        },
      ),
      hSpace(10),
      Image.asset(
        Assets.images.circularQuestionMark.path,
        width: 20,
      )
    ]),
  );
}

Widget buildPromotionAdWidget({PromotionAdData? item, void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.symmetric(
          horizontal: primaryHorizontalScreenPadding * 2),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            vSpace(20),
            buildTextUI(
                text: item?.promotionAdData?.title ?? "",
                bold: true,
                fontSize: 20),
            vSpace(20),
            buildTextUI(text: item?.promotionAdData?.description ?? ""),
            vSpace(10)
          ],
        ),
      ),
    ),
  );
}

Widget buildTrainingOrCetificateAdWidget(
    {TrainingAdData? item, void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.symmetric(
          horizontal: primaryHorizontalScreenPadding * 2),
      decoration: BoxDecoration(border: Border.all()),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            vSpace(20),
            buildTextUI(
                text: item?.trainingAdData?.title ?? "",
                bold: true,
                fontSize: 20),
            vSpace(20),
            buildTextUI(text: item?.trainingAdData?.description ?? ""),
            vSpace(10)
          ],
        ),
      ),
    ),
  );
}

Widget buildNoDataToShowUI() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      buildTextUI(text: "No Data To Show"),
      Image.asset(
        Assets.images.noData.path,
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      )
    ],
  );
}


 Widget buildRowFilterItemUI({ required List<CheckBoxModel> data , void Function(CheckBoxModel item)? onDismissTap}){
    return   Container(
                        height: 35,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return buildCustomText(
                              title: data[index].fieldName,
                              borderColor: kcWhite,
                              titleFontSize: 15,
                              backgroundColor: kcBlue,
                              suffix: Assets.images.dismiss.path,
                              titleColor: kcWhite,
                              suffixIconColor: kcWhite,
                              onSuffixIconClick: () {
                                if(onDismissTap != null){
                                  getLogger("click is ").i("Click is invoking ");
                                  onDismissTap(data[index]);
                                }
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return hSpace(5);
                          },
                        ),
  );
  }