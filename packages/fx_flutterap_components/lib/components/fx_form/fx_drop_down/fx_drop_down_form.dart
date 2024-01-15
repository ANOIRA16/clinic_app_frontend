import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

import 'fx_drop_down.dart';

class FxDropDownForm extends FormField<String> {
  FxDropDownForm({
    Widget? buttonWidget,
    Offset? menuOffset,
    BoxDecoration? dropdownDecoration,
    double? dropdownWidth,
    double? dropdownItemsHeight,
    EdgeInsetsGeometry? buttonPadding,
    EdgeInsetsGeometry? buttonMargin,
    required String value,
    required List list,
    String idName = "_id",
    String valueName = "title",
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    Key? key,
    String? initialTitle,
    FormFieldSetter<String>? onSaved,
    required FormFieldValidator<String> validator,
    String initialValue = "",

    ValueChanged<String>? onSelect,




  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<String> state) {
              return FxDropDown(
                buttonWidget: buttonWidget,
                buttonPadding: buttonPadding,
                buttonMargin: buttonMargin,
                menuOffset: menuOffset,
                dropdownDecoration: dropdownDecoration,
                dropdownWidth: dropdownWidth,
                backgroundColor: backgroundColor,
                textColor: textColor,
                iconColor: iconColor,
                dropdownItemsHeight: dropdownItemsHeight,
                initialTitle: initialTitle ?? "انتخاب کنید:",
                value: state.value ?? "",
                // value: state.value??value,
                onChanged: (value){
                  state.didChange(value);
                  onSelect!(value);
                },
                subTitleWidget: state.hasError
                    ? Builder(
                        builder: (BuildContext context) => FxText(
                            state.errorText.toString(),
                            color: InitialStyle.dangerColorRegular),
                      )
                    : null,
                list: list,
              );
            });
}
