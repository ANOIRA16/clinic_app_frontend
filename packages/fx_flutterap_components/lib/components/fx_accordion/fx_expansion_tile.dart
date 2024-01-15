import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class FxExpansionTile extends StatefulWidget {
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
  final bool? initialyExpanded;

  const FxExpansionTile(
      {this.icon,
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
      this.initialyExpanded,
      Key? key,
      this.textColor,
      this.collapsedIconColor,
      this.collapsedTextColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxExpansionTileState();
  }
}

class _FxExpansionTileState extends State<FxExpansionTile> {
  bool _isExpanded = false;

  // Generate a list of list items
  // In real app, data often is fetched from an API or a database

  // This function is called when a "Remove" button associated with an item is pressed

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isExpanded = widget.initialyExpanded ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // this key is required to save and restore ExpansionTile expanded state

      margin: widget.margin ??
          EdgeInsets.symmetric(vertical: InitialDims.space2),
      decoration: widget.decoration ?? const BoxDecoration(),
      child: Stack(
        children: [
          widget.backGroundImagePath == null
              ? Container()
              : Positioned.fill(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: widget.decoration ?? const BoxDecoration(),
                    child: Image.asset(
                      widget.backGroundImagePath ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          ExpansionTile(
              initiallyExpanded: widget.initialyExpanded ?? false,
              textColor: widget.textColor ?? InitialStyle.textColor,
              collapsedTextColor:
                  widget.collapsedTextColor ?? InitialStyle.textColor,
              collapsedIconColor:
                  widget.collapsedIconColor ?? InitialStyle.textColor,
              trailing: _isExpanded
                  ? widget.closeIcon ??
                      FxSvgIcon(
                        "packages/fx_flutterap_components/assets/svgs/up.svg",
                        size: InitialDims.icon3,
                        color:
                            widget.iconColor ?? InitialStyle.textColor,
                      )
                  : widget.openIcon ??
                      FxSvgIcon(
                        "packages/fx_flutterap_components/assets/svgs/down.svg",
                        size: InitialDims.icon3,
                        color:
                            widget.iconColor ?? InitialStyle.textColor,
                      ),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isExpanded = expanded;
                });
              },
              iconColor: widget.iconColor ?? InitialStyle.textColor,
              tilePadding: widget.tilePadding ??
                  EdgeInsets.symmetric(
                      vertical: 0, horizontal: InitialDims.space2),
              childrenPadding: widget.childrenPadding ??
                  EdgeInsets.symmetric(
                      vertical: InitialDims.space2,
                      horizontal: InitialDims.space2),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              maintainState: true,
              title: widget.title,
              // contents
              children: widget.children),
        ],
      ),
    );
  }
}
