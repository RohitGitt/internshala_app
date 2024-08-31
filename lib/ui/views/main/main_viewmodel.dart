import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  setIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}
