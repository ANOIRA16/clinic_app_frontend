import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:flutter/material.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'fx_jalali_date_picker.dart';

class FxJalaliDatePickerForm extends FormField<String> {
  FxJalaliDatePickerForm({
    Key? key,
    required String title,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
    String initialValue = "",
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<String> state) {
              return FxJalaliDatePicker(
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
