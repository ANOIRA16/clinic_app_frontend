import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:flutter/material.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'fx_file_picker.dart';

class FxFilePickerForm extends FormField<String> {
  FxFilePickerForm({
    Key? key,
    required FxFilePickerController controller,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
    String initialValue = "",
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<String> state) {
              return FxFilePicker(
                controller: controller,
                borderColor: state.hasError
                    ? InitialStyle.dangerColorRegular
                    : InitialStyle.borderInput,
                onChange: state.didChange,
                subTitleWidget: state.hasError
                    ? Builder(
                        builder: (BuildContext context) => FxText(
                            state.errorText.toString(),
                            color: InitialStyle.dangerColorRegular),
                      )
                    : null,
              );
            });
}
