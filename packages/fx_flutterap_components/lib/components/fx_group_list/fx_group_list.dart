import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxGroupList extends StatelessWidget {
  final List<Widget> widgetList;
  final Widget? divider;
  final List<BoxDecoration>? decorationList;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? itemPadding;

  const FxGroupList({
    Key? key,
    required this.widgetList,
    this.divider,
    this.decoration,
    this.decorationList,
    this.itemPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BoxDecoration> decorationList0 = decorationList ??
        List.generate(widgetList.length, (index) => const BoxDecoration());

    return Container(
      decoration: decoration ??
          const BoxDecoration(
              // border: Border.all(color: Colors.black)
              ),
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          //container will be as same size as  listview size
          itemCount: widgetList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: decorationList0[index],
              padding: itemPadding ?? EdgeInsets.all(InitialDims.space2),
              child: widgetList[index],
            );
          },
          separatorBuilder: (context, index) {
            return divider ?? const FxHDivider();
          }),
    );
  }
}
