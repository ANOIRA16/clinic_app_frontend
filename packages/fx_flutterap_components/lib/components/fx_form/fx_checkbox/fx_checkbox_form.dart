import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxCheckBoxForm extends FormField<bool> {
  FxCheckBoxForm({
    Key? key,
    required Widget titleWidget,
    required FormFieldSetter<bool> onSaved,
    required FormFieldValidator<bool> validator,
    bool initialValue = false,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: state.hasError,
                title: titleWidget,
                value: state.value,
                onChanged: state.didChange,
                subtitle: state.hasError
                    ? Builder(
                        builder: (BuildContext context) => FxText(
                            state.errorText.toString(),
                            color: InitialStyle.disableColorRegular),
                      )
                    : null,
                controlAffinity: ListTileControlAffinity.leading,
              );
            });
}
