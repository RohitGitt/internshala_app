import 'package:flutter/material.dart';
import 'package:internshala/ui/common/app_colors.dart';
import 'package:internshala/ui/common/ui_helpers.dart';
import 'package:internshala/ui/components/dump_ui.dart';
import 'package:internshala/ui/components/primary_widgets.dart';
import 'package:internshala/ui/views/multi_checkbox_filter/components/multi_checkbox_filter_appbar.dart';
import 'package:internshala/ui/views/multi_checkbox_filter/multi_checkbox_filter_view.form.dart';
import 'package:internshala/utility/enum_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'multi_checkbox_filter_viewmodel.dart';

@FormView(fields: [FormTextField(name: "search")])
class MultiCheckboxFilterView extends StackedView<MultiCheckboxFilterViewModel>
    with $MultiCheckboxFilterView {
  final String? appBarTitle;
  final ScreenType screenType;
  const MultiCheckboxFilterView(
      {Key? key, this.appBarTitle, required this.screenType ,})
      : super(key: key);

  @override
  void onViewModelReady(MultiCheckboxFilterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    if(screenType == ScreenType.PROFILES_FILTER){
      viewModel.screenType = screenType;
    }
    if(screenType == ScreenType.CITIES_FILTER){
      viewModel.screenType = screenType;
    }
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    MultiCheckboxFilterViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MultiCheckBoxFilterAppBar(
          title: appBarTitle ?? "",
          showBackButton: true,
          onBackButtonClick: () {
            viewModel.onBackButtonClick();
          },
          onClearAllClick: () {
            viewModel.onClearAllButtonClick();
          },
          onApplyClick: () {
            viewModel.onApplyButtonClick();
          },
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: primaryHorizontalScreenPadding, vertical: primaryPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 50,
                      child: primaryTextField(
                        label: "Search $appBarTitle",
                        controller: searchController,
                        focusNode: searchFocusNode,
                        labelColor: kcBlue,
                        onChanged: (newValue) {
                          viewModel.filter(newValue);
                          viewModel.refreshUI();
                        },
                      ),
                    ),
                    if (viewModel.filterData?.isNotEmpty ?? false) vSpace(10),
                    if (viewModel.filterData?.isNotEmpty ?? false)
                    buildRowFilterItemUI(data: viewModel.filterData! , 
                    onDismissTap: (item) {
                       viewModel.onDismissFilterItemHandler(
                                    dismissItem: item);
                    },
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: viewModel.dataList.length,
                    itemBuilder: (context, index) {
                      final data = viewModel.dataList[index];
                      return buildCheckBox(
                          label: data.fieldName,
                          value: data.isChecked,
                          onTap: () {
                            viewModel.onItemClickHandler(
                                isChecked: !data.isChecked, item: data);
                          },
                          midPad: 0);
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MultiCheckboxFilterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MultiCheckboxFilterViewModel();

  @override
  void onDispose(MultiCheckboxFilterViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

 
}
