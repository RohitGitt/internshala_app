import 'package:flutter/material.dart';
import 'package:internshala/ui/common/app_strings.dart';
import 'package:internshala/core/components/build_text_ui.dart';
import 'package:internshala/core/components/custom_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'courses_viewmodel.dart';

class CoursesView extends StackedView<CoursesViewModel> {
  final Future<bool> Function()? onBack;
  const CoursesView({Key? key, this.onBack})
      : super(
          key: key,
        );

  @override
  Widget builder(
    BuildContext context,
    CoursesViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const CustomAppBar(
          title: CoursesViewConsts.ksAppBarTitle,
          showSearchIcon: true,
        ),
        body: Align(
          alignment: Alignment.center,
          child: buildTextUI(text: "Courses Screen" , fontSize: 20, bold: true),
        ),
      ),
    );
  }

  @override
  CoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CoursesViewModel();
}
