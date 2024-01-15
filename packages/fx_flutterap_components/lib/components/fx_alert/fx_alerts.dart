import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_alert/toast/toast_alert.dart';
import 'package:fx_flutterap_components/components/fx_dialog/fx_awesome_dialog/fx_alert_dialog.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxAlerts {
  FxAlerts.error(BuildContext context, String message,
      {Decoration? decoration,
      bool? hasClose,
      Widget? closeIcon,
      Widget? icon,
      Widget? myContent,
      Color? textColor}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ToastAlert.show(
        context,
        decoration: decoration,
        hasClose: hasClose,
        closeIcon: closeIcon,
        icon: icon,
        myContent: myContent,
        text: message,
        textColor: textColor ?? InitialStyle.dangerColorDark,
        backgroundColor: InitialStyle.dangerColorLight,
      );
    });
  }

  FxAlerts.success(BuildContext context, String message,
      {Decoration? decoration,
      bool? hasClose,
      Widget? closeIcon,
      Widget? icon,
      Widget? myContent,
      Color? textColor}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ToastAlert.show(
        context,
        decoration: decoration,
        hasClose: hasClose,
        closeIcon: closeIcon,
        icon: icon,
        myContent: myContent,
        text: message,
        textColor: textColor ?? InitialStyle.successColorDark,
        backgroundColor: InitialStyle.successColorLight,
      );
    });
  }

  FxAlerts.warning(BuildContext context, String message,
      {Decoration? decoration,
      bool? hasClose,
      Widget? closeIcon,
      Widget? icon,
      Widget? myContent,
      Color? textColor}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ToastAlert.show(
        context,
        decoration: decoration,
        hasClose: hasClose,
        closeIcon: closeIcon,
        icon: icon,
        myContent: myContent,
        text: message,
        textColor: textColor ?? InitialStyle.warningColorDark,
        backgroundColor: InitialStyle.warningColorLight,
      );
    });
  }

  FxAlerts.information(BuildContext context, String message,
      {Decoration? decoration,
      bool? hasClose,
      Widget? closeIcon,
      Widget? icon,
      Widget? myContent,
      Color? textColor}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ToastAlert.show(
        context,
        decoration: decoration,
        hasClose: hasClose,
        closeIcon: closeIcon,
        icon: icon,
        myContent: myContent,
        text: message,
        textColor: textColor ?? InitialStyle.informationColorDark,
        backgroundColor: InitialStyle.informationColorLight,
      );
    });
  }

  FxAlerts.confidence(BuildContext context,
      {String? title, String? content, Function? onConfirmPress}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
          context: context,
          builder: (context) => FxAlertDialog(
                title: title,
                content: content,
                onConfirmPress: onConfirmPress,
              ));
    });
  }
}
