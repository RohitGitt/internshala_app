import 'package:flutter/material.dart';
import 'package:internshala/app/app.logger.dart';
import 'package:internshala/gen/assets.gen.dart';
import 'package:internshala/ui/common/app_colors.dart';
import 'package:internshala/ui/common/ui_helpers.dart';
import 'package:internshala/ui/views/courses/courses_view.dart';
import 'package:internshala/ui/views/home/home_view.dart';
import 'package:internshala/ui/views/internships/internships_view.dart';
import 'package:internshala/ui/views/jobs/jobs_view.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: WillPopScope(
          onWillPop: () async {
            if (viewModel.currentIndex == 1 ||
                viewModel.currentIndex == 2 ||
                viewModel.currentIndex == 3) {
              getLogger("MainView").i(
                  "onWillPop Called : index value : ${viewModel.currentIndex}");
              viewModel.setIndex(0);
              return false;
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: kcPrimaryColor,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.currentIndex,
              onTap: viewModel.setIndex,
              selectedItemColor: kcBlue,
              unselectedItemColor: kcBlack,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.images.home.path,
                      width: bottomNavBarIconHeiht,
                      color: viewModel.currentIndex == 0 ? kcBlue : null,
                    ),
                    label: "home"),
                BottomNavigationBarItem(
                    icon: Image.asset(Assets.images.internship.path,
                        width: bottomNavBarIconHeiht,
                        color: viewModel.currentIndex == 1 ? kcBlue : null),
                    label: "Intenship"),
                BottomNavigationBarItem(
                    icon: Image.asset(Assets.images.job.path,
                        width: bottomNavBarIconHeiht,
                        color: viewModel.currentIndex == 2 ? kcBlue : null),
                    label: "Jobs"),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      Assets.images.courses.path,
                      width: bottomNavBarIconHeiht,
                    ),
                    label: "Courses"),
              ],
            ),
            body: getViewForIndex(viewModel.currentIndex, () {
              viewModel.setIndex(0);
              return Future.value(true);
            }),
          )),
    );
  }

  @override
  MainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainViewModel();

  Widget getViewForIndex(int index, Future<bool> Function()? onBack) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return InternshipsView(
          onBack: onBack,
        );
      case 2:
        return JobsView(
          onBack: onBack,
        );
      case 3:
        return CoursesView(
          onBack: onBack,
        );
      default:
        return const HomeView();
    }
  }
}
