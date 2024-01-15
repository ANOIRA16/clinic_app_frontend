import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import '../../fx_image/fx_svg_icon.dart';

class FxCustomCheckBox extends StatefulWidget {
  final Widget? nonSelectedIcon;
  final Widget? selectedIcon;
  final Widget? subTitleWidget;
  final Widget? titleWidget;
  final bool value;
  final bool? disabled;
  final ValueChanged<bool> onChanged;

  const FxCustomCheckBox({
    Key? key,
    this.nonSelectedIcon,
    this.selectedIcon,
    this.titleWidget,
    this.subTitleWidget,
    this.disabled,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxCustomCheckBoxState();
  }
}

class _FxCustomCheckBoxState extends State<FxCustomCheckBox> {
  bool _selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: InkWell(
            onTap: () {
              widget.disabled ?? false ? null : _onTap();
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.disabled ?? false
                        ? FxSvgIcon(
                            "packages/fx_flutterap_components/assets/svgs/square.svg",
                            size: InitialDims.icon3,
                            color: InitialStyle.secondaryDarkColor,
                          )
                        : _selected
                            ? (widget.selectedIcon ??
                                FxSvgIcon(
                                  "packages/fx_flutterap_components/assets/svgs/ticksquare.svg",
                                  size: InitialDims.icon3,
                                  color: InitialStyle.icon,
                                ))
                            : (widget.nonSelectedIcon ??
                                FxSvgIcon(
                                  "packages/fx_flutterap_components/assets/svgs/square.svg",
                                  size: InitialDims.icon3,
                                  color: InitialStyle.icon,
                                )),
                    const FxHSpacer(
                      big: true,
                    ),
                    widget.titleWidget ?? Container(),
                  ],
                ),
                const FxVSpacer(),
                widget.subTitleWidget ?? Container()
              ],
            )));
  }

  void _onTap() {
    setState(() {
      _selected = !_selected;
    });
    widget.onChanged(_selected);
  }
}
