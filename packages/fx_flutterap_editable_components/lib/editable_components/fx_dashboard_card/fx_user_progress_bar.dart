// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_vertical_dash_divider.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FxUserProgressBar extends StatelessWidget {
  final String? description;

  const FxUserProgressBar({
    Key? key,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double factor (){
     if ( ResponsiveLayot.isPhone(context)) {
       return 0.7;
     }

     if ( ResponsiveLayot.isTablet(context)) {
       return 0.7;
     }

      else {
       return 1;
     }
    }

    return SizedBox(
      height: (InitialDims.space25) * 3 / factor(),

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: InitialDims.space1,
          vertical: InitialDims.space1,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              FxText(
                description ?? AppLocalizations.of(context)!.loremmid,
                color: InitialStyle.textColor,
                tag:Tag.h4,
                align: TextAlign.justify,
                overFlowTag: true,
                maxLine: 3,
              ),
              const FxVSpacer(factor: 3),
              Wrap(
                runSpacing: InitialDims.space5,
                children: [
                  _dataColumn("314",AppLocalizations.of(context)!.loremshort,75,context),
                  _divider(),
                  _dataColumn("314",AppLocalizations.of(context)!.loremshort,25,context),
                  _divider(),
                  _dataColumn("314",AppLocalizations.of(context)!.loremshort,75,context),
                  _divider(),
                  _dataColumn("314",AppLocalizations.of(context)!.loremshort,25,context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dataColumn(
      String title,
      String description,
      int percent,
      BuildContext context){

    double factor (){
      if ( ResponsiveLayot.isPhone(context)) {
        return 0.8;
      }


      else {
        return 1;
      }
    }
    return  SizedBox(
      width: InitialDims.space20*2*factor(),
      child: Column(
        children: [
          _circularcindicator(percent,
               factor(),
              color: InitialStyle.specificColor),
           FxVSpacer(
            big: true,
            factor: 2*factor(),
          ),
          FxText(
            title,
            align: TextAlign.justify,
            overFlowTag: true,
            color: InitialStyle.titleTextColor,
            size: InitialDims.normalFontSize*factor(),
            isBold: true,
            maxLine: 3,
          ),
           FxVSpacer(
            big: true,
            factor: 2*factor(),
          ),
          FxText(
            description,
            size: InitialDims.subtitleFontSize,
            align: TextAlign.justify,
            overFlowTag: true,
            color: InitialStyle.titleTextColor,

            maxLine: 3,
          ),
           FxVSpacer(
            big: true,
            factor: 2*factor(),
          ),
        ],
      ),
    );

  }

  Widget _divider(){
    return  SizedBox(
      height: InitialDims.space17* 2,
      width: InitialDims.space1,
      child: FxVerticalDashDivider(),
    );
  }

  Widget _circularcindicator(int percent,double factor, {Color? color}) {

    return CircularPercentIndicator(
      radius: (InitialDims.space10*factor),
      lineWidth: InitialDims.icon1,
      animation: true,
      animationDuration: 1000,
      percent: percent / 100,
      center: FxText(
        "$percent%",
        color: InitialStyle.textColor,
        size: InitialDims.midTitleFontSize,
      ),
      progressColor: color ?? InitialStyle.primaryDarkColor,
      backgroundColor: InitialStyle.primaryLightColor,
    );
  }

}
