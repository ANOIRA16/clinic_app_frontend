import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_variable_height_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxInformationButton extends StatelessWidget {
  final Widget? icon;
  final String dialogeText;
  final Color? colorAsset;
  final Color? buttonFontColor;
  final Color? buttonBorderColor;
  final Color? buttonShadowColor;
  final double? size;
  final TextAlign? align;

  const FxInformationButton({
    Key? key,
    this.icon,
    this.dialogeText = "",
    this.colorAsset,
    this.buttonFontColor,
    this.buttonBorderColor,
    this.buttonShadowColor,
    this.size,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget customDialog() {
      return Dialog(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            constraints: BoxConstraints(maxWidth: InitialDims.space25*5),
            color: InitialStyle.section,
            child: Container(
              padding: EdgeInsets.all(InitialDims.space2),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FxVariableHeightText(
                      dialogeText,
                      color: InitialStyle.titleTextColor,
                      tag: Tag.h5,
                      height:1.7,
                      align: align ?? TextAlign.left,
                    ),
                    const FxVSpacer(
                      big: true,
                      factor: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Clipboard.setData(
                                ClipboardData(text: dialogeText));
                            // copied successfully
                          },
                          child: Row(
                            children: [
                              FxSvgIcon(
                                "packages/fx_flutterap_components/assets/svgs/clipboard.svg",
                                size: InitialDims.icon3,
                              ),
                              FxText(
                                "Copy",
                                tag: Tag.h5,
                                color: InitialStyle.titleTextColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return IntrinsicWidth(
      child: InkWell(
          onTap: () {
            showDialog(context: context, builder: (context) => customDialog());
          },
          child: icon ??
              FxSvgIcon("packages/fx_flutterap_components/assets/svgs/info.svg",
                  color: buttonFontColor ?? InitialStyle.icon,
                  size: size ?? InitialDims.normalFontSize)),
    );
  }
}
