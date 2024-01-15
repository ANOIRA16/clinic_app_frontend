//


import 'package:flutter/material.dart';
import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';



class DefaultDims {


  static  double screenFactor(BuildContext context) {
    if (ResponsiveLayot.isPhone(context)){
      return 190;
    }

     return 224;

  }



  static  double space0 (BuildContext context)=> 0;
  static  double space1 (BuildContext context)=> screenFactor(context) * 0.01785;//4
  static  double space2 (BuildContext context)=> screenFactor(context) * 0.0357;//8
  static  double space3 (BuildContext context)=> screenFactor(context) * 0.05357;//12
  static  double space4 (BuildContext context)=> screenFactor(context) * 0.0714;//16
  static  double space5 (BuildContext context)=> screenFactor(context) * 0.0892;//20
  static  double space6 (BuildContext context)=> screenFactor(context) * 0.1071;//24
  static  double space7 (BuildContext context)=> screenFactor(context) * 0.125;//28
  static  double space8 (BuildContext context)=> screenFactor(context) * 0.1428;//32
  static  double space9 (BuildContext context)=> screenFactor(context) * 0.1607;//36
  static  double space10 (BuildContext context)=> screenFactor(context) * 0.1785;//40
  static  double space11 (BuildContext context)=> screenFactor(context) * 0.1964;//44
  static  double space12 (BuildContext context)=> screenFactor(context) * 0.2142;//48
  static  double space13 (BuildContext context)=> screenFactor(context) * 0.2321;//52
  static  double space14 (BuildContext context)=> screenFactor(context) * 0.25;//56
  static  double space15 (BuildContext context)=> screenFactor(context) * 0.2678;//60
  static  double space16 (BuildContext context)=> screenFactor(context) * 0.2857;//64
  static  double space17 (BuildContext context)=> screenFactor(context) * 0.3035;//68
  static  double space18 (BuildContext context)=> screenFactor(context) * 0.3214;//72
  static  double space19 (BuildContext context)=> screenFactor(context) * 0.3392;//76
  static  double space20 (BuildContext context)=> screenFactor(context) * 0.3571;//80
  static  double space21 (BuildContext context)=> screenFactor(context) * 0.375;//84
  static  double space22 (BuildContext context)=> screenFactor(context) * 0.3928;//88
  static  double space23 (BuildContext context)=> screenFactor(context) * 0.4107;//92
  static  double space24 (BuildContext context)=> screenFactor(context) * 0.4285;//96
  static  double space25 (BuildContext context)=> screenFactor(context) * 0.4464;//100

  static  double icon1 (BuildContext context)=> screenFactor(context) * 0.026;//6
  static  double icon2 (BuildContext context)=> screenFactor(context) * 0.0535;//12
  static  double icon3 (BuildContext context)=> screenFactor(context) * 0.0803;//18
  static  double icon4 (BuildContext context)=> screenFactor(context) * 0.1071;//24
  static  double icon5 (BuildContext context)=> screenFactor(context) * 0.1319;//30
  static  double icon6 (BuildContext context)=> screenFactor(context) * 0.1607;//36
  static  double icon7 (BuildContext context)=> screenFactor(context) * 0.1875;//42
  static  double icon8 (BuildContext context)=> screenFactor(context) * 0.2142;//48
  static  double icon9 (BuildContext context)=> screenFactor(context) * 0.2410;//54
  static  double icon10 (BuildContext context)=> screenFactor(context) * 0.2678;//60

  static  double border0(BuildContext context)=> 0;
  static  double border1 (BuildContext context)=> screenFactor(context) * 0.02232;//5
  static  double border2 (BuildContext context)=> screenFactor(context) * 0.04464;//10
  static  double border3 (BuildContext context)=> screenFactor(context) * 0.06696;//15
  static  double border4 (BuildContext context)=> screenFactor(context) * 0.08928;//20
  static  double border5 (BuildContext context)=> screenFactor(context) * 0.11160;//25
  static  double defaultBorder (BuildContext context)=> screenFactor(context) * 0.06696;//25
  static  double fullBorder (BuildContext context)=> screenFactor(context) *1000;//25



  static  double extraTitleFontSize(BuildContext context) => screenFactor(context) * 0.321;

  static  double bigTitleFontSize(BuildContext context) => screenFactor(context) * 0.214;

  static  double highTitleFontSize(BuildContext context) => screenFactor(context) * 0.142;

  static  double midTitleFontSize(BuildContext context) => screenFactor(context) * 0.107;

  static  double titleFontSize(BuildContext context) => screenFactor(context) * 0.089;

  static  double normalFontSize(BuildContext context) => screenFactor(context) * 0.071;

  static  double subtitleFontSize(BuildContext context) => screenFactor(context) * 0.0535;

  static  double smallFontSize(BuildContext context) => screenFactor(context) * 0.0446;








}




