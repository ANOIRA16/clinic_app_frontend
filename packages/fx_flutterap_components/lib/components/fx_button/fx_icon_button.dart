import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_alert/fx_alerts.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

///this class is a customized flat button that use in whole of app
class FxIconButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget? icon;
  final Color? borderColor;
  final Color? hoverColor;
  final Color? fillColor;
  final Color? iconColor;
  final Color? loadingColor;
  final double? size;
  final double? borderRadiusSize;
  final bool disable;
  final bool useShadow;
  final bool useConfidence;
  final bool isLoading;
  final bool clickable;

  const FxIconButton(
    this.icon, {
    Key? key,
    this.onTap,
    this.borderColor,
    this.hoverColor,
    this.iconColor,
    this.fillColor,
    this.disable = false,
    this.useShadow = false,
    this.useConfidence = false,
    this.size,
    this.borderRadiusSize,
    this.isLoading = false,
    this.clickable = true,
    this.loadingColor = Colors.white,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FxIconButtonState();
  }
}

class FxIconButtonState extends State<FxIconButton> {
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
          child: Container(
              decoration: BoxDecoration(
                border: _border(),
                borderRadius: BorderRadius.circular(
                    widget.borderRadiusSize ?? InitialDims.defaultBorder),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: InitialDims.space1,
                  vertical: InitialDims.space1),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                      visible: !_isLoading,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: widget.icon ?? Container()),
                  Visibility(
                      visible: _isLoading,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: SizedBox(
                        width: widget.size ?? InitialDims.space5,
                        height: widget.size ?? InitialDims.space5,
                        child: CircularProgressIndicator(
                          color: widget.loadingColor ??
                              InitialStyle.buttonTextColor,
                        ),
                      )),
                ],
              )),
        ),
      ),
    );
  }

  _border() {
    if (widget.borderColor == null) {
      return null;
    } else {
      return Border.all(
        color: widget.borderColor ?? InitialStyle.primaryDarkColor,
      );
    }
  }

  _onTap() {
    if (widget.useConfidence) {
      FxAlerts.confidence(context,
          title: "اخطار",
          content: "آیا از انجام این عملیات مطمئنید؟", onConfirmPress: () {
        widget.onTap!();
      });
    } else {
      widget.onTap!();
    }
  }

  @override
  void didUpdateWidget(covariant FxIconButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _isLoading = widget.isLoading;
  }
}
