import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_group_button/fx_src.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';


class FxGroupButton extends StatefulWidget {
  final List<Widget> widgetList;

  final List<Function()>? onPressedList;
  final Widget Function(bool,String,BuildContext)? buttonBuilder;
  final List<int>? selectedIndexes;
  final List<int>? disabledIndexes;
  final bool? isRadio;
  final int? maxSelected;
  final int? initialSelectedindex;
  final double? spacing;
  final double? runSpacing;
  final double? buttonWidth;
  final double? buttonHeight;
  final BorderRadius? borderRadius;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final Color? selectedBorderColor;
  final Color? unSelectedBorderColor;
  final Axis? direction;

  const FxGroupButton({
    Key? key,
    required this.widgetList,
    required this.onPressedList,
    this.isRadio,
    this.selectedIndexes,
    this.disabledIndexes,
    this.maxSelected,
    this.initialSelectedindex,
    this.spacing,
    this.runSpacing,
    this.buttonWidth,
    this.buttonHeight,
    this.borderRadius,
    this.selectedColor,
    this.unSelectedColor,
    this.selectedBorderColor,
    this.unSelectedBorderColor,
    this.direction, this.buttonBuilder,
  }) : super(key: key);

  @override
  State<FxGroupButton> createState() => _FxGroupButtonState();
}

class _FxGroupButtonState extends State<FxGroupButton> {
  GroupButtonController controller = GroupButtonController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = GroupButtonController(
      // selectedIndex: 20,
      selectedIndexes:
          widget.selectedIndexes ?? [widget.initialSelectedindex ?? 0],

      disabledIndexes: widget.disabledIndexes ?? [],
      // onDisablePressed: (i) => print('Button #$i is disabled'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GroupButton(
        controller: controller,
        isRadio: widget.isRadio ?? false,
        enableDeselect: true,

        options: GroupButtonOptions(
          spacing: InitialDims.space1,
          runSpacing: InitialDims.space1,
          textPadding: EdgeInsets.all(InitialDims.space1),
          buttonWidth:widget.buttonWidth?? (InitialDims.space10) ,
          buttonHeight:widget.buttonHeight?? (InitialDims.space10) ,
          selectedBorderColor: widget.selectedBorderColor,
          unselectedBorderColor: widget.unSelectedBorderColor,
          unselectedColor:
              widget.unSelectedColor ?? InitialStyle.buttonColor,
          selectedColor:
              widget.selectedColor ?? InitialStyle.secondaryLightColor,

          direction: widget.direction ?? Axis.horizontal,
          borderRadius:widget.borderRadius??
              BorderRadius.all(Radius.circular(InitialDims.border2)),

        ),
        buttons: List.generate(widget.widgetList.length, (i) => ""),
        buttonBuilder:widget.buttonBuilder ,
        maxSelected: widget.maxSelected,
        onSelected: (val, i, selected) {

          widget.onPressedList![i]();
        },
        buttonsWidget: widget.widgetList);
  }
}
