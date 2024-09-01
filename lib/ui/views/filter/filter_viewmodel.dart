import 'package:flutter/material.dart';
import 'package:internshala/app/app.dialogs.dart';
import 'package:internshala/app/app.locator.dart';
import 'package:internshala/app/app.logger.dart';
import 'package:internshala/app/app.router.dart';
import 'package:internshala/services/date_picker/date_picker_service.dart';
import 'package:internshala/ui/views/filter/model/filter_state_model.dart';
import 'package:internshala/ui/views/filter/model/check_box_model.dart';
import 'package:internshala/ui/views/filter/model/monthly_stipend_model.dart';
import 'package:internshala/utility/enum_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FilterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final maxDurationInMonthsKey = GlobalKey();
  bool shouldResetFilterState = true;

  FilterStateModel filterStateModel = locator<FilterStateModel>();
  DateTime? get startingFromOrAfterValue => filterStateModel.startingFromDateOrAfter;

  List<CheckBoxModel> get profilesFilters =>
      filterStateModel.profiles
          .where((item) => item.isChecked == true)
          .toList();
  List<CheckBoxModel> get citiesFilters =>
      filterStateModel.cities
          .where((item) => item.isChecked == true)
          .toList();

  void showDatePickerUI(BuildContext context) async {
    final DateTime? pickedDate = await locator<DatePickerService>().showDatePickerUI();
    if (pickedDate != null) {
      filterStateModel.setStartingFromDateOrAfter(pickedDate);
    }

    notifyListeners();

  }

  void onDismissProfilesFilterItem(CheckBoxModel item) {
    filterStateModel.setIsCheckOfProfiles(isChecked: false, item: item);
    notifyListeners();
  }

  void onDismissCitiesFilterItem(CheckBoxModel item) {
    filterStateModel.setIsCheckOfCities(isChecked: false, item: item);
    notifyListeners();
  }

  void onInternshipFilterClick(CheckBoxModel item) {
    filterStateModel.setIsCheckOfInternshipType(
        isChecked: !item.isChecked, item: item);
    notifyListeners();
  }

  void onMonthlySpipendFilterItemClick(MonthlyStipendModel item) {
    filterStateModel.setIsSelectOfMonthlyStipends(
        isSelected: !item.isSelected, item: item);
        getLogger("FilterViewModle").i("filterState: ${filterStateModel.filters.length} and ${filterStateModel.filters.toString()}");
    notifyListeners();
  }

  void onMoreFiltersItemClick(CheckBoxModel item) {
    filterStateModel.setIsCheckOfMoreFilters(
        isChecked: !item.isChecked, item: item);
    notifyListeners();
  }

  void goToProfileFilterScreen() {
    goToMultiCheckboxFilter(
        appBarTitle: "Profile", screenType: ScreenType.PROFILES_FILTER);
  }

  void goToCityFilterScreen() {
    goToMultiCheckboxFilter(
        appBarTitle: "City", screenType: ScreenType.CITIES_FILTER);
  }

  void goToMultiCheckboxFilter(
      {required ScreenType screenType, String? appBarTitle}) async {
    await _navigationService.navigateToMultiCheckboxFilterView(
        appBarTitle: appBarTitle, screenType: screenType);
    notifyListeners();
  }

  void onApplyButtonClick() {
    shouldResetFilterState = false;
    _navigationService.back();
  }

  void onClearAllButtonClick() {
    reset();
    notifyListeners();
  }

  reset(){
    filterStateModel.reset();
  }

  void onBackButtonClick() {
    reset();
    _navigationService.back();
  }

  showSelectMaximumDurationInMonthsDialog() async{
    final response = await locator<DialogService>().showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.selectMaxDuration,
    );

    if(response?.confirmed ?? false){
      
      filterStateModel.setMaxDurationInMonths(response?.data as int);
      notifyListeners();
    }
  }
  
}

/*
    "salary": "₹ 5,500 /month",
    "start_date_comparison_format": "2023-12-29",
    "duration": "3 Months",
*/
