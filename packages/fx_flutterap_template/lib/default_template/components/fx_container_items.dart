import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';

import 'fx_card_header.dart';

class FxContainerItems extends StatelessWidget {
  final Widget child;
  final String title;
  final String? information;
  final GlobalKey? informationKey;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? widgetPadding;

  const FxContainerItems(
      {Key? key,
      required this.child,
      required this.title,
       this.information,
      this.informationKey,
      this.margin,
      this.widgetPadding,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FxCard(

      body: child,
      header:  FxCardHeader(
      title: title,
      information: information,
      informationKey: informationKey,
    ),
      margin: margin,
      bodyPadding: widgetPadding,
    );
  }
}
