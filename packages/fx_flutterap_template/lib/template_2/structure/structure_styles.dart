// ignore_for_file: prefer_const_constructors, unused_field
import 'package:flutter/material.dart';
import 'package:fx_flutterap_kernel/structure/default_dims.dart';
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
    InitialStyle.primaryColor = primaryColor ?? super._primaryColor;
    InitialStyle.secondaryColor = secondaryColor ?? super._secondaryColor;
    InitialStyle.secondaryDarkColor =
        secondaryDarkColor ?? super._secondaryDarkColor;
    InitialStyle.secondaryLightColor =
        secondaryLightColor ?? super._secondaryLightColor;
    InitialStyle.onPrimaryColor = onPrimaryColor ?? super._onPrimaryColor;
    InitialStyle.onSecondaryColor = onSecondaryColor ?? super._onSecondaryColor;
    InitialStyle.specificColor = specificColor ?? super._specificColor;
    InitialStyle.primaryDarkColor = primaryDarkColor ?? super._primaryDarkColor;
    InitialStyle.primaryLightColor =
        primaryLightColor ?? super._primaryLightColor;

    InitialStyle.cardColor = cardColor ?? super._cardColor;
    InitialStyle.section = section ?? super._section;

    InitialStyle.gray = gray ?? super._gray;

    InitialStyle.background = background ?? super._background;
    InitialStyle.shadow = shadow ?? super._shadow;
    InitialStyle.border = border ?? super._border;
    InitialStyle.borderInput = borderInput ?? Color(0xffb4aeae);
    InitialStyle.hover = hover ?? super._hover;
    InitialStyle.buttonHover = buttonHover ?? super._buttonHover;
    InitialStyle.buttonTextHover = buttonTextHover ?? super._buttonTextHover;
    InitialStyle.textHover = textHover ?? super._textHover;
    InitialStyle.icon = icon ?? super._icon;
    InitialStyle.divider = divider ?? super._divider;
    InitialStyle.menu = menu ?? super._menu;
    InitialStyle.black = black ?? super._black;

    InitialStyle.hintInput = black ?? Color(0xff736f6f);
    InitialStyle.labelInput = black ?? Color(0xffefefef);
    InitialStyle.textInput = black ?? Color(0xff565050);
    InitialStyle.secondaryBorderColor = black ?? super._secondaryBorderColor;
    InitialStyle.backgroundInput = black ?? Color(0xffd9d9e3);
    InitialStyle.white = black ?? super._white;

    InitialStyle.inputStyle = inputStyle ?? super._inputStyle;
    InitialStyle.cardDecoration =
        cardDecoration ?? super._cardDecoration;

    InitialStyle.buttonColor =
        buttonColor ?? super._buttonColor;

    InitialStyle.textColor = textColor ?? Color(0xff6a6e80);
    InitialStyle.secondaryTextColor =
        secondaryTextColor ?? Color(0xffbbbdc4);
    InitialStyle.titleTextColor = titleTextColor ?? Color(0xff565050);
    InitialStyle.sectionTitleTextColor =
        sectionTitleTextColor ?? super._sectionTitleTextColor;

    InitialStyle.buttonTextColor = buttonTextColor ?? super._buttonTextColor;

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

    InitialStyle.warningColorLight =
        warningColorLight ?? super._warningColorLight;
    InitialStyle.warningColorRegular =
        warningColorRegular ?? super._warningColorRegular;
    InitialStyle.warningColorDark = warningColorDark ?? super._warningColorDark;
    InitialStyle.informationColorDark =
        informationColorDark ?? super._informationColorDark;
    InitialStyle.informationColorLight =
        informationColorLight ?? super._informationColorLight;
    InitialStyle.informationColorRegular =
        informationColorRegular ?? super._informationColorRegular;

    InitialStyle.dangerColorRegular =
        dangerColorRegular ?? super._dangerColorRegular;
    InitialStyle.dangerColorLight = dangerColorLight ?? super._dangerColorLight;
    InitialStyle.dangerColorDark = dangerColorDark ?? super._dangerColorDark;

    InitialStyle.successColorDark = successColorDark ?? super._successColorDark;
    InitialStyle.successColorLight =
        successColorLight ?? super._successColorLight;
    InitialStyle.successColorRegular =
        successColorRegular ?? super._successColorRegular;

    InitialStyle.disableColorRegular =
        disableColorRegular ?? super._disableColorRegular;
    InitialStyle.disableColorLight =
        disableColorLight ?? super._disableColorLight;
    InitialStyle.disableColorDark = disableColorDark ?? super._disableColorDark;
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
    InitialStyle.primaryColor = primaryColor ?? super._primaryColor;
    InitialStyle.secondaryColor = secondaryColor ?? Color(0xff84888c);
    InitialStyle.secondaryDarkColor =
        secondaryDarkColor ?? super._secondaryDarkColor;
    InitialStyle.secondaryLightColor =
        secondaryLightColor ?? super._secondaryLightColor;
    InitialStyle.onPrimaryColor =
        onPrimaryColor ?? DefaultStyles.primaryLightColor;
    InitialStyle.onSecondaryColor = onSecondaryColor ?? super._onSecondaryColor;
    InitialStyle.specificColor = specificColor ?? super._specificColor;
    InitialStyle.primaryDarkColor = primaryDarkColor ?? super._primaryDarkColor;
    InitialStyle.primaryLightColor =
        primaryLightColor ?? super._primaryLightColor;

    InitialStyle.cardColor = cardColor ?? const Color(0xff191e33);
    InitialStyle.section = section ?? DefaultStyles.primaryDarkColor;

    InitialStyle.gray = gray ?? DefaultStyles.gray;

    InitialStyle.background = background ?? const Color(0xff060818);
    InitialStyle.shadow = shadow ?? super._shadow;
    InitialStyle.border = border ?? const Color(0xff969696);
    InitialStyle.borderInput = borderInput ?? const Color(0xffc7c0c0);
    InitialStyle.hover = hover ?? DefaultStyles.primaryLightColor;
    InitialStyle.buttonHover = buttonHover ?? super._buttonHover;
    InitialStyle.buttonTextHover = buttonTextHover ?? super._buttonTextHover;
    InitialStyle.textHover = textHover ?? super._textHover;
    InitialStyle.icon = icon ?? DefaultStyles.primaryLightColor;
    InitialStyle.divider = divider ?? DefaultStyles.secondaryDarkColor;
    InitialStyle.menu = menu ?? const Color(0xff323743);

    InitialStyle.hintInput = hintInput ?? Color(0xff272770);
    InitialStyle.labelInput = labelInput ?? Color(0xff272770);
    InitialStyle.textInput = textInput ??Color(0xff272770);
    InitialStyle.secondaryBorderColor = secondaryBorderColor ?? DefaultStyles.onPrimaryColor;
    InitialStyle.backgroundInput = backgroundInput ?? Color(0xffd9d9e3);
    InitialStyle.white = white ?? DefaultStyles.primaryDarkColor;
    InitialStyle.black = black ?? super._black;

    InitialStyle.inputStyle = inputStyle ??
        TextStyle(
            color: DefaultStyles.primaryColor,
            fontSize: DefaultDims.smallFontSize(context));
    InitialStyle.cardDecoration = cardDecoration ??
        BoxDecoration(
            color: const Color(0xff191e33),
            border: Border.all(color: const Color(0xff5d5a5a), width: 1),
            borderRadius: BorderRadius.all(
                Radius.circular(DefaultDims.border3(context))));

    InitialStyle.buttonColor =
        buttonColor ?? const Color(0xff323743);

    InitialStyle.textColor =
        textColor ?? Color(0xffd7d8da);
    InitialStyle.secondaryTextColor =
        secondaryTextColor ?? Color(0xff9fa2a9);
    InitialStyle.titleTextColor = titleTextColor ?? const Color(0xFFEEEFF3);
    InitialStyle.sectionTitleTextColor =
        sectionTitleTextColor ?? super._sectionTitleTextColor;
    InitialStyle.buttonTextColor =
        buttonTextColor ?? DefaultStyles.primaryLightColor;

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

    InitialStyle.warningColorLight =
        warningColorLight ?? super._warningColorLight;
    InitialStyle.warningColorRegular =
        warningColorRegular ?? super._warningColorRegular;
    InitialStyle.warningColorDark = warningColorDark ?? super._warningColorDark;
    InitialStyle.informationColorDark =
        informationColorDark ?? super._informationColorDark;
    InitialStyle.informationColorLight =
        informationColorLight ?? super._informationColorLight;
    InitialStyle.informationColorRegular =
        informationColorRegular ?? super._informationColorRegular;

    InitialStyle.dangerColorRegular =
        dangerColorRegular ?? super._dangerColorRegular;
    InitialStyle.dangerColorLight = dangerColorLight ?? super._dangerColorLight;
    InitialStyle.dangerColorDark = dangerColorDark ?? super._dangerColorDark;

    InitialStyle.successColorDark = successColorDark ?? super._successColorDark;
    InitialStyle.successColorLight =
        successColorLight ?? super._successColorLight;
    InitialStyle.successColorRegular =
        successColorRegular ?? super._successColorRegular;

    InitialStyle.disableColorRegular =
        disableColorRegular ?? super._disableColorRegular;
    InitialStyle.disableColorLight =
        disableColorLight ?? super._disableColorLight;
    InitialStyle.disableColorDark = disableColorDark ?? super._disableColorDark;
  }
}
