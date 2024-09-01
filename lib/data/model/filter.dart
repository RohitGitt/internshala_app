
import 'package:internshala/data/model/check_box_model.dart';
import 'package:internshala/data/model/monthly_stipend_model.dart';

abstract class Filter {
  int id = 0;
  Filter(){
    id = id++;
  }
}

class ProfileFilter extends Filter {
  CheckBoxModel filter;

  ProfileFilter({required this.filter}): super();

  String getFilterValue(){
    return filter.fieldName.toString();
  }
}

class CityFilter extends Filter {
  CheckBoxModel filter;
  CityFilter({required this.filter}):super();
  String getFilterValue(){
    return filter.fieldName.toString();
  }
}

class InternshipTypeFilter extends Filter {
  CheckBoxModel filter;
  InternshipTypeFilter({ required this.filter}):super();
  bool getFilterValue(){
    return filter.isChecked;
  }
}

class MonthlyStipendFilter extends Filter {
  MonthlyStipendModel filter;
  MonthlyStipendFilter({ required this.filter}):super();
  int? getFilterValue(){
    return filter.stipend;
  }
}

class StartingFromDateOrAfterFilter extends Filter {
  DateTime filter;
  StartingFromDateOrAfterFilter({ required this.filter}):super();
  DateTime getFilterValue(){
    return filter;
  }

}

class MaxDurationInMonthsFilter extends Filter {
  int maxDurationInMonths;
  MaxDurationInMonthsFilter({required this.maxDurationInMonths}):super();
  int getFilterValue(){
    return maxDurationInMonths;
  }
}

class MoreFilterItemFilter extends Filter {
  CheckBoxModel filter;
  MoreFilterItemFilter({required this.filter}):super();
  String getFilterValue(){
    return filter.fieldName;
  }

}

