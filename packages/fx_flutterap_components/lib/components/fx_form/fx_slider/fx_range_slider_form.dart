import 'package:fx_flutterap_components/components/fx_form/fx_slider/fx_range_slider.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

class FxRangeSliderForm extends FormField<RangeValues> {
  FxRangeSliderForm({
    Key? key,
    RangeValues? initialvalue,
    void Function(RangeValues?)? onChangeStart,
    void Function(RangeValues?)? onChangeEnd,
    double? max,
    double? min,
    int? divisions,
    Color? activeColor,
    Color? inActiveColor,
    FormFieldSetter<RangeValues>? onSaved,
    required FormFieldValidator<RangeValues> validator,
    ValueChanged<RangeValues>? onSelect,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            builder: (FormFieldState<RangeValues> state) {
              return FxRangeSlider(
                initialvalue: initialvalue,
                max: max,
                min: min,
                divisions: divisions,
                activeColor: activeColor,
                inActiveColor: inActiveColor,
                onChanged: state.didChange,
                onChangeEnd: onChangeEnd,
                onChangeStart: onChangeStart,
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
