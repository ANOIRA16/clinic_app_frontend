// ignore_for_file: prefer_const_constructors, unused_field
import 'package:flutter/material.dart';
import 'package:fx_flutterap_kernel/structure/default_styles.dart';

abstract class StructureStyles {
  final BuildContext _context;

  late Color _primaryColor;
  late Color _secondaryColor;
  late Color _secondaryDarkColor;
  late Color _secondaryLightColor;
  late Color _onPrimaryColor;
  late Color _onSecondaryColor;
  late Color _specificColor;
  late Color _primaryDarkColor;
  late Color _primaryLightColor;

  late Color _cardColor;
  late Color _section;

  late MaterialColor _gray;

  late Color _background;
  late Color _shadow;
  late Color _border;
  late Color _borderInput;
  late Color _hover;
  late Color _buttonHover;
  late Color _buttonTextHover;
  late Color _textHover;
  late Color _icon;
  late Color _divider;
  late Color _menu;

  late Color _black;
  late Color _hintInput;
  late Color _labelInput;
  late Color _textInput;
  late Color _secondaryBorderColor;
  late Color _backgroundInput;
  late Color _white;

  TextStyle? _inputStyle;

  BoxDecoration? _cardDecoration;

  late Color _buttonColor;

  late Color _textColor;

  late Color _secondaryTextColor;

  late Color _titleTextColor;

  late Color _sectionTitleTextColor;

  late Color _buttonTextColor;

  late Color _socialNetworkColorFacebook;

  late Color _socialNetworkColorGoogle;

  late Color _socialNetworkColorWhatsapp;
  late Color _socialNetworkColorTweeter;
  late Color _socialNetworkColorYoutube;

  late Color _socialNetworkColorLinkedin;

  late Color _socialNetworkColorInstagram;

  late Color _warningColorLight;

  late Color _warningColorRegular;

  late Color _warningColorDark;

  late Color _informationColorDark;

  late Color _informationColorLight;
  late Color _informationColorRegular;

  late Color _dangerColorRegular;

  late Color _dangerColorLight;

  late Color _dangerColorDark;

  late Color _successColorDark;

  late Color _successColorLight;

  late Color _successColorRegular;

  late Color _disableColorRegular;

  late Color _disableColorLight;

  late Color _disableColorDark;

  StructureStyles(this._context) {
    _primaryColor = DefaultStyles.primaryColor;
    _secondaryColor = DefaultStyles.secondaryColor;
    _secondaryDarkColor = DefaultStyles.secondaryDarkColor;
    _secondaryLightColor = DefaultStyles.secondaryLightColor;
    _onPrimaryColor = DefaultStyles.onPrimaryColor;
    _onSecondaryColor = DefaultStyles.onSecondaryColor;
    _specificColor = DefaultStyles.specificColor;
    _primaryDarkColor = DefaultStyles.primaryDarkColor;
    _primaryLightColor = DefaultStyles.primaryLightColor;

    _cardColor = DefaultStyles.cardColor;
    _section = const Color(0xFFffffff);

    _gray = DefaultStyles.gray;

    _background = DefaultStyles.background;
    _shadow = DefaultStyles.shadow;
    _border = DefaultStyles.border;
    _borderInput = DefaultStyles.borderInput;
    _hover = DefaultStyles.hover;
    _buttonHover = DefaultStyles.buttonHover;
    _buttonTextHover = DefaultStyles.buttonTextHover;
    _textHover = DefaultStyles.textHover;
    _icon = DefaultStyles.icon;
    _divider = DefaultStyles.divider;
    _menu = DefaultStyles.menu;

    _black = DefaultStyles.black;
    _hintInput = DefaultStyles.hintInput;
    _labelInput = DefaultStyles.labelInput;
    _textInput = DefaultStyles.textInput;
    _secondaryBorderColor = DefaultStyles.secondaryBorderColor;
    _backgroundInput = DefaultStyles.backgroundInput;
    _white = DefaultStyles.white;

    _inputStyle = DefaultStyles.inputStyle(_context);
    _cardDecoration = DefaultStyles.cardDecoration(_context);

    _buttonColor = DefaultStyles.buttonColor;

    _textColor = DefaultStyles.textColor;
    _secondaryTextColor = DefaultStyles.secondaryTextColor;
    _titleTextColor = DefaultStyles.titleTextColor;
    _sectionTitleTextColor = DefaultStyles.sectionTitleTextColor;
    _buttonTextColor = DefaultStyles.buttonTextColor;

    _socialNetworkColorFacebook = SocialNetworkColor.facebookColor;
    _socialNetworkColorGoogle = SocialNetworkColor.googleColor;
    _socialNetworkColorWhatsapp = SocialNetworkColor.whatsappColor;
    _socialNetworkColorTweeter = SocialNetworkColor.tweeterColor;
    _socialNetworkColorYoutube = SocialNetworkColor.youtubeColor;
    _socialNetworkColorLinkedin = SocialNetworkColor.linkedinColor;
    _socialNetworkColorInstagram = SocialNetworkColor.instagramColor;

    _warningColorLight = WarningColor.warningColorLight;
    _warningColorRegular = WarningColor.warningColorRegular;
    _warningColorDark = WarningColor.warningColorDark;

    _informationColorDark = InformationColor.informationColorDark;
    _informationColorLight = InformationColor.informationColorLight;
    _informationColorRegular = InformationColor.informationColorRegular;

    _dangerColorRegular = DangerColor.dangerColorRegular;
    _dangerColorLight = DangerColor.dangerColorLight;
    _dangerColorDark = DangerColor.dangerColorDark;

    _successColorDark = SuccessColor.successColorDark;
    _successColorLight = SuccessColor.successColorLight;
    _successColorRegular = SuccessColor.successColorRegular;

    _disableColorRegular = DisableColor.disabledColorRegular;
    _disableColorLight = DisableColor.disabledColorLight;
    _disableColorDark = DisableColor.disabledColorDark;
  }
}

class InitialStyle extends StructureStyles {
  static late Color primaryColor;
  static late Color secondaryColor;
  static late Color secondaryDarkColor;
  static late Color secondaryLightColor;
  static late Color onPrimaryColor;
  static late Color onSecondaryColor;
  static late Color specificColor;
  static late Color primaryDarkColor;
  static late Color primaryLightColor;
  static late Color cardColor;
  static late Color section;

  static late MaterialColor gray;

  static late Color background;
  static late Color shadow;
  static late Color border;
  static late Color borderInput;
  static late Color hover;
  static late Color buttonHover;
  static late Color buttonTextHover;
  static late Color textHover;

  static late Color icon;

  static late Color divider;
  static late Color menu;
  static late Color black;

  static late Color hintInput;
  static late Color labelInput;
  static late Color textInput;
  static late Color secondaryBorderColor;
  static late Color backgroundInput;
  static late Color white;

  static TextStyle? inputStyle;
  static BoxDecoration? cardDecoration;

  static late Color buttonColor;

  static late Color textColor;
  static late Color secondaryTextColor;
  static late Color titleTextColor;
  static late Color sectionTitleTextColor;
  static late Color buttonTextColor;

  static late Color socialNetworkColorFacebook;
  static late Color socialNetworkColorGoogle;
  static late Color socialNetworkColorWhatsapp;
  static late Color socialNetworkColorTweeter;
  static late Color socialNetworkColorYoutube;
  static late Color socialNetworkColorLinkedin;
  static late Color socialNetworkColorInstagram;

  static late Color warningColorLight;
  static late Color warningColorRegular;
  static late Color warningColorDark;

  static late Color informationColorDark;
  static late Color informationColorLight;
  static late Color informationColorRegular;

  static late Color dangerColorRegular;
  static late Color dangerColorLight;
  static late Color dangerColorDark;

  static late Color successColorDark;
  static late Color successColorLight;
  static late Color successColorRegular;

  static late Color disableColorRegular;
  static late Color disableColorLight;
  static late Color disableColorDark;

  InitialStyle(
      BuildContext context, {
        Color? primaryColor,
        Color? secondaryColor,
        Color? secondaryDarkColor,
        Color? secondaryLightColor,
        Color? onPrimaryColor,
        Color? onSecondaryColor,
        Color? specificColor,
        Color? primaryDarkColor,
        Color? primaryLightColor,
        Color? cardColor,
        Color? section,
        MaterialColor? gray,
        Color? background,
        Color? shadow,
        Color? border,
        Color? borderInput,
        Color? hover,
        Color? buttonHover,
        Color? buttonTextHover,
        Color? textHover,
        Color? icon,
        Color? divider,
        Color? menu,
        Color? black,
        Color? hintInput,
        Color? labelInput,
        Color? textInput,
        Color? secondaryBorderColor,
        Color? backgroundInput,
        Color? white,
        TextStyle? inputStyle,
        BoxDecoration? cardDecoration,
        Color? buttonColor,
        Color? textColor,
        Color? secondaryTextColor,
        Color? titleTextColor,
        Color? sectionTitleTextColor,
        Color? buttonTextColor,
        Color? socialNetworkColorFacebook,
        Color? socialNetworkColorGoogle,
        Color? socialNetworkColorWhatsapp,
        Color? socialNetworkColorTweeter,
        Color? socialNetworkColorYoutube,
        Color? socialNetworkColorLinkedin,
        Color? socialNetworkColorInstagram,
        Color? warningColorLight,
        Color? warningColorRegular,
        Color? warningColorDark,
        Color? informationColorDark,
        Color? informationColorLight,
        Color? informationColorRegular,
        Color? dangerColorRegular,
        Color? dangerColorLight,
        Color? dangerColorDark,
        Color? successColorDark,
        Color? successColorLight,
        Color? successColorRegular,
        Color? disableColorRegular,
        Color? disableColorLight,
        Color? disableColorDark,
      }) : super(context) {
    InitialStyle.primaryColor = primaryColor ?? Color(0xff3761EB);
    InitialStyle.onPrimaryColor = onPrimaryColor ?? Color(0xffFFFFFF);
    InitialStyle.primaryDarkColor = primaryDarkColor ?? Color(0xff0C2780);
    InitialStyle.primaryLightColor = primaryLightColor ?? Color(0xffE9EDFA);

    InitialStyle.secondaryColor = secondaryColor ?? Color(0xff3395d7);
    InitialStyle.onSecondaryColor = onSecondaryColor ?? Color(0xffFFFFFF);
    InitialStyle.secondaryDarkColor = secondaryDarkColor ?? Color(0xff2b8dd0);
    InitialStyle.secondaryLightColor = secondaryLightColor ?? Color(0xff3C4252);

    InitialStyle.specificColor = specificColor ?? Color(0xff38BDF8);

    InitialStyle.buttonTextColor = buttonTextColor ?? Color(0xffFFFFFF);
    InitialStyle.buttonColor = buttonColor ?? Color(0xff1772af);
    InitialStyle.textColor = textColor ?? Color(0xffa9a9a9);
    InitialStyle.titleTextColor = titleTextColor ?? Color(0xff0F172A);
    InitialStyle.secondaryTextColor = secondaryTextColor ?? Color(0xffffffff);
    InitialStyle.sectionTitleTextColor =
        sectionTitleTextColor ?? Color(0xffFFFFFF);

    InitialStyle.border = border ?? Color(0xffE4E6E8);
    InitialStyle.divider = divider ?? Color(0xffE6E7EA);
    InitialStyle.shadow = shadow ?? Color(0x21000000);
    InitialStyle.icon = icon ?? Color(0xff3761EB);
    InitialStyle.menu = menu ?? Color(0xffFFFFFF);
    InitialStyle.cardColor = cardColor ?? Color(0xffFFFFFF);
    InitialStyle.background = background ?? Color(0xffFAFAFA);
    InitialStyle.section = section ?? Color(0xffFFFFFF);
    InitialStyle.hover = hover ?? DefaultStyles.hover;
    InitialStyle.buttonHover = buttonHover ?? DefaultStyles.buttonHover;
    InitialStyle.textHover = textHover ?? DefaultStyles.textHover;
    InitialStyle.buttonTextHover =
        buttonTextHover ?? DefaultStyles.buttonTextHover;

    InitialStyle.backgroundInput = backgroundInput ?? Color(0xffF3F3F5);
    InitialStyle.borderInput = borderInput ?? Color(0xffCDCDCD);
    InitialStyle.hintInput = hintInput ?? Color(0xff8D8B8B);
    InitialStyle.labelInput = labelInput ?? Color(0xff64748B);
    InitialStyle.textInput = textInput ?? Color(0xff4b4b4b);

    InitialStyle.secondaryBorderColor =
        secondaryBorderColor ?? Color(0xffffffff);

    InitialStyle.gray = gray ?? super._gray;
    InitialStyle.black = black ?? super._black;
    InitialStyle.white = white ?? Color(0xffFFFFFF);

    InitialStyle.socialNetworkColorFacebook =
        socialNetworkColorFacebook ?? super._socialNetworkColorFacebook;
    InitialStyle.socialNetworkColorGoogle =
        socialNetworkColorGoogle ?? super._socialNetworkColorGoogle;
    InitialStyle.socialNetworkColorWhatsapp =
        socialNetworkColorWhatsapp ?? super._socialNetworkColorWhatsapp;
    InitialStyle.socialNetworkColorTweeter =
        socialNetworkColorTweeter ?? super._socialNetworkColorTweeter;
    InitialStyle.socialNetworkColorYoutube =
        socialNetworkColorYoutube ?? super._socialNetworkColorYoutube;
    InitialStyle.socialNetworkColorLinkedin =
        socialNetworkColorLinkedin ?? super._socialNetworkColorLinkedin;
    InitialStyle.socialNetworkColorInstagram =
        socialNetworkColorInstagram ?? super._socialNetworkColorInstagram;

    InitialStyle.warningColorLight = warningColorLight ?? Color(0xffFDD368);
    InitialStyle.warningColorRegular = warningColorRegular ?? Color(0xffFFB800);
    InitialStyle.warningColorDark = warningColorDark ?? Color(0xffE4A400);
    InitialStyle.informationColorDark =
        informationColorDark ?? Color(0xff2145BC);
    InitialStyle.informationColorLight =
        informationColorLight ?? Color(0xff7393FF);
    InitialStyle.informationColorRegular =
        informationColorRegular ?? Color(0xff3761EB);

    InitialStyle.dangerColorRegular = dangerColorRegular ?? Color(0xffD70D0D);
    InitialStyle.dangerColorLight = dangerColorLight ?? Color(0XFFF8D0D0);
    InitialStyle.dangerColorDark = dangerColorDark ?? Color(0xffD70D0D);

    InitialStyle.successColorDark = successColorDark ?? Color(0xff009C3F);
    InitialStyle.successColorLight = successColorLight ?? Color(0xffC0FCD8);
    InitialStyle.successColorRegular = successColorRegular ?? Color(0xff02B74A);

    InitialStyle.disableColorRegular = disableColorRegular ?? Color(0xffB1B1B1);
    InitialStyle.disableColorLight = disableColorLight ?? Color(0xffE2E2E2);
    InitialStyle.disableColorDark = disableColorDark ?? Color(0xff575857);

    InitialStyle.inputStyle = inputStyle ?? super._inputStyle;
    InitialStyle.cardDecoration = cardDecoration ??
        BoxDecoration(
          color: InitialStyle.cardColor,
          borderRadius: BorderRadius.all(Radius.circular((15))),
          boxShadow: [
            BoxShadow(
              color: InitialStyle.shadow,
              blurRadius: 24.0,
            ),
          ],
        );
  }
}

class DarkStyle extends StructureStyles {
  static late Color primaryColor;
  static late Color secondaryColor;
  static late Color secondaryDarkColor;
  static late Color secondaryLightColor;
  static late Color onPrimaryColor;
  static late Color onSecondaryColor;
  static late Color specificColor;
  static late Color primaryDarkColor;
  static late Color primaryLightColor;

  static late Color cardColor;
  static late Color section;

  static late MaterialColor gray;

  static late Color background;
  static late Color shadow;
  static late Color border;
  static late Color borderInput;
  static late Color hover;
  static late Color buttonHover;
  static late Color buttonTextHover;
  static late Color textHover;

  static late Color icon;
  static late Color divider;
  static late Color menu;

  static late Color black;
  static late Color hintInput;
  static late Color labelInput;
  static late Color textInput;
  static late Color secondaryBorderColor;
  static late Color backgroundInput;
  static late Color white;

  static TextStyle? inputStyle;
  static BoxDecoration? cardDecoration;

  static late Color buttonColor;

  static late Color textColor;
  static late Color secondaryTextColor;
  static late Color titleTextColor;
  static late Color sectionTitleTextColor;
  static late Color buttonTextColor;

  static late Color socialNetworkColorFacebook;
  static late Color socialNetworkColorGoogle;
  static late Color socialNetworkColorWhatsapp;
  static late Color socialNetworkColorTweeter;
  static late Color socialNetworkColorYoutube;
  static late Color socialNetworkColorLinkedin;
  static late Color socialNetworkColorInstagram;

  static late Color warningColorLight;
  static late Color warningColorRegular;
  static late Color warningColorDark;

  static late Color informationColorDark;
  static late Color informationColorLight;
  static late Color informationColorRegular;

  static late Color dangerColorRegular;
  static late Color dangerColorLight;
  static late Color dangerColorDark;

  static late Color successColorDark;
  static late Color successColorLight;
  static late Color successColorRegular;

  static late Color disableColorRegular;
  static late Color disableColorLight;
  static late Color disableColorDark;

  DarkStyle(
      BuildContext context, {
        Color? primaryColor,
        Color? secondaryColor,
        Color? secondaryDarkColor,
        Color? secondaryLightColor,
        Color? onPrimaryColor,
        Color? onSecondaryColor,
        Color? specificColor,
        Color? primaryDarkColor,
        Color? primaryLightColor,
        Color? cardColor,
        Color? section,
        MaterialColor? gray,
        Color? background,
        Color? shadow,
        Color? border,
        Color? borderInput,
        Color? hover,
        Color? buttonHover,
        Color? buttonTextHover,
        Color? textHover,
        Color? icon,
        Color? divider,
        Color? menu,
        Color? black,
        Color? hintInput,
        Color? labelInput,
        Color? textInput,
        Color? secondaryBorderColor,
        Color? backgroundInput,
        Color? white,
        TextStyle? inputStyle,
        BoxDecoration? cardDecoration,
        Color? buttonColor,
        Color? textColor,
        Color? secondaryTextColor,
        Color? titleTextColor,
        Color? sectionTitleTextColor,
        Color? buttonTextColor,
        Color? socialNetworkColorFacebook,
        Color? socialNetworkColorGoogle,
        Color? socialNetworkColorWhatsapp,
        Color? socialNetworkColorTweeter,
        Color? socialNetworkColorYoutube,
        Color? socialNetworkColorLinkedin,
        Color? socialNetworkColorInstagram,
        Color? warningColorLight,
        Color? warningColorRegular,
        Color? warningColorDark,
        Color? informationColorDark,
        Color? informationColorLight,
        Color? informationColorRegular,
        Color? dangerColorRegular,
        Color? dangerColorLight,
        Color? dangerColorDark,
        Color? successColorDark,
        Color? successColorLight,
        Color? successColorRegular,
        Color? disableColorRegular,
        Color? disableColorLight,
        Color? disableColorDark,
      }) : super(context) {
    InitialStyle.primaryColor = primaryColor ?? Color(0xff233B8D);
    InitialStyle.onPrimaryColor = onPrimaryColor ?? Color(0xffFFFFFF);
    InitialStyle.primaryDarkColor = primaryDarkColor ?? Color(0xff030B1E);
    InitialStyle.primaryLightColor = primaryLightColor ?? Color(0xff314993);

    InitialStyle.secondaryColor = secondaryColor ?? Color(0xff0A1327);
    InitialStyle.onSecondaryColor = onSecondaryColor ?? Color(0xffFFFFFF);
    InitialStyle.secondaryDarkColor = secondaryDarkColor ?? Color(0xff0F172A);
    InitialStyle.secondaryLightColor = secondaryLightColor ?? Color(0xff3C4252);

    InitialStyle.specificColor = specificColor ?? Color(0xff38BDF8);

    InitialStyle.buttonTextColor = buttonTextColor ?? Color(0xffFFFFFF);
    InitialStyle.buttonColor = buttonColor ?? Color(0xff3761EB);
    InitialStyle.textColor = textColor ?? Color(0xffEEEEEE);
    InitialStyle.titleTextColor = titleTextColor ?? Color(0xffFFFFFF);
    InitialStyle.secondaryTextColor = secondaryTextColor ?? Color(0xff90ADF1);
    InitialStyle.sectionTitleTextColor =
        sectionTitleTextColor ?? Color(0xffFFFFFF);

    InitialStyle.border = border ?? Color(0xffE4E6E8);
    InitialStyle.divider = divider ?? Color(0xffE6E7EA);
    InitialStyle.shadow = shadow ?? Color(0x21000000);
    InitialStyle.icon = icon ?? Color(0xffFFFFFF);
    InitialStyle.menu = menu ?? Color(0xffFFFFFF);
    InitialStyle.cardColor = cardColor ?? Color(0xff11234F);
    InitialStyle.background = background ?? Color(0xff0D1C3C);
    InitialStyle.section = section ?? Color(0xff1E2F57);
    InitialStyle.hover = hover ?? DefaultStyles.hover;
    InitialStyle.buttonHover = buttonHover ?? DefaultStyles.buttonHover;
    InitialStyle.textHover = textHover ?? DefaultStyles.textHover;
    InitialStyle.buttonTextHover =
        buttonTextHover ?? DefaultStyles.buttonTextHover;

    InitialStyle.backgroundInput = backgroundInput ?? Color(0xff465B8C);
    InitialStyle.borderInput = borderInput ?? Color(0xff7B90D1);
    InitialStyle.hintInput = hintInput ?? Color(0xffFFFFFF);
    InitialStyle.labelInput = labelInput ?? Color(0xffFFFFFF);
    InitialStyle.textInput = textInput ?? Color(0xffffffff);
    InitialStyle.secondaryBorderColor =
        secondaryBorderColor ?? Color(0xffffffff);

    InitialStyle.gray = gray ?? super._gray;
    InitialStyle.black = black ?? super._black;
    InitialStyle.white = white ?? Color(0xffFFFFFF);

    InitialStyle.socialNetworkColorFacebook =
        socialNetworkColorFacebook ?? super._socialNetworkColorFacebook;
    InitialStyle.socialNetworkColorGoogle =
        socialNetworkColorGoogle ?? super._socialNetworkColorGoogle;
    InitialStyle.socialNetworkColorWhatsapp =
        socialNetworkColorWhatsapp ?? super._socialNetworkColorWhatsapp;
    InitialStyle.socialNetworkColorTweeter =
        socialNetworkColorTweeter ?? super._socialNetworkColorTweeter;
    InitialStyle.socialNetworkColorYoutube =
        socialNetworkColorYoutube ?? super._socialNetworkColorYoutube;
    InitialStyle.socialNetworkColorLinkedin =
        socialNetworkColorLinkedin ?? super._socialNetworkColorLinkedin;
    InitialStyle.socialNetworkColorInstagram =
        socialNetworkColorInstagram ?? super._socialNetworkColorInstagram;

    InitialStyle.warningColorLight = warningColorLight ?? Color(0xffFDD368);
    InitialStyle.warningColorRegular = warningColorRegular ?? Color(0xffFFB800);
    InitialStyle.warningColorDark = warningColorDark ?? Color(0xffE4A400);
    InitialStyle.informationColorDark =
        informationColorDark ?? Color(0xff2145BC);
    InitialStyle.informationColorLight =
        informationColorLight ?? Color(0xff7393FF);
    InitialStyle.informationColorRegular =
        informationColorRegular ?? Color(0xff3761EB);

    InitialStyle.dangerColorRegular = dangerColorRegular ?? Color(0xffD70D0D);
    InitialStyle.dangerColorLight = dangerColorLight ?? Color(0XFFF8D0D0);
    InitialStyle.dangerColorDark = dangerColorDark ?? Color(0xffD70D0D);

    InitialStyle.successColorDark = successColorDark ?? Color(0xff009C3F);
    InitialStyle.successColorLight = successColorLight ?? Color(0xffC0FCD8);
    InitialStyle.successColorRegular = successColorRegular ?? Color(0xff02B74A);

    InitialStyle.disableColorRegular = disableColorRegular ?? Color(0xffffffff);
    InitialStyle.disableColorLight = disableColorLight ?? Color(0xffE2E2E2);
    InitialStyle.disableColorDark = disableColorDark ?? Color(0xffffffff);

    InitialStyle.inputStyle = inputStyle ?? super._inputStyle;
    InitialStyle.cardDecoration = cardDecoration ??
        BoxDecoration(
          color: InitialStyle.cardColor,
          borderRadius: BorderRadius.all(Radius.circular((15))),
          boxShadow: [
            BoxShadow(
              color: InitialStyle.shadow,
              blurRadius: 24.0,
            ),
          ],
        );
  }
}
