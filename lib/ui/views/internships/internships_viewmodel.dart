import 'package:internshala/app/app.locator.dart';
import 'package:internshala/app/app.router.dart';
import 'package:internshala/data/internship/internship_data_response.dto.dart';
import 'package:internshala/data/internship/permotion_ad_response.dto.dart';
import 'package:internshala/data/internship/training_ad_response.dto.dart';
import 'package:internshala/services/EasyLoader/easy_loader.service.dart';
import 'package:internshala/services/api/internship/internship_api.service.dart';
import 'package:internshala/ui/common/app_strings.dart';
import 'package:internshala/ui/views/filter/model/filter.dart';
import 'package:internshala/ui/views/filter/model/filter_state_model.dart';
import 'package:internshala/ui/views/internships/model/Internship.dart';
import 'package:internshala/ui/views/multi_checkbox_filter/multi_checkbox_filter_view.form.dart';
import 'package:internshala/utility/helper_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

class InternshipsViewModel extends FormViewModel {
  final InternshipApiService _internshipApiService =
      locator<InternshipApiService>();
  final _navigationService = locator<NavigationService>();
  final _easyLoadingService = locator<EasyLoadingService>();
  bool _showSearchBar = false;
  bool get showSearchBar => _showSearchBar;

  bool get showSearchBarDismissIcon =>
      searchValue?.isNotEmpty == true ? true : false;

  final FilterStateModel filterStateModel = locator<FilterStateModel>();
  List<Filter>? get getFilters =>
      filterStateModel.rearrangeFiltersValue(filterStateModel.filters);

  final List<Internship> _allData = [];
  List<Internship> get dataList => performFilters();

  List<Internship> performFilters() {
    List<Internship> result = _allData;
    if (searchValue.isNotEmptyAndNotNull) {
      result = applySearchFilter(searchValue!) ?? [];
    }
    if ((getFilters?.isNotEmpty ?? false) == true) {
      result = applyFilters(result);
    }

    return result;
  }

  int? get internshipCounts => dataList.where((internship) {
        if (internship is InternshipData) {return true;}
        return false;
      }).length;

  setShowSearchBar(bool value) {
    _showSearchBar = value;
    notifyListeners();
  }

  InternshipsViewModel() {}

  void init() async {
    setBusy(true);
    final permotionAdData = await getPromotionData().then((data) => data);
    final internshipsData = await getInternshipsData();
    final trainingOrCertificateAdData =
        await _internshipApiService.getTrainingData();
    _allData.add(PromotionAdData(promotionAdData: permotionAdData));
    internshipsData?.internships?.forEach((internshipMeta) {
      _allData.add(InternshipData(internships: internshipMeta));
    });
    _allData.add(TrainingAdData(trainingAdData: trainingOrCertificateAdData));
    setBusy(false);
    notifyListeners();
  }

  showLoader() {
    _easyLoadingService.showLoader(ksLoading);
  }

  hideLoader() {
    _easyLoadingService.removeLoader();
  }

  String getFilterValue(Filter item) {
    if (item is ProfileFilter) {
      return item.getFilterValue();
    } else if (item is CityFilter) {
      return item.getFilterValue();
    } else if (item is InternshipTypeFilter) {
      return item.filter.fieldName;
    } else if (item is MonthlyStipendFilter) {
      return "Minimum ${item.getFilterValue()} rs/month".toString();
    } else if (item is StartingFromDateOrAfterFilter) {
      return "Date > ${dateTimeToString(item.getFilterValue())}";
    } else if (item is MaxDurationInMonthsFilter) {
      return "Duration < ${item.getFilterValue()} months";
    } else if (item is MoreFilterItemFilter) {
      return item.getFilterValue();
    } else {
      return throw Exception("Unsupported Filter Type");
    }
  }

  Future<PromotionAdResponseDTO?> getPromotionData() async {
    return await executeApi<PromotionAdResponseDTO?>(
      apiCall: () async {
        final data = await _internshipApiService.getPrmotionData();
        return data;
      },
    );
  }

  Future<InternshipDataResponseDTO?> getInternshipsData() async {
    return await executeApi<InternshipDataResponseDTO?>(
      apiCall: () async {
        final data = await _internshipApiService.getAllInternshipsData();
        return data;
      },
    );
  }

  Future<TrainingAdResponseDTO?> getTrainingData() async {
    return await executeApi<TrainingAdResponseDTO?>(apiCall: () async {
      final data = await _internshipApiService.getTrainingData();
      return data;
    });
  }

  goToFilterScreen() async {
    await _navigationService.navigateToFilterView();
    notifyListeners();
  }

  void goToViewDetailsView() {
    _navigationService.navigateToViewDetailView();
  }

  void onDismissFilterItemClick(Filter item) {
    if (item is ProfileFilter) {
      filterStateModel.setIsCheckOfProfiles(
          isChecked: false, item: item.filter);
    } else if (item is CityFilter) {
      filterStateModel.setIsCheckOfCities(isChecked: false, item: item.filter);
    } else if (item is InternshipTypeFilter) {
      filterStateModel.setIsCheckOfInternshipType(
          isChecked: false, item: item.filter);
    } else if (item is MonthlyStipendFilter) {
      filterStateModel.setIsSelectOfMonthlyStipends(
          isSelected: false, item: item.filter);
    } else if (item is StartingFromDateOrAfterFilter) {
      filterStateModel.resetStartingFromDateOrAfter();
    } else if (item is MaxDurationInMonthsFilter) {
      filterStateModel.resetMaxDurationInMonths();
    } else if (item is MoreFilterItemFilter) {
      filterStateModel.setIsCheckOfMoreFilters(
          isChecked: false, item: item.filter);
    } else {
      _easyLoadingService.showErrorToast(
          title: "Error", description: "Unsupported item exception.");
    }
    notifyListeners();
  }

  List<Internship>? applySearchFilter(String query) {
    if (searchValue == null) {
      _allData;
    }

    return _allData.where((internship) {
      if (internship is InternshipData) {
        if (filterStateModel.doAnyLocationMatch(
                query, internship.internships?.locationNames)
            // || doCompanyMatch(searchValue! ,internship.internships?.companyName)
            // || doCategoryMatch()

            // above two are the also valid filters do data is less so, compented
        ) {
          return true;
        } else {
          false;
        }
      }
      return false;
    }).toList();
  }

  List<Internship> applyFilters(List<Internship> internshipDataList) {
    return internshipDataList.where((internship) {
      if (internship is InternshipData) {
        if (filterStateModel.isProfileFilterSuccess(data: internship) &&
            filterStateModel.isCityFilterSuccess(data: internship) &&
            filterStateModel.isInternshipTypeFilterSuccess(data: internship) &&
            filterStateModel.isStartingFromDateOrAfterFilterSuccess(
                internship: internship) &&
            filterStateModel.isMaxDurationInMonthsFilterSuccess(
                data: internship) &&
            filterStateModel.isMonthlyStipendFilterSuccess(data: internship)
                
        ) {
          return true;
        }
      }
      return false;
    }).toList();
  }
}
