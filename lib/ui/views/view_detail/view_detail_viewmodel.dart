import 'package:internshala/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewDetailViewModel extends BaseViewModel {

  goBack() {
    locator<NavigationService>().back();
  }
}
