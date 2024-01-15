import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_text_field/fx_text_field.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_config.dart';
import '../structure/structure_dims.dart';
import '../structure/structure_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FxSearchTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final bool? nightMode;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const FxSearchTextField(
      {Key? key,
        this.width,
        this.height,
        this.nightMode,
        this.onChanged,
        this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        left: InitialDims.space2,
        right: InitialDims.space2,
      ),
      child: FxTextField(
        controller: controller,
        onChanged: onChanged,
        hint: AppLocalizations.of(context)!.search,
        fillColor: InitialStyle.primaryDarkColor,
        borderColor:InitialStyle.primaryDarkColor ,
        hintStyle:TextStyle(
            fontFamily: InitialConfig.fontFamily,
            color: InitialStyle.primaryLightColor
        ),
        textStyle: TextStyle(
          fontFamily: InitialConfig.fontFamily,
          color: InitialStyle.primaryLightColor
        ),

        prefixIcon: Padding(
          padding: EdgeInsets.all(InitialDims.space2),
          child: FxSvgIcon(
            "packages/fx_flutterap_components/assets/svgs/search_white.svg",
            color: InitialStyle.primaryLightColor,
            size: InitialDims.icon2,
          ),
        ),
      ),
    );
  }
}
