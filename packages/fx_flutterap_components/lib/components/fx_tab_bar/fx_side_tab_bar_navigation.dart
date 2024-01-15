import 'dart:math';

import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:flutter/material.dart';

class FxSideTabBarNavigation extends StatefulWidget {
  final List<Widget> tabWidgets;
  final List<Widget> pageWidgets;
  final Widget Function(int)? selectedWidget;
  final BoxDecoration? selectedTabDecoration;
  final BoxDecoration? unSelectedTabDecoration;
  final bool? isleft;
  final double? tabBarRatio;

  const FxSideTabBarNavigation({
    Key? key,
    required this.tabWidgets,
    required this.pageWidgets,
    this.selectedWidget,
    this.selectedTabDecoration,
    this.unSelectedTabDecoration,
    this.isleft,
    this.tabBarRatio,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxSideTabBarNavigationState();
  }
}

class _FxSideTabBarNavigationState extends State<FxSideTabBarNavigation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.tabWidgets.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedWidget(int index, Widget defaultWidget) {
      if (widget.selectedWidget == null) {
        return defaultWidget;
      } else {
        return widget.selectedWidget!(index);
      }
    }

    return Transform.rotate(
      angle: widget.isleft ?? true ? -pi / 2 : pi / 2,
      child: Column(
        children: [
          // give the tab bar a height [can change hheight to preferred height]
          Expanded(
            flex: ((widget.tabBarRatio ?? 0.2) * 10).round(),
            child: Container(
              decoration: widget.unSelectedTabDecoration ??
                  BoxDecoration(
                    color: InitialStyle.section,
                    border: Border(
                      bottom: BorderSide(
                        color: InitialStyle.borderInput,
                      ),
                    ),
                  ),
              child: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicator: widget.selectedTabDecoration ??
                      BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: InitialStyle.borderInput,
                          ),
                          right: BorderSide(
                            color: InitialStyle.borderInput,
                          ),
                          left: BorderSide(
                            color: InitialStyle.borderInput,
                          ),
                        ),
                        color: InitialStyle.section,
                      ),
                  labelColor: InitialStyle.primaryDarkColor,
                  unselectedLabelColor: Colors.black,
                  onTap: (int num) {
                    setState(() {
                      _selectedIndex = num;
                    });
                  },
                  tabs: List.generate(
                    widget.tabWidgets.length,
                    (index) => index == _selectedIndex
                        ? selectedWidget(
                            index,
                            Tab(
                                child: Transform.rotate(
                              angle: widget.isleft ?? true ? pi / 2 : -pi / 2,
                              child: widget.tabWidgets[index],
                            )),
                          )
                        : Tab(
                            child: Transform.rotate(
                            angle: widget.isleft ?? true ? pi / 2 : -pi / 2,
                            child: widget.tabWidgets[index],
                          )),
                  )),
            ),
          ),
          Expanded(
            flex: 10,
            child: TabBarView(
                controller: _tabController,
                children: List.generate(
                  widget.pageWidgets.length,
                  (index) => Center(
                      child: Transform.rotate(
                          angle: widget.isleft ?? true ? pi / 2 : -pi / 2,
                          child: widget.pageWidgets[index])),
                )),
          ),
        ],
      ),
    );
  }
}
