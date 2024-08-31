class MonthlyStipendModel {
  int id;
  bool isSelected = false;
  int? stipend;
  MonthlyStipendModel(
      {required this.id, required this.isSelected, this.stipend});

  bool? getIsSelected() {
    return isSelected;
  }

  setSelected(bool value) {
    isSelected = value;
  }

  int? getStipend() {
    return stipend;
  }
}
