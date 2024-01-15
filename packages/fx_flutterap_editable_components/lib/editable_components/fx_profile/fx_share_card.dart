import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_icon_button.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_text_field/fx_text_field_form.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_header.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxShareCard extends StatelessWidget {
  final String? name;
  final void Function()? onSave;
  final void Function()? onaddPictureFunction;
  final void Function()? onaddVideoFunction;
  final void Function()? onaddFileFunction;

  const FxShareCard({
    Key? key,
    this.name,
    this.onSave,
    this.onaddPictureFunction,
    this.onaddVideoFunction,
    this.onaddFileFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(
      padding: EdgeInsets.symmetric(
        vertical: InitialDims.space3,
        horizontal: InitialDims.space3,
      ),
      margin: EdgeInsets.all(InitialDims.space0),
      header: FxCardHeader(title: AppLocalizations.of(context)!.shareanactivity,),
      bodyPadding: EdgeInsets.all(InitialDims.space2),
      body: FxTextFieldForm(
        maxLines: 10,
        hint: AppLocalizations.of(context)!.sharesomthing,
      ),
      footer:  Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FxIconButton(
                FxSvgIcon(
                    "packages/fx_flutterap_components/assets/svgs/video.svg",
                    color: InitialStyle.primaryLightColor,
                    size: InitialDims.icon3),
                onTap: onaddVideoFunction,
              ),
              const FxHSpacer(
                big: true,
              ),
              FxIconButton(
                FxSvgIcon(
                    "packages/fx_flutterap_components/assets/svgs/image.svg",
                    color: InitialStyle.primaryLightColor,
                    size: InitialDims.icon3),
                onTap: onaddPictureFunction,
              ),
              const FxHSpacer(
                big: true,
              ),
              FxIconButton(
                FxSvgIcon(
                    "packages/fx_flutterap_components/assets/svgs/document.svg",
                    color: InitialStyle.primaryLightColor,
                    size: InitialDims.icon3),
                onTap: onaddFileFunction,
              ),
            ],
          ),
          FxIconButton(
            FxSvgIcon("packages/fx_flutterap_components/assets/svgs/send.svg",
                color: InitialStyle.primaryLightColor,
                size: InitialDims.icon3),
          ),
        ],
      ),
    );
  }
}
