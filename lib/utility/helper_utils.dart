import 'dart:async';

import 'package:internshala/app/app.locator.dart';
import 'package:internshala/services/EasyLoader/easy_loader.service.dart';
import 'package:internshala/ui/common/app_strings.dart';
import 'package:intl/intl.dart';



Future<T?> executeApi<T>(
    {required Future<T> Function()? apiCall, String? errorTitle}) async {
  if (apiCall == null) {
    return Future.value(null);
  }
  try {
    showLoader();
    final data = await apiCall();
    hideLoader();
    return data;
  } catch (err) {
    hideLoader();
    locator<EasyLoadingService>().showErrorToast(
        title: errorTitle ?? "Error", description: err.toString());
    return Future.value(null);
  }
}

showLoader() async {
  await locator<EasyLoadingService>().showLoader(ksLoading);
}

hideLoader() async {
  await locator<EasyLoadingService>().removeLoader();
}

String? convertToFormattedString(int? value) {
  if (value == null) return null;

  String valueString = value.toString();
  if (valueString.isEmpty) return null;

  String formattedString = '';
  int length = valueString.length;
  int count = 0;

  for (int i = length - 1; i >= 0; i--) {
    if (count == 3 || (count > 3 && (count - 3) % 2 == 0)) {
      formattedString = ',' + formattedString;
    }
    formattedString = valueString[i] + formattedString;
    count++;
  }

  return formattedString;
}

int? convertToInt(String? formattedString) {
  if (formattedString == null || formattedString.isEmpty) return null;

  return int.parse(formattedString.replaceAll(',', ''));
}

DateTime stringToDateTime(String dateString) {
  return DateTime.parse(dateString);
}

String? dateTimeToString(DateTime? dateTime) {
  if(dateTime == null) return '';
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(dateTime);
}


int? extractNumericValue(String? value) {
  if (value == null) {
    return null;
  }

  final regex = RegExp(r'(\d{1,3}(?:,\d{3})*)');
  final match = regex.firstMatch(value);

  if (match != null) {
    final numericString = match.group(0)?.replaceAll(',', '');
    if (numericString != null) {
      return int.tryParse(numericString);
    }
  }

  return null;
}

int? parseFormattedNumber(String formattedNumber) {
  String cleanedNumber = formattedNumber.replaceAll(',', '');
  try{
    return int.parse(cleanedNumber);
  }catch(err){
    return null;
  }
}