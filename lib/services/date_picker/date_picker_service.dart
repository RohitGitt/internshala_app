import 'package:flutter/material.dart';
import 'package:internshala/app/app.locator.dart';
import 'package:internshala/services/EasyLoader/easy_loader.service.dart';
import 'package:stacked_services/stacked_services.dart';

class DatePickerService{
  DatePickerService();
  final context = StackedService.navigatorKey?.currentContext;
  final defaultInitialDate = DateTime.now();
  final defaultFirstDate = DateTime.now();
  final defaultLastDate = DateTime.now().copyWith(year: DateTime.now().year + 1);

  Future<DateTime?> showDatePickerUI({ DateTime? initialDate , DateTime? firstDate , DateTime? lastDate}) async{
    if(context == null){ locator<EasyLoadingService>().showErrorToast(title: "Error" , description: "Context not available");}
    return await showDatePicker(context: context!, initialDate: initialDate ?? defaultInitialDate,
     firstDate: firstDate ?? defaultFirstDate, lastDate: lastDate ?? defaultLastDate);
  }
}