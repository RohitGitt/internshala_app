import 'package:flutter/material.dart';
import 'package:internshala/ui/common/app_strings.dart';
import 'package:internshala/core/components/build_text_ui.dart';
import 'package:internshala/core/components/custom_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: HomeViewConsts.ksAppBarTitle,
          showSearchIcon: false,
        ),
        body: Align(
          alignment: Alignment.center,
          child: buildTextUI(text: "Home Screen" , fontSize: 20, bold: true),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
