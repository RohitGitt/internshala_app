import 'package:internshala/app/app.locator.dart';
import 'package:internshala/services/EasyLoader/easy_loader.service.dart';
import 'package:internshala/data/model/check_box_model.dart';
import 'package:internshala/data/model/filter.dart';
import 'package:internshala/data/model/monthly_stipend_model.dart';
import 'package:internshala/ui/views/internships/model/Internship.dart';
import 'package:internshala/utility/data_utils.dart';
import 'package:internshala/utility/helper_utils.dart';

class FilterStateModel {
  final List<Filter> _filters = [];
  List<Filter> get filters => _filters;
  // rearrangeFiltersValue(_filters);

  List<CheckBoxModel> profiles = [];
  List<CheckBoxModel> cities = [];
  List<CheckBoxModel> internshipsType = [];
  List<MonthlyStipendModel> monthlyStipends = [];
  DateTime? startingFromDateOrAfter;
  int? maxDurationInMonths;
  List<CheckBoxModel> moreFilters = [];

  FilterStateModel() {
    init();
  }

  List<Filter> rearrangeFiltersValue(List<Filter> filtersList) {
    final allProfileFilters =
        filtersList.where((filter) => filter is ProfileFilter).toList();
    final allCitiesFilters =
        filtersList.where((filter) => filter is CityFilter).toList();
    final allInternshipTypeFilters =
        filtersList.where((filter) => filter is InternshipTypeFilter).toList();
    final allMonthlyStipendFilters =
        filtersList.where((filter) => filter is MonthlyStipendFilter).toList();
    final startingFromDateOrAfterFilters = filtersList
        .where((filter) => filter is StartingFromDateOrAfterFilter)
        .toList();
    final maxDurationInMonthsFilters = filtersList
        .where((filter) => filter is MaxDurationInMonthsFilter)
        .toList();
    final allMoreFilters =
        filtersList.where((filter) => filter is MoreFilterItemFilter).toList();

    final List<Filter> result = [];
    result.addAll(allProfileFilters);
    result.addAll(allCitiesFilters);
    result.addAll(allInternshipTypeFilters);
    result.addAll(allMonthlyStipendFilters);
    result.addAll(startingFromDateOrAfterFilters);
    result.addAll(maxDurationInMonthsFilters);
    result.addAll(allMoreFilters);
    return result;
  }

  init() {
    profiles = List.from(profilesList);
    cities = List.from(citiesList);
    internshipsType = List.from(internshipsTypeList);
    monthlyStipends = List.from(monthlyStipendsList);
    startingFromDateOrAfter = null;
    maxDurationInMonths = null;
    moreFilters = List.from(moreFiltersList);
  }

  reset() {
    resetProfile();
    resetCities();
    resetInternshipType();
    resetMonthlyStipendList();
    startingFromDateOrAfter = null;
    maxDurationInMonths = null;
    resetMoreFilters();
  }

  resetProfile() {
    profiles.forEach((item) {
      if (item.isChecked == true) {
        setIsCheckOfProfiles(isChecked: false, item: item);
      }
    });
  }

  resetCities() {
    cities.forEach((item) {
      if (item.isChecked == true) {
        setIsCheckOfCities(isChecked: false, item: item);
      }
    });
  }

  resetInternshipType() {
    internshipsType.forEach((item) {
      if (item.isChecked == true) {
        setIsCheckOfInternshipType(isChecked: false, item: item);
      }
    });
  }

  resetMonthlyStipendList() {
    monthlyStipends.forEach((item) {
      if (item.isSelected == true) {
        setIsSelectOfMonthlyStipends(isSelected: false, item: item);
      }
    });
  }

  resetMoreFilters() {
    moreFilters.forEach((item) {
      if (item.isChecked == true)
        setIsCheckOfMoreFilters(isChecked: false, item: item);
    });
  }

  List<CheckBoxModel>? getAllSelectedProfiles() {
    final list = profiles.where((item) => item.isChecked).toList();
    if (list.isEmpty) {
      return null;
    }
    return list;
  }

  List<CheckBoxModel>? getAllSelectedCities() {
    final list = cities.where((item) => item.isChecked).toList();
    if (list.isEmpty) {
      return null;
    }
    return list;
  }

  setIsCheckOfProfiles({required bool isChecked, required CheckBoxModel item}) {
    final itemToChange = profiles.where((v) => v.id == item.id).firstOrNull;
    if (itemToChange == null) return;
    itemToChange.setCheck(isChecked);

    final doItemExist =
        getFilterItemByFilterItemIdOrNull(ProfileFilter(filter: item));

    if (doItemExist == null) {
      addFilter(ProfileFilter(filter: itemToChange));
    } else {
      removeFilter(ProfileFilter(filter: itemToChange));
    }
  }

  setIsCheckOfCities({required bool isChecked, required CheckBoxModel item}) {
    final itemToChange = cities.where((v) => v.id == item.id).firstOrNull;
    if (itemToChange == null) return;
    itemToChange.setCheck(isChecked);
    final doItemExist =
        getFilterItemByFilterItemIdOrNull(CityFilter(filter: item));

    if (doItemExist == null) {
      addFilter(CityFilter(filter: itemToChange));
    } else {
      removeFilter(CityFilter(filter: itemToChange));
    }
  }

  setIsCheckOfInternshipType(
      {required bool isChecked, required CheckBoxModel item}) {
    final itemToChange =
        internshipsType.where((v) => v.id == item.id).firstOrNull;
    if (itemToChange == null) {
      return;
    }
    itemToChange.setCheck(isChecked);

    final doItemExist =
        getFilterItemByFilterItemIdOrNull(InternshipTypeFilter(filter: item));

    if (doItemExist == null) {
      addFilter(InternshipTypeFilter(filter: itemToChange));
    } else {
      removeFilter(InternshipTypeFilter(filter: itemToChange));
    }
  }

  setIsSelectOfMonthlyStipends(
      {required bool isSelected, required MonthlyStipendModel item}) {
    monthlyStipends.forEach((i) {
      if (i.id == item.id) {
        final itemToChange =
            monthlyStipends.where((v) => v.id == item.id).firstOrNull;
        if (itemToChange == null) return;
        itemToChange.setSelected(isSelected);

        final doItemExist = getFilterItemByFilterItemIdOrNull(
            MonthlyStipendFilter(filter: item));
        
        

        if (doItemExist == null) {
          addFilter(MonthlyStipendFilter(filter: itemToChange));
        } else {
          removeFilter(MonthlyStipendFilter(filter: itemToChange));
        }
      } else {
        i.setSelected(false);
        removeFilter(MonthlyStipendFilter(filter: i));
      }
    });
  }

  setStartingFromDateOrAfter(DateTime date) {
    // setStartingFromDateOrAfter(date);
    startingFromDateOrAfter = date;
    final doItemExist = getFilterItemByFilterItemIdOrNull(
        StartingFromDateOrAfterFilter(filter: date));

    if (doItemExist == null) {
      addFilter(StartingFromDateOrAfterFilter(filter: date));
    }else{
      removeFilter(doItemExist);
      addFilter(StartingFromDateOrAfterFilter(filter: date));
    }
  }

  setMaxDurationInMonths(int value) {
    maxDurationInMonths = value;
    final doItemExist = getFilterItemByFilterItemIdOrNull(
        MaxDurationInMonthsFilter(maxDurationInMonths: value));
    if (doItemExist == null) {
      addFilter(MaxDurationInMonthsFilter(maxDurationInMonths: value));
    }else{
      removeFilter(doItemExist);
      addFilter(MaxDurationInMonthsFilter(maxDurationInMonths: value));
    }
  }

  resetStartingFromDateOrAfter() {
    startingFromDateOrAfter = null;
    filters.removeWhere((filter) {
      if (filter is StartingFromDateOrAfterFilter) {
        return true;
      }
      return false;
    });
  }

  resetMaxDurationInMonths() {
    maxDurationInMonths = null;
    filters.removeWhere((filterItem) {
      if (filterItem is MaxDurationInMonthsFilter) {
        return true;
      }
      return false;
    });
  }

  setIsCheckOfMoreFilters(
      {required bool isChecked, required CheckBoxModel item}) {
    final itemToChange = moreFilters.where((v) => v.id == item.id).firstOrNull;
    if (itemToChange == null) return;
    itemToChange.setCheck(isChecked);

    final doItemExist =
        getFilterItemByFilterItemIdOrNull(MoreFilterItemFilter(filter: item));

    if (doItemExist == null) {
      addFilter(MoreFilterItemFilter(filter: itemToChange));
    } else {
      removeFilter(MoreFilterItemFilter(filter: itemToChange));
    }
  }

  Filter? getFilterItemByFilterItemIdOrNull(Filter item) {
    if (item is ProfileFilter) {
      return _filters.where((filterItem) {
        if (filterItem is ProfileFilter) {
          return filterItem.filter.id == item.filter.id;
        }
        return false;
      }).firstOrNull;
    } else if (item is CityFilter) {
      return _filters.where((filterItem) {
        if (filterItem is CityFilter) {
          return filterItem.filter.id == item.filter.id;
        }
        return false;
      }).firstOrNull;
    } else if (item is InternshipTypeFilter) {
      return _filters.where((filterItem) {
        if (filterItem is InternshipTypeFilter) {
          return filterItem.filter.id == item.filter.id;
        }
        return false;
      }).firstOrNull;
    } else if (item is MonthlyStipendFilter) {
      return _filters.where((filterItem) {
        if (filterItem is MonthlyStipendFilter) {
          return filterItem.filter.id == item.filter.id;
        }
        return false;
      }).firstOrNull;
    } else if (item is MoreFilterItemFilter) {
      return _filters.where((filterItem) {
        if (filterItem is MoreFilterItemFilter) {
          return filterItem.filter.id == item.filter.id;
        }
        return false;
      }).firstOrNull;
    } else if (item is StartingFromDateOrAfterFilter) {
      return _filters.where((filterItem) {
        if (filterItem is StartingFromDateOrAfterFilter) {
          return true;
        }
        return false;
      }).firstOrNull;
    } else if (item is MaxDurationInMonthsFilter) {
      return _filters.where((filterItem) {
        if (filterItem is MaxDurationInMonthsFilter) {
          return true;
        }
        return false;
      }).firstOrNull;
    } else {
      locator<EasyLoadingService>().showErrorToast(
          title: "Filter Item", description: "Not Valid Filter Type");
      return null;
    }
  }

  addFilter(Filter filter) {
    if (filter is ProfileFilter) {
      filters.add(filter);
    } else if (filter is CityFilter) {
      filters.add(filter);
    } else if (filter is InternshipTypeFilter) {
      filters.add(filter);
    } else if (filter is MonthlyStipendFilter) {
      filters.add(filter);
    } else if (filter is StartingFromDateOrAfterFilter) {
      filters.add(filter);
    } else if (filter is MaxDurationInMonthsFilter) {
      filters.add(filter);
    } else if (filter is MoreFilterItemFilter) {
      filters.add(filter);
    } else {
      locator<EasyLoadingService>().showErrorToast(
          title: "Error", description: "Unsupported Filter Type.");
    }
  }

  removeFilter(Filter filter) {
    if (filter is ProfileFilter) {
      _filters.removeWhere((filterItem) {
        if (filterItem is ProfileFilter) {
          return filterItem.filter.id == filter.filter.id;
        }
        return false;
      });
    } else if (filter is CityFilter) {
      _filters.removeWhere((filterItem) {
        if (filterItem is CityFilter) {
          return filterItem.filter.id == filter.filter.id;
        }
        return false;
      });
    } else if (filter is InternshipTypeFilter) {
      _filters.removeWhere((filterItem) {
        if (filterItem is InternshipTypeFilter) {
          return filterItem.filter.id == (filter).filter.id;
        }
        return false;
      });
    } else if (filter is MonthlyStipendFilter) {
      _filters.removeWhere((filterItem) {
        if (filterItem is MonthlyStipendFilter) {
          return filterItem.filter.id == filter.filter.id;
        }
        return false;
      });
    } else if (filter is StartingFromDateOrAfterFilter) {
      _filters.removeWhere((filterItem) {
        if (filterItem is StartingFromDateOrAfterFilter) {
          return true;
        }
        return false;
      });
    } else if (filter is MaxDurationInMonthsFilter) {
      _filters.removeWhere((filterItem) {
        if (filterItem is MaxDurationInMonthsFilter) {
          return true;
        }
        return false;
      });
    } else if (filter is MoreFilterItemFilter) {
      _filters.removeWhere((filterItem) {
        if (filterItem is MoreFilterItemFilter) {
          return filterItem.filter.id == filter.filter.id;
        }
        return false;
      });
    } else {
      locator<EasyLoadingService>().showErrorToast(
          title: "Error", description: "Unsupported Filter Type.");
    }
  }

  bool doAnyLocationMatch(String query, List<String>? locations) {
    if (locations == null) {
      return false;
    }

    final result = locations.any((location) {
      if (location.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }
      return false;
    });
    return result;
  }

  bool doCompanyMatch(String query, String? companyName) {
    if (companyName == null) {
      return false;
    }

    if (companyName.toLowerCase().contains(query.toLowerCase())) {
      return true;
    } else {
      return false;
    }
  }

  // need to implement this
  bool doCategoryMatch() {
    return true;
  }

  List<Filter>? getProfileFilters() {
    final results = filters.where((filter) {
      if (filter is ProfileFilter) {
        return true;
      }
      return false;
    }).toList();
    return results.isEmpty == true ? null : results;
  }

  List<Filter>? getCitiesFilters() {
    final results = filters.where((filter) {
      if (filter is CityFilter) {
        return true;
      }
      return false;
    }).toList();
    return results.isEmpty == true ? null : results;
  }

  List<Filter>? getInternshipsTypeFilters() {
    final results = filters.where((filter) {
      if (filter is InternshipTypeFilter) {
        return true;
      }
      return false;
    }).toList();
    return results.isEmpty == true ? null : results;
  }

  Filter? getMonthlyStipendFilter() {
    final result = filters.where((filter) {
      if (filter is MonthlyStipendFilter) {
        return true;
      }
      return false;
    }).toList();
    return result.isEmpty == true ? null : result[0];
  }

  Filter? getStartingFromOrAfterFilter() {
    if (filters.isEmpty) {
      return null;
    }
    final result = filters.where((filter) {
      if (filter is StartingFromDateOrAfterFilter) {
        return true;
      }
      return false;
    }).toList();
    return result.isEmpty == true ? null : result[0];
  }

  Filter? getMaximumDurationInMonthsFilter() {
    final result = filters.where((filter) {
      if (filter is MaxDurationInMonthsFilter) {
        return true;
      }
      return false;
    }).toList();
    return result.isEmpty == true ? null : result[0];
  }

  List<Filter>? getMoreFiltersTypeFilters() {
    final results = filters.where((filter) {
      if (filter is MoreFilterItemFilter) {
        return true;
      }
      return false;
    }).toList();
    return results.isEmpty == true ? null : results;
  }

  List<String>? getAllProfileFilterConditions() {
    final result = getProfileFilters();
    if (result == null) {
      return null;
    }
    return result
        .map((filter) => (filter as ProfileFilter).getFilterValue())
        .toList();
  }

  List<String>? getAllCityFilterConditions() {
    final result = getCitiesFilters();
    if (result == null) {
      return null;
    }
    return result
        .map((filter) => (filter as CityFilter).getFilterValue())
        .toList();
  }

  List<bool>? getAllInternshipTypeFilterConditions() {
    final result = getInternshipsTypeFilters();
    if (result == null) {
      return null;
    }
    return result
        .map((filter) => (filter as InternshipTypeFilter).getFilterValue())
        .toList();
  }

  int? getMonthlyStipendFilterCondition() {
    final result = getMonthlyStipendFilter();
    if (result == null) {
      return null;
    }
    return (result as MonthlyStipendFilter).getFilterValue();
  }

  DateTime? getStartingFromOrAfterFilterCondition() {
    final result = getStartingFromOrAfterFilter();
    if (result == null) {
      return null;
    }
    return (result as StartingFromDateOrAfterFilter?)?.getFilterValue();
  }

  int? getMaximumDurationInMonthsFilterCondition() {
    final result = getMaximumDurationInMonthsFilter();
    if (result == null) {
      return null;
    }
    return (result as MaxDurationInMonthsFilter?)?.getFilterValue();
  }

  List<String>? getAllMoreFiltersItemConditions() {
    final result = getMoreFiltersTypeFilters();
    if (result == null) {
      return null;
    }
    return result
        .map((filter) => (filter as MoreFilterItemFilter).getFilterValue())
        .toList();
  }

  bool isProfileFilterSuccess({required InternshipData data}) {
    final conditions = getAllProfileFilterConditions();
    if (conditions == null) {
      return true;
    }
    return conditions.any((conditionValue) {
      if (data.internships?.profileName
              ?.toLowerCase()
              .contains(conditionValue.toLowerCase()) ??
          false) {
        return true;
      }
      return false;
    });
  }

  bool isCityFilterSuccess({required InternshipData data}) {
    final conditions = getAllCityFilterConditions();
    if (conditions == null) {
      return true;
    }

    return conditions.any((conditionValue) {
      final locations = data.internships?.locationNames;
      if(locations == null) { return false;}
      final result = locations.any((location) {
            if (location.toLowerCase().contains(conditionValue.toLowerCase())) {
              return true;
            }
            return false;
          });

      return result;
    });
  }

  bool isInternshipTypeFilterSuccess({required InternshipData data}) {
    final conditions = getAllInternshipTypeFilterConditions();
    final filtersList = getInternshipsTypeFilters();
    if (conditions == null) {
      return true;
    }
    if(filtersList == null) { return true;}
    bool result = false;
    filtersList.forEach((filter) {
      if (filter is InternshipTypeFilter) {
        if (filter.filter.fieldName == 'Work from home') {
          if (data.internships?.workFromHome == true) {
            result = true;
          }
        }

        if (filter.filter.fieldName == "Part-time") {
          if (data.internships?.partTime == true) {
            result = true;
          }
        }
      }
    });

    return result;
  }

  bool isMonthlyStipendFilterSuccess({ required InternshipData data}){
    final conditions = getMonthlyStipendFilterCondition();
    if(conditions == null){
      return true;
    }

    final stipendStr = data.internships?.stipend?.salary;
    if(stipendStr == null){ return false;}
    int? stipend = extractStipend(stipendStr);
    if(stipend == null){
      return true;
    }
    if(stipend >= conditions){
        return true;
    }
      return false;
  }

  int? extractStipend(String str){
    //"₹ 20,000 /month"
    try{
    List<String> list = str.split(" ");
    String salaryStr = list[1];
    int? salary = parseFormattedNumber(salaryStr);
      return salary;
    }catch(err){
      return null;
    }

  }

  bool isMaxDurationInMonthsFilterSuccess({required InternshipData data}) {
    final condition = getMaximumDurationInMonthsFilterCondition();
    if (condition == null) {
      return true;
    }
    final duration = getDurationInt(data.internships?.duration);
    if (duration == null) {
      return false;
    }
    if (duration <= condition ) {
      return true;
    }else{
      return false;
    }
  }

  int? getDurationInt(String? str) {
    if (str == null) {
      return null;
    }
    try {
      String duration = str.split(" ")[0];
      return int.parse(duration);
    } catch (err) {
      return null;
    }
  }

  bool isStartingFromDateOrAfterFilterSuccess(
      {required InternshipData internship}) {
    final conditon = getStartingFromOrAfterFilterCondition();
    if (conditon == null) {
      return true;
    }
    final dateString = internship.internships?.startDateComparisonFormat;

    if (dateString == null) {
      return false;
    }

    if ((stringToDateTime(dateString).isBefore(conditon))) {
      return false;
    } else {
      return true;
    }
    
  }
}
