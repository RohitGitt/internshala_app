import 'package:flutter/material.dart';
import 'package:internshala/app/app.locator.dart';
import 'package:internshala/services/EasyLoader/easy_loader.service.dart';
import 'package:internshala/ui/common/app_colors.dart';
import 'package:internshala/ui/components/build_text_ui.dart';
import 'package:internshala/ui/dialogs/select_max_duration/select_max_duration_dialog_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

class SelectMaxDurationDialogView
    extends StackedView<SelectMaxDurationDialogViewmodel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const SelectMaxDurationDialogView({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  void onViewModelReady(SelectMaxDurationDialogViewmodel viewModel) {
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(BuildContext context,
      SelectMaxDurationDialogViewmodel viewModel, Widget? child) {
    return Center(
      child: buildSelectMaximumDurationInMonthsUI(
        data: viewModel.dataList,
        onTap: (item) {
          completer(DialogResponse(confirmed: true, data: item));
        },
      ),
    );
  }

  @override
  SelectMaxDurationDialogViewmodel viewModelBuilder(BuildContext context) {
    return SelectMaxDurationDialogViewmodel();
  }
}

Widget buildSelectMaximumDurationInMonthsUI(
    {required List<int> data, void Function(int item)? onTap}) {
  return Container(
    height: 500,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    width: double.infinity,
    child: ListView(
      children: data
          .map((item) => GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap(item);
                }
              },
              child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  width: double.infinity,
                  color: kcWhite,
                  child: Text(item.toString(),))))
          .toList(),
    ),
  );
}
