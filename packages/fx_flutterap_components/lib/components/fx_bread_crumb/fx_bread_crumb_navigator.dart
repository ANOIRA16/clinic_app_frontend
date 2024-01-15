import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_bread_crumb/fx_simple_bread_buttom.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

import '../fx_text/fx_text.dart';
import 'fx_app_navigator_observer.dart';
import 'fx_icon_bread_buttom.dart';
import 'fx_shaped_bread_buttom.dart';

class FxBreadCrumbNavigator extends StatefulWidget {
  final String? firstRoute;

  final Widget? suffix;
  final Widget? ltrSuffixIcon;
  final Widget? rtlSuffixIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? padding;
  final double? depth;
  final List<Route> currentRouteStack;
  final BreadButtonType breadButtonType;

  FxBreadCrumbNavigator({
    Key? key,
    this.firstRoute,
    this.breadButtonType = BreadButtonType.simple,
    this.suffix,
    this.ltrSuffixIcon,
    this.rtlSuffixIcon,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.depth,
  })  : currentRouteStack = routeStack.toList(),
        super(key: key);

  FxBreadCrumbNavigator.simple({
    Key? key,
    this.firstRoute,
    this.suffix,
    this.breadButtonType = BreadButtonType.simple,
    this.ltrSuffixIcon,
    this.rtlSuffixIcon,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.depth,
  })  : currentRouteStack = routeStack.toList(),
        super(key: key);

  FxBreadCrumbNavigator.icon({
    Key? key,
    this.firstRoute,
    this.suffix,
    required this.ltrSuffixIcon,
    required this.rtlSuffixIcon,
    this.breadButtonType = BreadButtonType.icon,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.depth,
  })  : currentRouteStack = routeStack.toList(),
        super(key: key);

  FxBreadCrumbNavigator.shaped({
    Key? key,
    this.firstRoute,
    this.suffix,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.depth,
    this.breadButtonType = BreadButtonType.shaped,
    this.ltrSuffixIcon,
    this.rtlSuffixIcon,
  })  : currentRouteStack = routeStack.toList(),
        super(key: key);

  @override
  State<FxBreadCrumbNavigator> createState() => _FxBreadCrumbNavigatorState();
}

class _FxBreadCrumbNavigatorState extends State<FxBreadCrumbNavigator> {
  List _index = [];
  List<Route> _routStack = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _routStack = widget.currentRouteStack;

    _index = List.generate(_routStack.length, (index) => index);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: List<Widget>.from(_routStack.asMap().map(
          (index, value) {
            return MapEntry(
                index,
                _index.contains(index)
                    ? GestureDetector(
                        onTap: () {
                          Navigator.popUntil(
                              context, (route) => route == _routStack[index]);
                          if (_index.contains(index + 1)) {
                            _index.remove(index + 1);
                          }
                        },
                        child: _breadButton(widget.breadButtonType, index))
                    : Container());
          },
        ).values),
      ),
    );
  }

  Widget _breadButton(BreadButtonType type, int index) {
    if (widget.breadButtonType == BreadButtonType.simple) {
      return FxSimpleBreadButton(
        index == 0
            ? widget.firstRoute ?? "Home"
            : widget.currentRouteStack[index].settings.name ?? "",
        widget.suffix ??
            FxText(
              " / ",
              color: widget.textColor,
              size: InitialDims.subtitleFontSize,
            ),
        index == 0,
        color: widget.textColor,
      );
    }
    if (widget.breadButtonType == BreadButtonType.shaped) {
      return FxShapedBreadButton(
        index == 0
            ? widget.firstRoute ?? "home"
            : widget.currentRouteStack[index].settings.name ?? "",
        index == 0,
        backgroundColor: widget.backgroundColor,
        textColor: widget.textColor,
        depth: widget.depth,
        padding: widget.padding,
      );
    }
    if (widget.breadButtonType == BreadButtonType.icon) {
      return FxIconBreadButton(
        index == 0
            ? widget.firstRoute ?? "home"
            : widget.currentRouteStack[index].settings.name ?? "",
        index == 0,
        rtlSuffix: widget.rtlSuffixIcon,
        ltrSuffix: widget.ltrSuffixIcon,
      );
    } else {
      return FxSimpleBreadButton(
          index == 0
              ? widget.firstRoute ?? "home"
              : widget.currentRouteStack[index].settings.name ?? "",
          widget.suffix ??
              FxText(
                " / ",
                color: widget.textColor,
                size: InitialDims.subtitleFontSize,
              ),
          index == 0,
          color: widget.textColor);
    }
  }
}

enum BreadButtonType {
  simple,
  shaped,
  icon,
}
