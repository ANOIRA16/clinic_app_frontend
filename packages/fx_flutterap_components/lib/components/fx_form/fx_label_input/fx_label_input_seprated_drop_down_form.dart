import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

import 'fx_label_input_seprated_drop_down.dart';

class FxLabelInputSepratedDropDownForm extends FormField<List<String>> {
  FxLabelInputSepratedDropDownForm({
    Key? key,
    String? initialTitle,
    String? buttonName,
    required List labelList,
    FormFieldSetter<List<String>>? onSaved,
    required FormFieldValidator<List<String>> validator,
    // String initialValue =[],
    required String value,
    ValueChanged<List<String>>? onSelect,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            // initialValue: initialValue,

            builder: (FormFieldState<List<String>> state) {
              return FxLabelInputSepratedDropDown(
                // value: state.value??value,
                onChanged: state.didChange,
                buttonName:buttonName,
                subTitleWidget: state.hasError
                    ? Builder(
                        builder: (BuildContext context) => FxText(
                            state.errorText.toString(),
                            color: InitialStyle.dangerColorRegular),
                      )
                    : null,
                labelList: labelList,
              );
            });
}
