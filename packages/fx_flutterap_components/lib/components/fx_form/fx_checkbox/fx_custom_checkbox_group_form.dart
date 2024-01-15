import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

import 'fx_custom_chechbox_group.dart';

class FxCustomCheckboxGroupForm extends FormField<List<TextEditingController>> {
  FxCustomCheckboxGroupForm(
      {Key? key,
      required List<String> titleList,
      Axis? axis,
      bool? isScrollable,
      required List<bool> valueList,
      TextEditingController? controller,
      required List<TextEditingController> controllerList,
      FormFieldSetter<List<TextEditingController>>? onSaved,
      required FormFieldValidator<List<TextEditingController>> validator,
      ValueChanged<bool>? onSelect})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            // initialValue: initialValue,
            builder: (FormFieldState<List<TextEditingController>> state) {
              return FxCustomCheckboxGroup(
                isScrollable: isScrollable,
                titleList: titleList,
                valueList: valueList,
                axis: axis,
                // value: state.value??value,
                onChanged: state.didChange,
                subTitleWidget: state.hasError
                    ? Builder(
                        builder: (BuildContext context) => FxText(
                            state.errorText.toString(),
                            color: InitialStyle.dangerColorRegular),
                      )
                    : null,
                controller: controller,
                controllerList: controllerList,
              );
            });
}
