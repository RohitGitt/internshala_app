import 'package:flutter/material.dart';
import 'package:internshala/ui/common/app_strings.dart';
import 'package:internshala/ui/components/build_text_ui.dart';
import 'package:internshala/ui/components/custom_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'jobs_viewmodel.dart';

class JobsView extends StackedView<JobsViewModel> {
  final Future<bool> Function()? onBack;
  const JobsView({Key? key, this.onBack}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    JobsViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const CustomAppBar(
          title: JobsViewConsts.ksAppBarTitle,
          showSearchIcon: true,
        ),
        body: Align(
          alignment: Alignment.center,
          child: buildTextUI(text: "Jobs Screen"),
        ),
      ),
    );
  }

  @override
  JobsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      JobsViewModel();
}
