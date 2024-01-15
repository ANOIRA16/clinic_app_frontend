import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FxRingColorPicker extends StatefulWidget {
  final String? title;
  final Widget? subTitleWidget;
  final void Function(Color?)? onChange;

  const FxRingColorPicker({
    Key? key,
    this.title,
    this.subTitleWidget,
    this.onChange,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxRingColorPickerState();
  }
}

class _FxRingColorPickerState extends State<FxRingColorPicker> {
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
                    shape: RoundedRectangleBorder(
                      borderRadius: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? const BorderRadius.vertical(
                              top: Radius.circular(500),
                              bottom: Radius.circular(100),
                            )
                          : const BorderRadius.horizontal(
                              right: Radius.circular(500)),
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HueRingPicker(
                            pickerColor: InitialStyle.primaryDarkColor,
                            onColorChanged: (value) {
                              setState(() {
                                _buttonColor = value;
                              });
                              widget.onChange!(value);
                            },
                            enableAlpha: true,
                            displayThumbColor: true,
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
