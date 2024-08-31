import 'package:flutter/material.dart';
import 'package:internshala/app/app.locator.dart';
import 'package:internshala/gen/assets.gen.dart';
import 'package:internshala/services/EasyLoader/easy_loader.service.dart';
import 'package:internshala/ui/common/app_colors.dart';
import 'package:internshala/ui/common/app_strings.dart';
import 'package:internshala/ui/common/ui_helpers.dart';
import 'package:internshala/ui/components/build_job_info_item_ui.dart';
import 'package:internshala/ui/components/build_text_ui.dart';
import 'package:internshala/ui/components/custom_app_bar.dart';
import 'package:internshala/ui/components/dump_ui.dart';
import 'package:internshala/ui/views/internships/components/search_appbar.dart';
import 'package:internshala/ui/views/internships/internships_view.form.dart';
import 'package:internshala/ui/views/internships/model/Internship.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:velocity_x/velocity_x.dart';

import 'internships_viewmodel.dart';

@FormView(fields: [FormTextField(name: "search")])
class InternshipsView extends StackedView<InternshipsViewModel>
    with $InternshipsView {
  final Future<bool> Function()? onBack;
  const InternshipsView({Key? key, this.onBack}) : super(key: key);

  @override
  void onViewModelReady(InternshipsViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(InternshipsViewModel viewModel) {
    disposeForm();
    viewModel.filterStateModel.reset();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    InternshipsViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: viewModel.showSearchBar != true
            ? CustomAppBar(
                title: InternshipsViewConsts.ksAppBarTitle,
                showSearchIcon: true,
                onClickSearch: () {
                  viewModel.setShowSearchBar(true);
                },
              )
            : null,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (viewModel.showSearchBar == true)
              Container(
                height: appBarHeight / 2,
                width: double.infinity,
                child: SearchAppBar(
                  controller: searchController,
                  focusNode: searchFocusNode,
                  showBackButton: true,
                  labelColor: kcLightBlack,
                  showCrossIcon: viewModel.showSearchBarDismissIcon,
                  onClickDismiss: () {
                    searchController.text = "";
                    viewModel.notifyListeners();
                  },
                  onChanged: (value) {
                    viewModel.performFilters();
                    viewModel.rebuildUi();
                  },
                  onBackButtonClick: () {
                    viewModel.setShowSearchBar(false);
                  },
                ),
              ),
            if (viewModel.showSearchBar == true) vSpace(15),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: primaryHorizontalScreenPadding),
              width: double.infinity,
              height: context.safePercentHeight * 11,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  viewModel.getFilters?.isNotEmpty == true
                      ? Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildCustomText(
                              title: InternshipsViewConsts.ksFilter,
                              count: viewModel.getFilters?.length,
                              borderRadius: 20,
                              titleColor: kcBlue,
                              borderColor: kcBlue,
                              onTap: () {
                                viewModel.goToFilterScreen();
                              },
                            ),
                            hSpace(10),
                            Container(
                              width: double.infinity,
                              height: 40,
                              child: ListView.separated(
                                itemCount: viewModel.getFilters!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final data = viewModel.getFilters![index];
                                  return buildCustomText(
                                    title: viewModel.getFilterValue(data),
                                    borderRadius: 20,
                                    borderColor: kcBlack,
                                    suffix: Assets.images.dismiss.path,
                                    onSuffixIconClick: () {
                                      viewModel.onDismissFilterItemClick(data);
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return hSpace(10);
                                },
                              ),
                            ).expand(),
                          ],
                        )
                      : buildCustomText(
                          title: InternshipsViewConsts.ksFilter,
                          borderRadius: 20,
                          prefix: Assets.images.filter.path,
                          prefixIconColor: kcBlue,
                          borderColor: kcBlue,
                          titleColor: kcBlue,
                          onTap: () {
                            viewModel.goToFilterScreen();
                          },
                        ),
                  vSpace(10),
                  Align(
                    child: buildTextUI(
                        text: viewModel.getFilters?.isNotEmpty == true
                            ? "${viewModel.internshipCounts} internships matching filters"
                            : "${viewModel.internshipCounts} total internships",
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            const Divider(),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: viewModel.dataList.isEmpty && !viewModel.isBusy
                  ? Center(
                      child: buildNoDataToShowUI(),
                    )
                  : ListView.separated(
                      itemCount: viewModel.dataList.length,
                      itemBuilder: (context, index) {
                        return _getView(viewModel.dataList[index], viewModel);
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 10,
                          color: kcVeryLightBlack,
                        );
                      },
                    ),
            ).expand()
          ],
        ),
      ),
    );
  }

  @override
  InternshipsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InternshipsViewModel();

  Widget _getView(Internship item, InternshipsViewModel viewModel) {
    if (item is InternshipData) {
      final data = item.internships;
      return GestureDetector(
        onTap: () {
          locator<EasyLoadingService>()
              .showSuccessToast(title: "Click not implemented yet");
        },
        child: buildJobInfoItemUI(
          title: data?.profileName ?? "N/A",
          comapanyName: data?.companyName ?? "N/A",
          hiringStatusLabel:
              "Activily Hiring", // here correct field need to bind
          companyLogoPath: InternshipsViewConsts
              .ksDummyImageUrl, //  here correct field need to bind
          location: data?.locationNames?.join(", ") ?? "N/A",
          startDate: data?.startDate,
          duration: data?.duration,
          currency: data?.stipend?.currency,
          salary: data?.stipend?.salary,
          employmentType: data?.employmentType,
          posted: data?.postedOn,
          onClickViewDetails: () {
            viewModel.goToViewDetailsView();
          },
        ),
      );
    } else if (item is PromotionAdData) {
      return buildPromotionAdWidget(
        item: item,
        onTap: () {
          locator<EasyLoadingService>()
              .showSuccessToast(title: "Click not implemented yet");
        },
      );
    } else if (item is TrainingAdData) {
      return buildTrainingOrCetificateAdWidget(
          item: item,
          onTap: () {
            locator<EasyLoadingService>()
                .showSuccessToast(title: "Click not implemented yet");
          });
    } else {
      throw Exception("Unsupported Data item passed");
    }
  }


}
