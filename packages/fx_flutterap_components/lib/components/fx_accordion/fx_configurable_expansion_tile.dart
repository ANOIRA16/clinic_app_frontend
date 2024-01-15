import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxConfigurableExpansionTile extends StatefulWidget {
  final Icon? icon;
  final Icon? openIcon;
  final Icon? closeIcon;
  final Decoration? decoration;
  final EdgeInsetsGeometry? tilePadding;
  final EdgeInsetsGeometry? childrenPadding;
  final Widget title;
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  final String? backGroundImagePath;
  final Color? iconColor;
  final Color? textColor;
  final Color? collapsedIconColor;
  final Color? collapsedTextColor;
  final bool? initiallyExpanded;
  final void Function(bool)? onExpansionChanged;

  const FxConfigurableExpansionTile({
    Key? key,
    this.icon,
    this.openIcon,
    this.closeIcon,
    this.decoration,
    this.tilePadding,
    this.childrenPadding,
    required this.title,
    required this.children,
    this.margin,
    this.backGroundImagePath,
    this.iconColor,
    this.initiallyExpanded,
    this.onExpansionChanged,
    this.textColor,
    this.collapsedIconColor,
    this.collapsedTextColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FxConfigurableExpansionTileState();
}

class _FxConfigurableExpansionTileState
    extends State<FxConfigurableExpansionTile> {
  late ConfigurableExpansionTileController _controller;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded ?? false;
    _controller = ConfigurableExpansionTileController();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Flexible(
        child: Container(
          padding: widget.tilePadding ??
              EdgeInsets.symmetric(
                vertical: InitialDims.space1,
                horizontal: InitialDims.space2,
              ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.title,
              isExpanded
                  ? widget.closeIcon ??
                  FxSvgIcon(
                    "packages/fx_flutterap_components/assets/svgs/up.svg",
                    size: InitialDims.icon2,
                    color: widget.iconColor ?? InitialStyle.primaryDarkColor,
                  )
                  : widget.openIcon ??
                  FxSvgIcon(
                    "packages/fx_flutterap_components/assets/svgs/down.svg",
                    size: InitialDims.icon2,
                    color: widget.iconColor ?? InitialStyle.primaryDarkColor,
                  ),
            ],
          ),
        ),
      );
    }

    List<Widget> children = List.generate(
      widget.children.length,
          (index) => Container(
        padding: widget.childrenPadding ??
            EdgeInsets.symmetric(
              vertical: InitialDims.space2,
              horizontal: InitialDims.space2,
            ),
        child: widget.children[index],
      ),
    );

    return Container(
      margin: widget.margin ?? EdgeInsets.symmetric(vertical: InitialDims.space2),
      decoration: widget.decoration ?? const BoxDecoration(),
      child: Stack(
        children: [
          if (widget.backGroundImagePath == null)
            Container()
          else
            Positioned.fill(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: widget.decoration ??
                    const BoxDecoration(),
                child: Image.asset(
                  widget.backGroundImagePath ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ConfigurableExpansionTile(
            controller: _controller,
            header: (bool isExpanded, Animation<double> animation,
                Animation<double> secondaryAnimation,
                ConfigurableExpansionTileController controller) {
              return header();
            },
            initiallyExpanded: widget.initiallyExpanded ?? false,
            onExpansionChanged: (bool expanded) {
              setState(() {
                isExpanded = expanded;
              });
              widget.onExpansionChanged!(expanded);
            },
            childrenBody: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
