// ignore_for_file: prefer_const_constructors
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_divider.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_table/fx_simple_table.dart';

import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';

class FxBill extends StatelessWidget {
  final bool? isPrinting;

  const FxBill({Key? key, this.isPrinting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: InitialStyle.section,
      padding: EdgeInsets.all(InitialDims.space2),
      child: (ResponsiveLayot.isComputer(context) ||
              ResponsiveLayot.isLargeTablet(context) ||
              ResponsiveLayot.isTablet(context))
          ? _computerBill(context, isPrinting ?? false)
          : _mobileBill(context, isPrinting ?? false),
    );
  }
}

Widget _computerBill(BuildContext context, bool isPrinting) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FxText(
            AppLocalizations.of(context)?.bill ?? "" "#114114314",
            tag: Tag.h2,
            color: InitialStyle.titleTextColor,
          ),
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 3,
      ),
      const FxHDivider(),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 3,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
          FxText(
            "104",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 2,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
        ],
      ),
      const FxVSpacer(
        big: true,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      FxSimpleTable(
        zebraMode: true,
        zebraColor: InitialStyle.secondaryColor,
        headingColor: InitialStyle.buttonColor,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(InitialDims.border3)),
            color: InitialStyle.section),
        rowsContent: [
          [
            FxText("1"),
            FxText( AppLocalizations.of(context)!.bannerdesign,),
            FxText("2"),
            FxText(
              "20000 ${AppLocalizations.of(context)?.currencyunit ?? ""}",
            ),
            FxText("40000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
          ],
          [
            FxText("2"),
            FxText( AppLocalizations.of(context)!.logodesign,),
            FxText("2"),
            FxText("20000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
            FxText("40000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
          ],
          [
            FxText("3"),
            FxText( AppLocalizations.of(context)!.printad,),
            FxText("3"),
            FxText("20000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
            FxText("60000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
          ],
          [
            FxText("4"),
            FxText( AppLocalizations.of(context)!.appdesign,),
            FxText("2"),
            FxText(
                "100000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
            FxText(
                "200000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
          ],
        ],
        columnTitle: [
          FxText(
            "#",
            color: InitialStyle.primaryLightColor,
          ),
          FxText(AppLocalizations.of(context)?.description ?? "",
              tag: Tag.h3, color: InitialStyle.primaryLightColor),
          FxText(AppLocalizations.of(context)?.number ?? "",
              tag: Tag.h3, color: InitialStyle.primaryLightColor),
          FxText(AppLocalizations.of(context)?.price ?? "",
              tag: Tag.h3, color: InitialStyle.primaryLightColor),
          FxText(AppLocalizations.of(context)?.totalamountp ?? "",
              tag: Tag.h3, color: InitialStyle.primaryLightColor)
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 3,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.totalamount ?? "",
            color: InitialStyle.secondaryTextColor,
          )
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 3,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.tax ?? "",
            color: InitialStyle.secondaryTextColor,
          )
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.totalbill ?? "",
            tag: Tag.h2,
            color: InitialStyle.textColor,
          )
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FxText(
            AppLocalizations.of(context)?.loremmid ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          )
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      const FxHDivider(),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      isPrinting
          ? Container()
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FxButton(
                  text: AppLocalizations.of(context)?.print,
                  icon: Icon(
                    Icons.print,
                    color: InitialStyle.primaryLightColor,
                    size: InitialDims.icon3,
                  ),
                ),
                const FxHSpacer(),
                FxButton(
                  text: AppLocalizations.of(context)?.sendbill,
                  icon: Icon(
                    Icons.send,
                    color: InitialStyle.primaryLightColor,
                    size: InitialDims.icon3,
                  ),
                ),
              ],
            ),
    ],
  );
}

Widget _mobileBill(BuildContext context, bool isPrinting) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.bill ?? "" "#114114314",
            tag: Tag.h1,
            color: InitialStyle.secondaryTextColor,
          ),
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 3,
      ),
      const FxHDivider(),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 3,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
          FxText(
            "104",
            color: InitialStyle.secondaryTextColor,
            tag: Tag.h3,
          ),
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 2,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
        ],
      ),
      const FxVSpacer(
        big: true,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
          FxText(
            AppLocalizations.of(context)?.loremshort ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          ),
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      FxSimpleTable(
        zebraMode: true,
        zebraColor: InitialStyle.secondaryTextColor,
        headingColor: InitialStyle.buttonColor,
        verticalModeBreakPoint: ResponsiveLayot.tabletLimit,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(InitialDims.border3)),
            color: InitialStyle.section),
        rowsContent: [
          [
            FxText("1"),
            FxText(AppLocalizations.of(context)!.bannerdesign,),
            FxText("2"),
            FxText(
              "20000 ${AppLocalizations.of(context)?.currencyunit ?? ""}",
            ),
            FxText("40000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
          ],
          [
            FxText("2"),
            FxText(AppLocalizations.of(context)!.logodesign,),
            FxText("2"),
            FxText("20000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
            FxText("40000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
          ],
          [
            FxText("3"),
            FxText(AppLocalizations.of(context)!.printad,),
            FxText("3"),
            FxText("20000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
            FxText("60000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
          ],
          [
            FxText("4"),
            FxText(AppLocalizations.of(context)!.appdesign,),
            FxText("2"),
            FxText(
                "100000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
            FxText(
                "200000 ${AppLocalizations.of(context)?.currencyunit ?? ""}"),
          ],
        ],
        columnTitle: [
          FxText(
            "#",
            color: InitialStyle.secondaryTextColor,
            tag: Tag.h3,
          ),
          FxText(AppLocalizations.of(context)?.description ?? "",
              tag: Tag.h3, color: InitialStyle.secondaryTextColor),
          FxText(AppLocalizations.of(context)?.number ?? "",
              tag: Tag.h3, color: InitialStyle.secondaryTextColor),
          FxText(AppLocalizations.of(context)?.price ?? "",
              tag: Tag.h3, color: InitialStyle.secondaryTextColor),
          FxText(AppLocalizations.of(context)?.totalamountp ?? "",
              tag: Tag.h3, color: InitialStyle.secondaryTextColor)
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 3,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.totalamount ?? "",
            color: InitialStyle.secondaryTextColor,
          )
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 3,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.tax ?? "",
            color: InitialStyle.secondaryTextColor,
          )
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText(
            AppLocalizations.of(context)?.loremmid ?? "",
            tag: Tag.h3,
            color: InitialStyle.secondaryTextColor,
          )
        ],
      ),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      const FxHDivider(),
      const FxVSpacer(
        big: true,
        factor: 5,
      ),
      isPrinting
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxButton(
                  text: AppLocalizations.of(context)?.print,
                  onTap: () {},
                  icon: Icon(
                    Icons.print,
                    color: InitialStyle.primaryLightColor,
                    size: InitialDims.icon3,
                  ),
                ),
                const FxVSpacer(
                  big: true,
                ),
                FxButton(
                  text: AppLocalizations.of(context)?.sendbill,
                  icon: Icon(
                    Icons.send,
                    color: InitialStyle.primaryLightColor,
                    size: InitialDims.icon3,
                  ),
                ),
              ],
            ),
    ],
  );
}
