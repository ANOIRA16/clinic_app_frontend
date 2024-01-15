
import 'package:flutter/material.dart';

import 'default_dims.dart';


class DefaultStyles {


  static TextStyle inputStyle(BuildContext context) => TextStyle(color: primaryColor,
      fontSize: DefaultDims.smallFontSize(context));

  static BoxDecoration  cardDecoration(BuildContext context) =>BoxDecoration(
      color: DefaultStyles.secondaryColor,
      border: Border.all(color: DefaultStyles.secondaryDarkColor,width: 1),

      borderRadius: BorderRadius.all(Radius.circular(
          DefaultDims.border3(context)
      )));





  static const Color primaryColor = Color(0xffF0F4F9);
  static const Color primaryDarkColor = Color(0xff0E1726);
  static const Color primaryLightColor = Color(0xFFffffff);
  static const Color onPrimaryColor = Color(0xFFffffff);

  static const Color secondaryColor = Color(0xFFFCFCFC);
  static const Color secondaryDarkColor = Color(0xFFA1A1A1);
  static const Color secondaryLightColor = Color(0xffc9c7c7);
  static const Color onSecondaryColor = Color(0xFFffffff);

  static const Color specificColor = Colors.pink;

  static const  Color border = DefaultStyles.primaryDarkColor;

  static const  Color divider = DefaultStyles.secondaryLightColor;
  static const  Color shadow = Color(0xffF2F2F2);
  static const  Color icon = DefaultStyles.primaryDarkColor;
  static const  Color menu = DefaultStyles.buttonColor;
  
  static const  Color background = DefaultStyles.primaryColor;
  

  static const  Color hover = Colors.black38;
  static   Color buttonHover = Colors.white.withOpacity(.2);
  static const  Color buttonTextHover = DefaultStyles.primaryLightColor;
  static const  Color textHover = DefaultStyles.primaryLightColor;


  static const Color textInput = DefaultStyles.primaryDarkColor;
  static const Color labelInput = DefaultStyles.primaryDarkColor;
  static const Color hintInput = Color(0xFFffffff);
  static const  Color borderInput = DefaultStyles.secondaryLightColor;
  static const Color backgroundInput = Color(0xFFffffff);

  static const Color secondaryBorderColor = DefaultStyles.primaryDarkColor;
  
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF000000);

  static const Color buttonColor = DefaultStyles.primaryDarkColor;

  static const Color textColor = DefaultStyles.primaryDarkColor;
  static const Color secondaryTextColor = DefaultStyles.primaryLightColor;
  static const Color titleTextColor = DefaultStyles.secondaryDarkColor;
  static const Color sectionTitleTextColor = DefaultStyles.primaryLightColor;
  static const Color buttonTextColor = DefaultStyles.primaryLightColor;


  static const Color cardColor = Color(0xffF2F2F2);
  static const Color section = Color(0xFFffffff);

  static const MaterialColor gray = MaterialColor(
    _grayPrimaryValue,
    <int, Color>{
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEEEEEE),
      300: Color(0xFFE0E0E0),
      350: Color(0xFFD6D6D6), // only for raised button while pressed in light theme
      400: Color(0xFFBDBDBD),
      500: Color(_grayPrimaryValue),

    },
  );
  static const int _grayPrimaryValue = 0xFFF44336;

  



}





class SocialNetworkColor {
  static const Color facebookColor = Color(0xFF3B5998);
  static const Color googleColor = Color(0xFFDB4437);
  static const Color instagramColor = Color(0xFF517FA4);
  static const Color youtubeColor = Color(0xFFB31217);
  static const Color linkedinColor = Color(0xFF0077B5);
  static const Color tweeterColor = Color(0xFF55ACEE);
  static const Color whatsappColor = Color(0xFF34B521);

}

class WarningColor {
  static const Color warningColorRegular = Color(0xFFFF8300);
  static const Color warningColorLight = Color(0xFFFFE6CC);
  static const Color warningColorDark = Color(0xFFBB4504);

}

class InformationColor {
  static const Color informationColorRegular = Color(0xFF0F5095);
  static const Color informationColorLight = Color(0xFFE1EFFF);
  static const Color informationColorDark = Color(0xFF032465);
}

class DangerColor {

  static const Color dangerColorRegular = Color(0xFFD32B2B);
  static const Color dangerColorLight = Color(0xFFF8D7DA);
  static const Color dangerColorDark = Color(0xFF5E1313);
}

class SuccessColor {
  static const Color successColorRegular = Color(0xFF91C716);
  static const Color successColorLight = Color(0xFFCEF5EA);
  static const Color successColorDark = Color(0xFF246434);
}

class DisableColor {
  static const Color disabledColorRegular = Color(0xFF8C8E93);
  static const Color disabledColorLight = Color(0xFFD4D5D8);
  static const Color disabledColorDark = Color(0xFF484747);
}
