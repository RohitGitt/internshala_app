import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:internshala/gen/assets.gen.dart';
import 'package:stacked/stacked.dart';
import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          Assets.images.internshalaSplashScreen.path,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
