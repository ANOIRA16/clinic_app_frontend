import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';


import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxPriceCard extends StatelessWidget {
  final List<String> titleList;
  final List<bool> checkList;
  final String? price;
  final PriceCardType? priceCardType;

  const FxPriceCard({
    Key? key,
    required this.titleList,
    this.price,
    required this.checkList,
    this.priceCardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PriceCardType priceCardType0 = priceCardType ?? PriceCardType.forStart;
    String price0 = price ?? AppLocalizations.of(context)!.free;
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: InitialDims.space5,
          horizontal: InitialDims.space5,
        ),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(InitialDims.border3)),
            border: Border.all(color: InitialStyle.borderInput)),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  FxText(
                    _title(priceCardType0, context),
                  ),
                  const FxVSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FxText(
                        AppLocalizations.of(context)!.yearly,tag:Tag.h5,
                      ),
                      const FxHSpacer(),
                      FxText(
                        price0,
                        tag:Tag.h2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const FxVSpacer(
              big: true,
              factor: 3,
            ),
            Expanded(
              flex: 21,
              child: SingleChildScrollView(
                child: Column(
                    children: List.generate(
                        titleList.length,
                        (index) => Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: checkList[index]
                                          ? Image.asset(
                                              "packages/fx_flutterap_components/assets/images/tick.png",
                                              width: InitialDims.icon3,
                                              height: InitialDims.icon3,
                                            )
                                          : Image.asset(
                                              "packages/fx_flutterap_components/assets/images/cross.png",
                                              width: InitialDims.icon3,
                                              height: InitialDims.icon3,
                                            ),
                                    ),
                                    const FxHSpacer(),
                                    Expanded(
                                      flex: 7,
                                      child: FxText(
                                        titleList[index],
                                        align: TextAlign.start,
                                        isBold: true,
                                      ),
                                    )
                                  ],
                                ),
                                const FxVSpacer(
                                  big: true,
                                  factor: 3,
                                )
                              ],
                            ))),
              ),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: FxButton(
                  text: AppLocalizations.of(context)!.teststart,
                ),
              ),
            )
          ],
        ));
  }

  String _title(PriceCardType priceCardType, BuildContext context) {
    if (priceCardType == PriceCardType.forStart) {
      return AppLocalizations.of(context)!.forstart;
    }
    if (priceCardType == PriceCardType.primary) {
      return AppLocalizations.of(context)!.primary;
    }
    if (priceCardType == PriceCardType.golden) {
      return AppLocalizations.of(context)!.golden;
    } else {
      return AppLocalizations.of(context)!.forstart;
    }
  }
}

enum PriceCardType { forStart, primary, golden }
