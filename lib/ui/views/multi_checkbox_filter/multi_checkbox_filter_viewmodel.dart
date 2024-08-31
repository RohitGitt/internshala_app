import 'package:internshala/app/app.locator.dart';
import 'package:internshala/ui/views/filter/model/check_box_model.dart';
import 'package:internshala/ui/views/filter/model/filter_state_model.dart';
import 'package:internshala/ui/views/multi_checkbox_filter/multi_checkbox_filter_view.form.dart';
import 'package:internshala/utility/enum_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';



class MultiCheckboxFilterViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  late ScreenType screenType;

  List<CheckBoxModel> _allData = [];
  List<CheckBoxModel>? get filterData => getFilterData();


  List<CheckBoxModel> get dataList =>
      searchValue == null 
      ?  getScreenData() : filter(searchValue);

  setAllData(List<CheckBoxModel> data) {
    _allData = data;
  }

  List<CheckBoxModel> getScreenData(){
    List<CheckBoxModel>? data;
    switch(screenType){
      case ScreenType.PROFILES_FILTER: data = locator<FilterStateModel>().profiles;
        break;

      case ScreenType.CITIES_FILTER: data = locator<FilterStateModel>().cities;
        break;
      default: break;
    }

    return data ?? [];
  }

  List<CheckBoxModel>? getFilterData(){
    List<CheckBoxModel>? data;
    switch(screenType){
      case ScreenType.PROFILES_FILTER: data = locator<FilterStateModel>().getAllSelectedProfiles();
        break;

      case ScreenType.CITIES_FILTER: data = locator<FilterStateModel>().getAllSelectedCities();
        break;
      default: break;
      
    }

    return data;
  }



  void onItemClickHandler({bool? isChecked, required CheckBoxModel item}) {
   
    if(isChecked == null){
      return ;
    }
    switch(screenType){
      case ScreenType.PROFILES_FILTER:
        locator<FilterStateModel>().setIsCheckOfProfiles(isChecked: isChecked, item: item);
        break;
      case ScreenType.CITIES_FILTER:
        locator<FilterStateModel>().setIsCheckOfCities(isChecked: isChecked, item: item);
        break;
      default:
        break;
    }
    notifyListeners();
  }

  void onDismissFilterItemHandler({required CheckBoxModel dismissItem}) {
    switch(screenType){
      case ScreenType.PROFILES_FILTER:
        locator<FilterStateModel>().setIsCheckOfProfiles(isChecked: false, item: dismissItem);
        break;
      case ScreenType.CITIES_FILTER:
        locator<FilterStateModel>().setIsCheckOfCities(isChecked: false, item: dismissItem);
        break;
      default:
        break;
    }
    notifyListeners();
  }

  List<CheckBoxModel> filter(String? query) {
    if (query == null) {
      return getScreenData();
    }
    return getScreenData()
        .where((item) =>
            item.fieldName.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  refreshUI() {
    notifyListeners();
  }

  void onClearAllButtonClick() {
    reset();
    notifyListeners();
  }

  reset(){
    switch(screenType){
      case ScreenType.PROFILES_FILTER: locator<FilterStateModel>().resetProfile(); break;
      case ScreenType.CITIES_FILTER: locator<FilterStateModel>().resetCities(); break;
      default: break;
    }
  }

  void onApplyButtonClick(){
    _navigationService.back();
  }

  void onBackButtonClick() {
    reset();
    _navigationService.back();
  }
}
