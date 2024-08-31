class CheckBoxModel {
  int id;
  bool isChecked;
  String fieldName;

  CheckBoxModel({
    required this.id,
    required this.isChecked,
    required this.fieldName,
  });

  CheckBoxModel copyWith({
    int? id,
    bool? isChecked,
    String? fieldName,
  }) {
    return CheckBoxModel(
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      fieldName: fieldName ?? this.fieldName,
    );
  }

  void setCheck(bool value) {
    isChecked = value;
  }

  String? getFieldName() {
    return fieldName;
  }
}
