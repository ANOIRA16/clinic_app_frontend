import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:flutter/material.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'fx_color_picker.dart';

class FxRingColorPickerForm extends FormField<Color> {
  FxRingColorPickerForm({
    Key? key,
    required String title,
    required FormFieldSetter<Color> onSaved,
    required FormFieldValidator<Color> validator,
    Color? initialValue,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<Color> state) {
              return FxColorPicker(
                title: title,
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
