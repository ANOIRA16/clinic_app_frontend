import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

import 'fx_label_input.dart';

class FxLabelInputForm extends FormField<List<String>> {
  FxLabelInputForm({
    Key? key,
    String? initialTitle,
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
              return FxLabelInput(
                // value: state.value??value,
                onChanged: state.didChange,
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
