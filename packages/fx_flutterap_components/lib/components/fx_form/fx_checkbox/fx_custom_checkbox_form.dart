import 'package:fx_flutterap_components/components/fx_form/fx_checkbox/fx_custom_check_box.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

class FxCustomCheckBoxForm extends FormField<bool> {
  FxCustomCheckBoxForm(
      {Key? key,
      Widget? nonSelectedIcon,
      Widget? selectedIcon,
      bool? disabled,
      required Widget titleWidget,
      FormFieldSetter<bool>? onSaved,
      required FormFieldValidator<bool> validator,
      bool initialValue = false,
      required bool value,
      ValueChanged<bool>? onSelect})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<bool> state) {
              return FxCustomCheckBox(
                selectedIcon: selectedIcon,
                nonSelectedIcon: nonSelectedIcon,
                disabled: disabled,
                titleWidget: titleWidget,
                value: value,
                // value: state.value??value,
                onChanged: state.didChange,
                subTitleWidget: state.hasError
                    ? Builder(
                        builder: (BuildContext context) =>
                            FxText(
                            state.errorText.toString(),
                            tag: Tag.h5,
                            color: InitialStyle.dangerColorRegular),
                      )
                    : null,
              );
            });
}
