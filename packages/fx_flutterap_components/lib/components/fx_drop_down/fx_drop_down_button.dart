import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../fx_button/fx_button.dart';
import 'fx_menu_dropdown_widget.dart';

class FxDropdownButton extends StatefulWidget {
  final List<Widget>? menuWidgetList;
  final List<void Function()>? menufunctionList;
  final Widget? buttonWidget;
  final String? buttonName;
  final Offset? menuOffset;
  final int num;
  final BoxDecoration? dropdownDecoration;
  final double? dropdownWidth;
  final double? dropdownItemsHeight;

  const FxDropdownButton({
    Key? key,
    this.menuWidgetList,
    this.menufunctionList,
    this.buttonWidget,
    this.buttonName,
    this.menuOffset,
    this.dropdownDecoration,
    this.dropdownWidth,
    this.dropdownItemsHeight,
    required this.num,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxDropdownButtonState();
  }
}

class _FxDropdownButtonState extends State<FxDropdownButton> {
  List<DropdownMenuItem<String>> _items = [];
  late GlobalKey _dropdownKey;
  late String _selectedValue;

  @override
  void initState() {
    // TODO: implement initState

    _selectedValue = "0";
    super.initState();
    _dropdownKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    _items = List.generate(
        widget.num,
        (index) => DropdownMenuItem(
              value: index.toString(),
              child: FxMenuDropdownWidget(
                buttonWidget: widget.menuWidgetList![index],
                onTap: () {
                  Navigator.pop(_dropdownKey.currentContext!);

                  setState(() {
                    _selectedValue = index.toString();
                    widget.menufunctionList![index];
                  });
                },
              ),
            ));

    return _dropDownWidget(_items);
  }

  Widget _dropDownWidget(List<DropdownMenuItem<String>> items) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        key: _dropdownKey,
        customButton: widget.buttonWidget ??
            FxButton(
              text: widget.buttonName ?? "DropDown",
              textColor: InitialStyle.onPrimaryColor,
              fillColor: InitialStyle.buttonColor,
              icon: FxSvgIcon(
                "packages/fx_flutterap_components/assets/svgs/down.svg",
                size: InitialDims.icon2,
                color: InitialStyle.onPrimaryColor,
              ),
              clickable: false,
            ),
        items: items,
        value: _selectedValue,
        onChanged: (value) {},
        itemHeight: widget.dropdownItemsHeight ?? (InitialDims.space10) ,
        // buttonWidth: 300,
        barrierDismissible: true,
        // alignment: Alignment.centerRight,
        itemPadding:  EdgeInsets.symmetric(horizontal: InitialDims.space1),
        dropdownWidth: widget.dropdownWidth ?? (InitialDims.space20),
        // dropdownPadding: EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: widget.dropdownDecoration ??
            BoxDecoration(
                color: InitialStyle.cardColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(InitialDims.border2))),

        offset: widget.menuOffset ?? const Offset(0, 0),
      ),
    );
  }
}
