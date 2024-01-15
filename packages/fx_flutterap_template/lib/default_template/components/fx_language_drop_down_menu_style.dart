

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';

class FxLanguageDropDownMenuStyle extends StatelessWidget {
  final String value;
  final bool nightMode;
  final GlobalKey dropdownKey;
  final List<DropdownMenuItem<String>> items;

  const FxLanguageDropDownMenuStyle({
    Key? key,
    required this.value,
    required this.nightMode,
    required this.dropdownKey,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        key: dropdownKey,
        customButton: FxText(value,
          tag: Tag.h3,
          color: InitialStyle.icon,

        ),
        items: items,
        value: value,
        onChanged: (value) {},
        itemHeight: (InitialDims.space9),
        // buttonWidth: 300,
        barrierDismissible: true,
        // alignment: Alignment.centerRight,
        itemPadding: const EdgeInsets.all(0),
        dropdownWidth: (InitialDims.space11),
        dropdownDecoration: BoxDecoration(
            color: InitialStyle.cardColor,
            borderRadius:
                BorderRadius.all(Radius.circular(InitialDims.border2))),
        // dropdownElevation: 10,
        offset: Offset((InitialDims.space10) , 0),
      ),
    );
  }
}
