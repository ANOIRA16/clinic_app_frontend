import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';

import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_config.dart';
import '../fx_button/fx_icon_button.dart';

class FxModal {
  FxModal.simple(
    context, {
    Widget? customWidget,
    String? content,
    bool? hasCustomWidget,
    bool? hasClose,
    bool? barrierDismissible,
    double? maxWidth,
    double? maxHeight,
    double? width,
    double? height,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((timFxtamp) {
      showDialog(
          barrierDismissible: barrierDismissible ?? true,
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: InitialStyle.section,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(InitialDims.border3)),
              child: hasCustomWidget ?? false
                  ? customWidget
                  : Container(
                      width: width,
                      height: height,
                      constraints: BoxConstraints(
                        maxWidth: maxWidth ?? (InitialDims.space25) * 4,
                        maxHeight: maxHeight ?? (InitialDims.space25) * 4,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all((InitialDims.space5)),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              hasClose ?? true
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.close,
                                          color:
                                              InitialStyle.secondaryDarkColor))
                                  : Container(),
                              const FxVSpacer(),
                              FxText(
                                content ?? InitialConfig.lorem,
                                align: TextAlign.justify,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          });
    });
  }

  FxModal.fullScreen(
    context, {
    Widget? title,
    Widget? customWidget,
    bool? hasCustomWidget,
    String? content,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((timFxtamp) {
      showGeneralDialog(
        context: context,
        barrierDismissible: false,
        // should dialog be dismissed when tapped outside
        barrierLabel: "Modal",
        // label for barrier
        transitionDuration: const Duration(milliseconds: 500),
        // how long it takFx to popup dialog after button click
        pageBuilder: (_, __, ___) {
          // your widget implementation
          return Scaffold(
            appBar: AppBar(
              backgroundColor: InitialStyle.section,
              centerTitle: true,
              leading: FxIconButton(
                  Icon(
                    Icons.close,
                    color: InitialStyle.secondaryDarkColor,
                  ), onTap: () {
                Navigator.pop(context);
              }),
              title: title ??
                  const FxText(
                    "title",
                    tag: Tag.h3,
                  ),
            ),
            backgroundColor: InitialStyle.section.withOpacity(0.90),
            body: hasCustomWidget ?? false
                ? customWidget
                : Container(
                    padding: EdgeInsets.fromLTRB(
                        (InitialDims.space5),
                        (InitialDims.space2) * 2,
                        (InitialDims.space5),
                        (InitialDims.space2)),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xfff8f8f8),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText(
                          content ?? InitialConfig.lorem,
                          align: TextAlign.justify,
                        ),
                        const FxVSpacer(
                          big: true,
                        )
                      ],
                    ),
                  ),
          );
        },
      );
    });
  }

  FxModal.position(
    context, {
    Widget? title,
    Widget? customWidget,
    bool? hasCustomWidget,
    double? maxWidth,
    double? maxHeight,
    double? width,
    double? height,
    bool? hasClose,
    Alignment? alignment,
    String? content,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((timFxtamp) {
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black54,
        barrierDismissible: true,
        barrierLabel: 'Label',
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: alignment ?? Alignment.center,
            child: hasCustomWidget ?? false
                ? Material(
                    color: InitialStyle.section,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(InitialDims.border3)),
                    child: customWidget)
                : Container(
                    margin: EdgeInsets.all((InitialDims.space5)),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(InitialDims.border3))),
                    child: Material(
                      color: InitialStyle.section,
                      child: Container(
                        width: width,
                        height: height,
                        constraints: BoxConstraints(
                          maxWidth: maxWidth ?? (InitialDims.space25) * 4,
                          maxHeight: maxHeight ?? (InitialDims.space25) * 4,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all((InitialDims.space5)),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                hasClose ?? true
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.close,
                                            color: InitialStyle
                                                .secondaryDarkColor))
                                    : Container(),
                                const FxVSpacer(),
                                FxText(
                                  content ?? InitialConfig.lorem,
                                  align: TextAlign.justify,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
      );
    });
  }

  FxModal.bottom(
    context, {
    Widget? customWidget,
    Widget? title,
    bool? hasCustomWidget,
    bool? hasClose,
    bool? barrierDismissible,
    double? contentHeight,
    double? titleHeight,
    String? content,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((timFxtamp) {
      showModalBottomSheet(
          isDismissible: barrierDismissible ?? true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (builder) {
            double contentHeight0 = contentHeight ?? (InitialDims.space25) * 2;
            double titleHeight0 = titleHeight ?? (InitialDims.space25);
            return Container(
              constraints:
                  BoxConstraints(maxHeight: contentHeight0 + titleHeight0),
              color: Colors.transparent,
              child: hasCustomWidget ?? false
                  ? customWidget
                  : Container(
                      decoration: BoxDecoration(
                        color: InitialStyle.section,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            // has the effect of softening the shadow
                            spreadRadius:
                                0.0, // has the effect of extending the shadow
                          )
                        ],
                      ),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          title ??
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin:
                                        const EdgeInsets.only(top: 5, left: 10),
                                    child: const FxText(
                                      "Bottom Modal",
                                      tag: Tag.h3,
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, right: 5),
                                      child: FxButton(
                                        // padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        text: "Save",
                                      )),
                                ],
                              ),
                          const FxVSpacer(
                            big: true,
                          ),
                          Container(
                            constraints:
                                BoxConstraints(maxHeight: contentHeight0),
                            padding: EdgeInsets.fromLTRB(
                                (InitialDims.space5),
                                (InitialDims.space5),
                                (InitialDims.space5),
                                (InitialDims.space5)),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xfff8f8f8),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FxText(
                                    content ?? ((InitialConfig.lorem) * 2),
                                    align: TextAlign.justify,
                                  ),
                                  const FxVSpacer(
                                    big: true,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            );
          });
    });
  }
}
