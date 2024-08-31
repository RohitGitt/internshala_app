// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/select_max_duration/select_max_duration_dialog_view.dart';

enum DialogType {
  infoAlert,
  selectMaxDuration,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.selectMaxDuration: (context, request, completer) =>
        SelectMaxDurationDialogView(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
