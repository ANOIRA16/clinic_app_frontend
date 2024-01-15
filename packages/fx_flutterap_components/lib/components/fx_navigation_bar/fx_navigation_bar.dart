import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';

class FxNavigationBar extends StatefulWidget {
  final List<Widget> tabWidgetList;

  final List<Function()> functionList;

  final EdgeInsets? padding;
  final Axis? direction;
  final bool? isExpanded;
  final BoxDecoration? activeDecoration;
  final BoxDecoration? inActiveDecoration;

  const FxNavigationBar({
    Key? key,
    required this.tabWidgetList,
    required this.functionList,
    this.padding,
    this.direction,
    this.isExpanded,
    this.activeDecoration,
    this.inActiveDecoration,
  }) : super(key: key);

  @override
  State<FxNavigationBar> createState() => _FxNavigationBarState();
}

class _FxNavigationBarState extends State<FxNavigationBar> {
  late BoxDecoration _activeDecoration;
  late BoxDecoration _inActiveDecoration;
  late List<BoxDecoration> _currentDecoration;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _activeDecoration = widget.activeDecoration ?? const BoxDecoration();
    _inActiveDecoration = widget.inActiveDecoration ?? const BoxDecoration();

    _currentDecoration = List.generate(
        widget.tabWidgetList.length, (index) => _inActiveDecoration);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.direction == Axis.horizontal) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _list(),
      );
    }

    if (widget.direction == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: _list(),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [..._list()],
    );
  }

  List<Widget> _list() {
    return List.generate(
        widget.tabWidgetList.length,
        (index) => widget.isExpanded ?? false
            ? _expandedWidget(index)
            : _widget(index));
  }

  Widget _widget(
    int index,
  ) {
    return InkWell(
        onTap:
            // widget.functionList[index],
            () {
          setState(() {
            _currentDecoration = List.generate(
                widget.tabWidgetList.length, (index) => _inActiveDecoration);
            _currentDecoration[index] = _activeDecoration;
          });
          widget.functionList[index]();
        },
        child: Container(
          decoration: _currentDecoration[index],
          padding: widget.padding ?? EdgeInsets.all(InitialDims.space2),
          child: widget.tabWidgetList[index],
        ));
  }

  Widget _expandedWidget(
    int index,
  ) {
    return Expanded(
      child: InkWell(
          onTap: widget.functionList[index],
          child: Padding(
            padding: widget.padding ?? EdgeInsets.all(InitialDims.space2),
            child: widget.tabWidgetList[index],
          )),
    );
  }
}
