
import 'package:flutter/material.dart';
import 'package:internshala/ui/common/app_colors.dart';
import 'package:internshala/ui/components/build_text_ui.dart';
import 'package:internshala/ui/dialogs/select_max_duration/select_max_duration_dialog_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SelectMaxDurationDialogView extends StackedView<SelectMaxDurationDialogViewmodel>{

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
  Widget builder(BuildContext context, SelectMaxDurationDialogViewmodel viewModel, Widget? child) {
    return Center(
      child: buildSelectMaximumDurationInMonthsUI(viewModel.dataList , onTap: (item) {
        completer(DialogResponse(confirmed: true , data: item ));
      },),
    );
  }

  @override
  SelectMaxDurationDialogViewmodel viewModelBuilder(BuildContext context) {
    return SelectMaxDurationDialogViewmodel();
  }

}

Widget buildSelectMaximumDurationInMonthsUI(List<int> data ,{void Function(int item)? onTap}){
  return Container(
    height: 400,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    width: double.infinity,
    child: ListView(
      children: data.map((item)=> GestureDetector( onTap: () {
        if(onTap != null){
          onTap(item);
        }
      }, child: Container( height: 50 , padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10), width: double.infinity,  color: kcWhite, child: buildTextUI(text: item.toString()),))).toList(),
    ),
  );
}