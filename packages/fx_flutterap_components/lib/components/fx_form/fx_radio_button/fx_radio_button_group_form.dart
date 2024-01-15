import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'fx_radio_button_group.dart';

class FxRadioButtonGroupForm extends FormField<TextEditingController> {
  FxRadioButtonGroupForm(
      {Key? key,
      Widget? subTitleWidget,
      Axis? axis,
      bool? isScrollable,
      void Function(TextEditingController?)? onChanged,
      required List<String> titleList,
      required TextEditingController controller,
      FormFieldSetter<TextEditingController>? onSaved,
      required FormFieldValidator<TextEditingController> validator,
      ValueChanged<TextEditingController>? onSelect})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            // initialValue: initialValue,
            builder: (FormFieldState<TextEditingController> state) {
              return FxRadioButtonGroup(
                titleList: titleList,
                axis: axis,
                isScrollable: isScrollable,
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
              );
            });
}
