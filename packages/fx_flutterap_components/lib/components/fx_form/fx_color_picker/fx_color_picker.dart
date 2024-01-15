import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FxColorPicker extends StatefulWidget {
  final String? title;
  final Widget? subTitleWidget;
  final void Function(Color?)? onChange;

  const FxColorPicker({
    Key? key,
    this.title,
    this.subTitleWidget,
    this.onChange,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxColorPickerState();
  }
}

class _FxColorPickerState extends State<FxColorPicker> {
  Color _buttonColor = InitialStyle.buttonColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FxButton(
            text: widget.title,
            fillColor: _buttonColor,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    titlePadding: const EdgeInsets.all(0),
                    contentPadding: const EdgeInsets.all(0),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ColorPicker(
                            pickerColor: InitialStyle.primaryDarkColor,
                            onColorChanged: (value) {
                              setState(() {
                                _buttonColor = value;
                              });
                              widget.onChange!(value);
                            },
                            colorPickerWidth: 300,
                            pickerAreaHeightPercent: 0.7,
                            enableAlpha: true,
                            labelTypes: const [
                              ColorLabelType.rgb,
                              ColorLabelType.hsl,
                              ColorLabelType.hsv,
                              ColorLabelType.hex,
                            ],
                            displayThumbColor: true,
                            paletteType: PaletteType.hsl,
                            pickerAreaBorderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(2),
                              topRight: Radius.circular(2),
                            ),
                            hexInputBar: true,
                            colorHistory: const [Colors.white],
                            onHistoryChanged: (value) {},
                          ),
                          const FxVSpacer(
                            big: true,
                          ),
                          FxButton(
                            text: "Confirm",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const FxVSpacer(
                            big: true,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const FxVSpacer(),
          widget.subTitleWidget ?? Container(),
        ],
      ),
    );
  }
}
