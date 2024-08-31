import 'package:flutter/material.dart';
import 'package:internshala/ui/common/app_strings.dart';
import 'package:internshala/ui/components/build_text_ui.dart';
import 'package:internshala/ui/components/custom_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'view_detail_viewmodel.dart';

class ViewDetailView extends StackedView<ViewDetailViewModel> {
  const ViewDetailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ViewDetailViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: CustomAppBar(title:ViewDetailsConsts.ksAppBarTitle , showBackButton: true , onBackButtonClick: () => viewModel.goBack(),),
        body: Container(
          child: Center(
            child: buildTextUI(text: "View Details Screen" , fontSize: 20 , bold:  true),
          ),
        ),
      ),
    );
  }

  @override
  ViewDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ViewDetailViewModel();
}
