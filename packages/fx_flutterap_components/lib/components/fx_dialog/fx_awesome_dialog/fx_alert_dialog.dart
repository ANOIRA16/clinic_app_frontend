import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../../fx_button/fx_button.dart';
import '../../fx_spacer/fx_h_divider.dart';
import '../../fx_spacer/fx_h_spacer.dart';
import '../../fx_text/fx_text.dart';

class FxAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final Function? onConfirmPress;

  const FxAlertDialog({Key? key, this.title, this.content, this.onConfirmPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(InitialDims.border2))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.all(InitialDims.space2),
                child: FxText(
                  title ?? "",tag:Tag.h3,
                  align: TextAlign.start,
                )),
            const FxHDivider(),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: InitialDims.space2 * 1.5,
                    horizontal: InitialDims.space2),
                child: FxText(
                  content ?? "",
                  align: TextAlign.start,
                )),
            const FxHDivider(),
            Padding(
                padding: EdgeInsets.all(InitialDims.space2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FxButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      text: "لغو",
                      fillColor: InitialStyle.dangerColorRegular,
                    ),
                    const FxHSpacer(
                      big: true,
                    ),
                    FxButton(
                        onTap: () {
                          Navigator.of(context).pop();
                          onConfirmPress!();
                        },
                        text: "تایید"),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
