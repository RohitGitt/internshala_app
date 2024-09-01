import 'package:flutter/material.dart';
import 'package:internshala/gen/assets.gen.dart';
import 'package:internshala/ui/common/app_colors.dart';
import 'package:internshala/ui/common/app_strings.dart';
import 'package:internshala/ui/common/ui_helpers.dart';
import 'package:internshala/core/components/custom_app_bar.dart';
import 'package:internshala/core/components/dump_ui.dart';
import 'package:internshala/core/components/primary_widgets.dart';
import 'package:internshala/utility/helper_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import 'filter_viewmodel.dart';
class FilterView extends StackedView<FilterViewModel> {
  const FilterView({
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FilterViewModel viewModel,
    Widget? child,
  ) {
    return PopScope(
      onPopInvoked:(didPop) {
        if(didPop){
          if(viewModel.shouldResetFilterState){
            viewModel.reset();
          }

        }
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: CustomAppBar(
              title: FilterViewConsts.ksAppBarTitle,
              showSearchIcon: false,
              showBackButton: true,
              onBackButtonClick: () {
                viewModel.onBackButtonClick();
              },
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 9,
                      child: Container(
                        padding: const EdgeInsets.all(
                            secondaryHorizontalScreenPadding),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildLabel(label: FilterViewConsts.ksProfile),
                              if (viewModel.profilesFilters.isNotEmpty)
                                vSpace(10),
                              if (viewModel.profilesFilters.isNotEmpty)
                                buildRowFilterItemUI(
                                  data: viewModel.profilesFilters,
                                  onDismissTap: (item) {
                                    viewModel.onDismissProfilesFilterItem(item);
                                  },
                                ),
                              vSpace(10),
                              buildAddButton(
                                title: FilterViewConsts.ksAddProfile,
                                onTap: () {
                                  viewModel.goToProfileFilterScreen();
                                },
                              ),
                              vSpace(20),
                              buildLabel(label: FilterViewConsts.ksCity),
                              if (viewModel.citiesFilters.isNotEmpty) vSpace(10),
                              if (viewModel.citiesFilters.isNotEmpty)
                                buildRowFilterItemUI(
                                  data: viewModel.citiesFilters,
                                  onDismissTap: (item) {
                                    viewModel.onDismissCitiesFilterItem(item);
                                  },
                                ),
                              vSpace(10),
                              buildAddButton(
                                title: FilterViewConsts.ksAddCity,
                                onTap: () {
                                  viewModel.goToCityFilterScreen();
                                },
                              ),
                              vSpace(20),
                              buildLabel(label:FilterViewConsts.ksInternshipType ),
                              vSpace(10),
                              if (viewModel.filterStateModel.internshipsType.isNotEmpty)
                                Container(
                                  width: double.infinity,
                                  height: 100,
                                  child: ListView(
                                    children: viewModel
                                        .filterStateModel.internshipsType
                                        .map((item) => buildCheckBox(
                                              label: item.fieldName,
                                              value: item.isChecked,
                                              onTap: () {
                                                viewModel.onInternshipFilterClick(
                                                    item);
                                              },
                                            ))
                                        .toList(),
                                  ),
                                ),
                              vSpace(20),
                              buildLabel(label: FilterViewConsts.ksMonthlyStipend),
                              vSpace(20),
                              if (viewModel.filterStateModel.monthlyStipends
                                      .isNotEmpty )
                                Wrap(
                                  spacing: 15,
                                  runSpacing: 15,
                                  children: viewModel
                                      .filterStateModel.monthlyStipends
                                      .mapIndexed((monthlyStipendModel, index) =>
                                          buildCustomText(
                                            title: monthlyStipendModel.stipend
                                                .toString(),
                                            prefix:
                                                Assets.images.indianRupee.path,
                                            prefixIconColor:
                                                monthlyStipendModel.isSelected ==
                                                        true
                                                    ? kcWhite
                                                    : kcBlue,
                                            borderRadius: 20,
                                            borderColor:
                                                monthlyStipendModel.isSelected !=
                                                        true
                                                    ? kcBlue
                                                    : kcWhite,
                                            titleColor:
                                                monthlyStipendModel.isSelected ==
                                                        true
                                                    ? kcWhite
                                                    : kcBlue,
                                            showAleastText:
                                                monthlyStipendModel.isSelected,
                                            hPad: 10,
                                            backgroundColor:
                                                monthlyStipendModel.isSelected ==
                                                        true
                                                    ? kcBlue
                                                    : kcWhite,
                                            onTap: () {
                                              viewModel
                                                  .onMonthlySpipendFilterItemClick(
                                                      monthlyStipendModel);
                                            },
                                          ))
                                      .toList(),
                                ),
                              vSpace(20),
                              Container(
                                height: 100,
                                child: 
                                    buildBoxInput(
                                      label: FilterViewConsts.ksStartingFromOrAfter,
                                      hintText: viewModel.filterStateModel.startingFromDateOrAfter!=null ? dateTimeToString(viewModel.filterStateModel.startingFromDateOrAfter) : FilterViewConsts.ksChooseDate,
                                      showHintTextAsInput: viewModel.filterStateModel.startingFromDateOrAfter!= null ? true : false,
                                      suffixIcon: Assets.images.calendar.path,
                                      onTap: () {
                                        viewModel.showDatePickerUI(context);
                                      },
                                      onHintTextSuffixTap: () {
                                        viewModel.filterStateModel.resetStartingFromDateOrAfter();
                                        viewModel.notifyListeners();
                                      },
                                    ),
                                   
                                  
                              ),
                              vSpace(10),
                              Container(
                                key: viewModel.maxDurationInMonthsKey,
                                child: buildBoxInput(
                                  label: FilterViewConsts.ksMaximumDurationInMonths,
                                  hintText: viewModel.filterStateModel.maxDurationInMonths != null ? viewModel.filterStateModel.maxDurationInMonths.toString(): FilterViewConsts.ksChooseDuration,
                                  showHintTextAsInput: viewModel.filterStateModel.maxDurationInMonths != null ? true : false,
                                  suffixIcon: Assets.images.downArrow.path,
                                  onHintTextSuffixTap: () {
                                     viewModel.filterStateModel.resetMaxDurationInMonths();
                                        viewModel.notifyListeners();
                                  },
                                  onTap: () {
                                    viewModel.showSelectMaximumDurationInMonthsDialog();
                                  },
                                ),
                              ),
                              vSpace(20),
                              buildLabel(label: FilterViewConsts.ksMoreFilters),
                              vSpace(20),
                              if (viewModel.filterStateModel.moreFilters
                                      .isNotEmpty )
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  child: ListView(
                                    children: viewModel
                                        .filterStateModel.moreFilters
                                        .mapIndexed((moreFiltersItem, index) =>
                                            builFiltersCheckBox(
                                              label: moreFiltersItem.fieldName,
                                              checked: moreFiltersItem.isChecked,
                                              onTap: () {
                                                viewModel.onMoreFiltersItemClick(
                                                    moreFiltersItem);
                                              },
                                            ))
                                        .toList(),
                                  ),
                                )
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: primaryHorizontalScreenPadding * 2,
                            vertical: primaryPadding),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            primaryButton(
                              name: FilterViewConsts.ksClearAll,
                              textColor: kcBlue,
                              backgroundColor: kcWhite,
                              borderColor: kcBlue,
                              onTap: () {
                                viewModel.onClearAllButtonClick();
                              },
                            ).expand(),
                            hSpace(20),
                            primaryButton(
                              name: FilterViewConsts.ksApply,
                              textColor: kcWhite,
                              backgroundColor: kcBlue,
                              borderColor: kcBlue,
                              onTap: () {
                                viewModel.onApplyButtonClick();
                              },
                            ).expand()
                          ],
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }

  @override
  FilterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FilterViewModel();
}