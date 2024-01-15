// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_vertical_dash_divider.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_header.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FxWeatherCard extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  FxWeatherCard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FxWeatherCardState();
}

class FxWeatherCardState extends State {
  @override
  Widget build(BuildContext context) {
    double factor = (ResponsiveLayot.isTablet(context) ||
            ResponsiveLayot.isLargeTablet(context))
        ? 0.7
        : 1;

    return FxCard(
      height: (InitialDims.space20) * 3,
      padding: EdgeInsets.symmetric(
        vertical: InitialDims.space3,
        horizontal: InitialDims.space3,
      ),
      margin: EdgeInsets.all(InitialDims.space0),
      header: FxCardHeader(
        title: AppLocalizations.of(context)!.weather,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: InitialDims.space1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: InitialDims.space3,
                            ),
                            child: FxText(
                              "73",
                              size: InitialDims.extraTitleFontSize * factor,
                              color: InitialStyle.titleTextColor,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: FxText(
                              "°F",
                              color: InitialStyle.titleTextColor,
                            ),
                          )
                        ],
                      ),
                      FxText(
                        AppLocalizations.of(context)!.cityname,
                        tag: Tag.h4,
                        align: TextAlign.start,
                        color: InitialStyle.secondaryTextColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: InitialDims.space15 * 2,
                    width: InitialDims.space3,
                    child: FxVerticalDashDivider(
                      dashWidth: 2,
                    )),
                Expanded(
                  flex: 5,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      FxAvatarImage(
                        path:
                            "packages/fx_flutterap_components/assets/images/rain.png",
                        size: InitialDims.space10,
                        isrectangle: true,
                        borderRadius: InitialDims.border3,
                      ),
                      FxHSpacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText(
                            AppLocalizations.of(context)!.rainyday,
                          ),
                          FxVSpacer(),
                          FxText(
                            "${AppLocalizations.of(context)!.apri} 14",
                            tag: Tag.h5,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
