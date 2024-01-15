import 'package:flutter/material.dart';
import 'package:fx_flutterap_kernel/local/kernel_save.dart';
import 'package:fx_flutterap_kernel/structure/global_variables.dart';
import 'package:fx_flutterap_components/components/fx_bread_crumb/fx_app_navigator_observer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:fx_flutterap_template/default_template/drawer_style/blocs/first_level_expanded_complex.dart';
import 'package:fx_flutterap_template/default_template/drawer_style/blocs/first_level_navigate.dart';
import 'package:fx_flutterap_template/default_template/drawer_style/blocs/next_level_expanded_complex.dart';
import 'package:fx_flutterap_template/default_template/drawer_style/blocs/next_level_navigate.dart';
import 'package:fx_flutterap_template/default_template/drawer_style/blocs/next_level_navigate_returnable.dart';
import 'package:fx_flutterap_template/default_template/drawer_style/blocs/first_level_navigate_returnable.dart';

class DrawerItemsProcessor extends StatefulWidget {
  final List menu;

  const DrawerItemsProcessor({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  State<DrawerItemsProcessor> createState() => _DrawerItemsProcessorState();
}

class _DrawerItemsProcessorState extends State<DrawerItemsProcessor> {
  List<Widget> _widgets = [];
  int _expansionBlockNum = 0;
  List<List> _totalList = [];
  final List<bool> _totalStatus = [];

  int _num = 0;
  int _count = 0;
  List<bool> _isSelectedList = [];
  List<void Function()> _onSelectedList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _count = _counter(widget.menu);
    _totalList = _totalExpansionListCreator(widget.menu);

    _setVariables();

    _getIndex();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      firstLevelGenerator(widget.menu);
    });

    return Wrap(children: _widgets);
  }

  void firstLevelGenerator(List menu) {
    List<Widget> widgets = [];

    for (int i = 0; i < menu.length; i++) {
      if (menu[i]['submenu'].length > 0) {
        setState(() {
          _expansionBlockNum++;
        });

        int selfIndex = _expansionBlockNum - 1;

        widgets.add(FirstLevelExpandedComplex(
          initialyExpanded: _totalList[selfIndex].contains(currentIndex),
          iconPath: menu[i]['iconPath'],
          expansionTitle: menu[i]['title'],
          expansionWidgetList: nextLevelGenerator(menu[i]['submenu']),
        ));
      } else {
        setState(() {
          _num++;
        });

        if (menu[i]['isReturnable'] == false) {
          widgets.add(FirstLevelNavigate(
            iconPath: menu[i]['iconPath'],
            title: menu[i]['title'],
            routeName: menu[i]['routeName'],
            index: _num - 1,
            onSelect: _onSelectedList[_num - 1],
            isSelected: _isSelectedList[_num - 1],
          ));
        } else {
          widgets.add(FirstLevelNavigateReturnable(
            iconPath: menu[i]['iconPath'],
            title: menu[i]['title'],
            routeName: menu[i]['routeName'],
            index: currentIndex,
            onSelect: _onSelectedList[currentIndex],
            isSelected: _isSelectedList[_num - 1],
          ));
        }
      }
    }

    setState(() {
      _num = 0;
      _expansionBlockNum = 0;
      _widgets = widgets;
    });
  }

  List<Widget> nextLevelGenerator(List menu) {
    List<Widget> nextMenu = [];

    for (int i = 0; i < menu.length; i++) {
      if (menu[i]['submenu'].length > 0) {
        setState(() {
          _expansionBlockNum++;
        });
        int selfIndex = _expansionBlockNum - 1;

        nextMenu.add(NextLevelExpandedComplex(
          initialyExpanded: _totalList[selfIndex].contains(currentIndex),
          expansionTitle: menu[i]['title'],
          expansionWidgetList: nextLevelGenerator(menu[i]['submenu']),
        ));
      } else {
        setState(() {
          _num++;
        });
        if (menu[i]['isReturnable'] == false) {
          nextMenu.add(NextLevelNavigate(
            title: menu[i]['title'],
            routeName: menu[i]['routeName'],
            index: _num - 1,
            onSelect: _onSelectedList[_num - 1],
            isSelected: _isSelectedList[_num - 1],
          ));
        } else {
          nextMenu.add(NextLevelNavigateReturnable(
            title: menu[i]['title'],
            routeName: menu[i]['routeName'],
            index: currentIndex,
            onSelect: _onSelectedList[currentIndex],
            isSelected: _isSelectedList[_num - 1],
          ));
        }
      }
    }

    return nextMenu;
  }

  List<List> _totalExpansionListCreator(List menu) {
    for (int i = 0; i < menu.length; i++) {
      if (menu[i]['submenu'].length > 0) {
        setState(() {
          _expansionBlockNum++;
          _totalStatus.add((true));
        });
        int selfIndex = _expansionBlockNum - 1;
        _nextTotalExpansionListCreator(menu[i]['submenu']);

        _totalStatus[selfIndex] = false;
      } else {
        setState(() {
          _num++;
        });
      }
    }
    _expansionBlockNum = 0;
    _num = 0;
    return _totalList;
  }

  List<Widget> _nextTotalExpansionListCreator(List menu) {
    List<Widget> nextMenu = [];

    for (int i = 0; i < menu.length; i++) {
      if (menu[i]['submenu'].length > 0) {
        setState(() {
          _expansionBlockNum++;
          _totalStatus.add((true));
        });
        int selfIndex = _expansionBlockNum - 1;
        _nextTotalExpansionListCreator(menu[i]['submenu']);

        _totalStatus[selfIndex] = false;
      } else {
        setState(() {
          _num++;
        });

        for (int i = 0; i < _expansionBlockNum; i++) {
          if (_totalStatus[i] == true) {
            setState(() {
              _totalList = _updateTotalList(_totalList, i, _num);
            });
          }
        }
      }
    }

    return nextMenu;
  }

  int _counter(List menu) {
    for (int i = 0; i < menu.length; i++) {
      if (menu[i]['submenu'].length > 0) {
        _nextConter(menu[i]['submenu']);
      }
      else {
        setState(() {
          _num++;
        });
      }
    }
    int number = _num;
    _num = 0;
    return number;
  }

  List<Widget> _nextConter(List menu) {
    List<Widget> nextMenu = [];

    for (int i = 0; i < menu.length; i++) {
      if (menu[i]['submenu'].length > 0) {
        _nextConter(menu[i]['submenu']);
      } else {
        setState(() {
          _num++;
        });
      }
    }

    return nextMenu;
  }

  List<List> _updateTotalList(List<List> preList, int index, int newNum) {
    List<List> total = preList;

    if (index >= preList.length) {
      total.add([]);
    }
    total[index].add(newNum - 1);

    return total;
  }

  Future<int> _getIndex() async {
    int index0 = await KernelSave().getIndex();

    setState(() {
      currentIndex = index0;
    });

    _setVariables();

    firstLevelGenerator(widget.menu);

    return currentIndex;
  }

  Future<void> _setIndex(int index) async {
    setState(() {
      currentIndex = index;
    });
    await KernelSave().setIndex(index);
  }

  Future<void> _setRoute() async {
    await Future.delayed(const Duration(milliseconds: 50), () {
      String currentRout = routeStack.toList().last.settings.name.toString();
      KernelSave().setRoute(currentRout);
    });
  }

  void _setVariables() {
    setState(() {
      _isSelectedList = List.generate(_count, (index) => false);
      _isSelectedList[currentIndex] = true;
      _onSelectedList = List.generate(
          _count,
          (index) => () {
                setState(() {
                  currentIndex = index;
                  _isSelectedList = List.generate(_count, (index) => false);
                  _isSelectedList[currentIndex] = true;
                });
                _setIndex(index);
                if (!kIsWeb) {
                  _setRoute();
                }
              });
    });
  }
}
