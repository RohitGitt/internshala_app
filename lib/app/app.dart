import 'package:internshala/services/EasyLoader/easy_loader.service.dart';
import 'package:internshala/services/api/internship/internship_api.service.dart';
import 'package:internshala/services/date_picker/date_picker_service.dart';
import 'package:internshala/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:internshala/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:internshala/ui/dialogs/select_max_duration/select_max_duration_dialog_view.dart';
import 'package:internshala/ui/views/filter/model/filter_state_model.dart';
import 'package:internshala/ui/views/home/home_view.dart';
import 'package:internshala/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:internshala/ui/views/internships/internships_view.dart';
import 'package:internshala/ui/views/jobs/jobs_view.dart';
import 'package:internshala/ui/views/courses/courses_view.dart';
import 'package:internshala/ui/views/main/main_view.dart';
import 'package:internshala/ui/views/filter/filter_view.dart';
import 'package:internshala/ui/views/multi_checkbox_filter/multi_checkbox_filter_view.dart';
import 'package:internshala/ui/views/view_detail/view_detail_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: InternshipsView),
    MaterialRoute(page: JobsView),
    MaterialRoute(page: CoursesView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: FilterView),
    MaterialRoute(page: MultiCheckboxFilterView),
    MaterialRoute(page: ViewDetailView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: EasyLoadingService),
    LazySingleton(classType: InternshipApiService),
    LazySingleton(classType: FilterStateModel),
    LazySingleton(classType: DatePickerService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: SelectMaxDurationDialogView)
    // @stacked-dialog
  ],
)
class App {}
