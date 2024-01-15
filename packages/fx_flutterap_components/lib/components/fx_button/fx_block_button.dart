import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_icon_text.dart';

import 'package:fx_flutterap_components/resources/Constants/enums.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../fx_text/fx_text.dart';

class FxBlockButton extends StatefulWidget {
  final String? text;

  final VoidCallback? onTap;
  final Widget? icon;
  final Color? textColor;

  final Color? hoverColor;
  final Color? borderColor;
  final double? borderRadiusSize;
  final Color? fillColor;
  final Size? size;
  final bool disable;
  final bool useShadow;
  final bool useConfidence;
  final ButtonDirection iconSide;
  final bool isLoading;
  final Color? loadingColor;
  final bool isBold;
  final bool clickable;

  const FxBlockButton(
      {Key? key,
      this.onTap,
      required this.text,
      this.icon,
      this.textColor,
      this.hoverColor,
      this.borderColor,
      this.borderRadiusSize,
      this.fillColor,
      this.disable = false,
      this.useShadow = false,
      this.size,
      this.isLoading = false,
      this.loadingColor,
      this.iconSide = ButtonDirection.start,
      this.isBold = false,
      this.clickable = true,
      this.useConfidence = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FxBlockButtonState();
  }
}

class FxBlockButtonState extends State<FxBlockButton> {
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _isLoading = widget.isLoading;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: widget.fillColor ?? InitialStyle.buttonColor,
      borderRadius: BorderRadius.circular(
          widget.borderRadiusSize ?? InitialDims.defaultBorder),
      clipBehavior: Clip.antiAlias,
      child: IgnorePointer(
        ignoring: !widget.clickable,
        child: InkWell(
          hoverColor: widget.disable
              ? Colors.transparent
              : widget.hoverColor ?? InitialStyle.buttonHover,
          onTap: _onTap,
          child: Row(
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.size == null
                            ? InitialDims.space5
                            : widget.size!.width / 2,
                        vertical: widget.size == null
                            ? InitialDims.space2
                            : widget.size!.height,),
                    decoration: BoxDecoration(
                      border: _border(),
                      borderRadius: BorderRadius.circular(
                          widget.borderRadiusSize ?? InitialDims.defaultBorder),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Visibility(
                            visible: !_isLoading,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: FxIconText(
                              widget.text ?? "",
                              icon: widget.icon,
                              isBold: widget.isBold,
                              size: widget.size == null
                                  ? InitialDims.smallFontSize
                                  : widget.size!.height,
                              color: widget.textColor ??
                                  InitialStyle.buttonTextColor,
                            )),
                        Visibility(
                            visible: _isLoading,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: SizedBox(
                              width: widget.size == null?InitialDims.space5: widget.size!.width  ,
                              height: widget.size == null?InitialDims.space2: widget.size!.height  ,
                              child: CircularProgressIndicator(
                                color: widget.loadingColor ??
                                    InitialStyle.buttonTextColor,
                              ),
                            )),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _border() {
    if (widget.borderColor == null) {
      return null;
    } else {
      return Border.all(
        color: widget.borderColor ?? InitialStyle.buttonColor,
      );
    }
  }

  _onTap() {
    if (widget.useConfidence) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                alignment: Alignment.center,
                title: const FxText("اخطار",tag:Tag.h3,),
                content: const SizedBox(
                  height: 80,
                  child: FxText("آیا از انجام این عملیات مطمئنید؟",tag:Tag.h3,),
                ),
                actions: [
                  FxBlockButton(
                    onTap: () {
                      widget.onTap!();
                    },
                    text: "بله",
                    fillColor: InitialStyle.dangerColorRegular,
                  ),
                  FxBlockButton(
                    onTap: () {},
                    text: "لغو",
                  ),
                ],
              ));
    } else {
      widget.onTap!();
    }
  }

  @override
  void didUpdateWidget(covariant FxBlockButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _isLoading = widget.isLoading;
  }
}
