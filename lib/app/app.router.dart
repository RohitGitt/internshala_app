// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;

import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:internshala/ui/views/courses/courses_view.dart' as _i6;
import 'package:internshala/ui/views/filter/filter_view.dart' as _i8;
import 'package:internshala/ui/views/home/home_view.dart' as _i2;
import 'package:internshala/ui/views/internships/internships_view.dart' as _i4;
import 'package:internshala/ui/views/jobs/jobs_view.dart' as _i5;
import 'package:internshala/ui/views/main/main_view.dart' as _i7;
import 'package:internshala/ui/views/multi_checkbox_filter/multi_checkbox_filter_view.dart'
    as _i9;
import 'package:internshala/ui/views/startup/startup_view.dart' as _i3;
import 'package:internshala/ui/views/view_detail/view_detail_view.dart' as _i10;
import 'package:internshala/utility/enum_utils.dart' as _i13;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const internshipsView = '/internships-view';

  static const jobsView = '/jobs-view';

  static const coursesView = '/courses-view';

  static const mainView = '/main-view';

  static const filterView = '/filter-view';

  static const multiCheckboxFilterView = '/multi-checkbox-filter-view';

  static const viewDetailView = '/view-detail-view';

  static const all = <String>{
    homeView,
    startupView,
    internshipsView,
    jobsView,
    coursesView,
    mainView,
    filterView,
    multiCheckboxFilterView,
    viewDetailView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.internshipsView,
      page: _i4.InternshipsView,
    ),
    _i1.RouteDef(
      Routes.jobsView,
      page: _i5.JobsView,
    ),
    _i1.RouteDef(
      Routes.coursesView,
      page: _i6.CoursesView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i7.MainView,
    ),
    _i1.RouteDef(
      Routes.filterView,
      page: _i8.FilterView,
    ),
    _i1.RouteDef(
      Routes.multiCheckboxFilterView,
      page: _i9.MultiCheckboxFilterView,
    ),
    _i1.RouteDef(
      Routes.viewDetailView,
      page: _i10.ViewDetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.InternshipsView: (data) {
      final args = data.getArgs<InternshipsViewArguments>(
        orElse: () => const InternshipsViewArguments(),
      );
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.InternshipsView(key: args.key, onBack: args.onBack),
        settings: data,
      );
    },
    _i5.JobsView: (data) {
      final args = data.getArgs<JobsViewArguments>(
        orElse: () => const JobsViewArguments(),
      );
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.JobsView(key: args.key, onBack: args.onBack),
        settings: data,
      );
    },
    _i6.CoursesView: (data) {
      final args = data.getArgs<CoursesViewArguments>(
        orElse: () => const CoursesViewArguments(),
      );
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.CoursesView(key: args.key, onBack: args.onBack),
        settings: data,
      );
    },
    _i7.MainView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.MainView(),
        settings: data,
      );
    },
    _i8.FilterView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.FilterView(),
        settings: data,
      );
    },
    _i9.MultiCheckboxFilterView: (data) {
      final args =
          data.getArgs<MultiCheckboxFilterViewArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.MultiCheckboxFilterView(
            key: args.key,
            appBarTitle: args.appBarTitle,
            screenType: args.screenType),
        settings: data,
      );
    },
    _i10.ViewDetailView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ViewDetailView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class InternshipsViewArguments {
  const InternshipsViewArguments({
    this.key,
    this.onBack,
  });

  final _i11.Key? key;

  final _i12.Future<bool> Function()? onBack;

  @override
  String toString() {
    return '{"key": "$key", "onBack": "$onBack"}';
  }

  @override
  bool operator ==(covariant InternshipsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.onBack == onBack;
  }

  @override
  int get hashCode {
    return key.hashCode ^ onBack.hashCode;
  }
}

class JobsViewArguments {
  const JobsViewArguments({
    this.key,
    this.onBack,
  });

  final _i11.Key? key;

  final _i12.Future<bool> Function()? onBack;

  @override
  String toString() {
    return '{"key": "$key", "onBack": "$onBack"}';
  }

  @override
  bool operator ==(covariant JobsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.onBack == onBack;
  }

  @override
  int get hashCode {
    return key.hashCode ^ onBack.hashCode;
  }
}

class CoursesViewArguments {
  const CoursesViewArguments({
    this.key,
    this.onBack,
  });

  final _i11.Key? key;

  final _i12.Future<bool> Function()? onBack;

  @override
  String toString() {
    return '{"key": "$key", "onBack": "$onBack"}';
  }

  @override
  bool operator ==(covariant CoursesViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.onBack == onBack;
  }

  @override
  int get hashCode {
    return key.hashCode ^ onBack.hashCode;
  }
}

class MultiCheckboxFilterViewArguments {
  const MultiCheckboxFilterViewArguments({
    this.key,
    this.appBarTitle,
    required this.screenType,
  });

  final _i11.Key? key;

  final String? appBarTitle;

  final _i13.ScreenType screenType;

  @override
  String toString() {
    return '{"key": "$key", "appBarTitle": "$appBarTitle", "screenType": "$screenType"}';
  }

  @override
  bool operator ==(covariant MultiCheckboxFilterViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.appBarTitle == appBarTitle &&
        other.screenType == screenType;
  }

  @override
  int get hashCode {
    return key.hashCode ^ appBarTitle.hashCode ^ screenType.hashCode;
  }
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInternshipsView({
    _i11.Key? key,
    _i12.Future<bool> Function()? onBack,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.internshipsView,
        arguments: InternshipsViewArguments(key: key, onBack: onBack),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToJobsView({
    _i11.Key? key,
    _i12.Future<bool> Function()? onBack,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.jobsView,
        arguments: JobsViewArguments(key: key, onBack: onBack),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCoursesView({
    _i11.Key? key,
    _i12.Future<bool> Function()? onBack,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.coursesView,
        arguments: CoursesViewArguments(key: key, onBack: onBack),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFilterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.filterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMultiCheckboxFilterView({
    _i11.Key? key,
    String? appBarTitle,
    required _i13.ScreenType screenType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.multiCheckboxFilterView,
        arguments: MultiCheckboxFilterViewArguments(
            key: key, appBarTitle: appBarTitle, screenType: screenType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToViewDetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.viewDetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInternshipsView({
    _i11.Key? key,
    _i12.Future<bool> Function()? onBack,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.internshipsView,
        arguments: InternshipsViewArguments(key: key, onBack: onBack),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithJobsView({
    _i11.Key? key,
    _i12.Future<bool> Function()? onBack,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.jobsView,
        arguments: JobsViewArguments(key: key, onBack: onBack),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCoursesView({
    _i11.Key? key,
    _i12.Future<bool> Function()? onBack,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.coursesView,
        arguments: CoursesViewArguments(key: key, onBack: onBack),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFilterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.filterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMultiCheckboxFilterView({
    _i11.Key? key,
    String? appBarTitle,
    required _i13.ScreenType screenType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.multiCheckboxFilterView,
        arguments: MultiCheckboxFilterViewArguments(
            key: key, appBarTitle: appBarTitle, screenType: screenType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithViewDetailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.viewDetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
