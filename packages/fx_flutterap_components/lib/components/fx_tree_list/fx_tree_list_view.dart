import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:list_treeview/list_treeview.dart';

/// The data class that is bound to the child node
/// You must inherit from NodeData ！！！
/// You can customize any of your properties

class FxTreeListView extends StatefulWidget {
  final Widget? indicatorIcon;
  final Widget? favoriteIcon;
  final Widget? addIcon;
  final String? levelString;

  const FxTreeListView(
      {Key? key, this.addIcon,
        this.favoriteIcon,
        this.levelString,
        this.indicatorIcon})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxTreeListViewState();
  }
}

class _FxTreeListViewState extends State<FxTreeListView>
    with SingleTickerProviderStateMixin {
  TreeViewController? _controller;
  bool _isSuccess = false;
  final List<Color> _colors = [];

  @override
  void initState() {
    super.initState();

    ///The controller must be initialized when the treeView create
    _controller = TreeViewController();

    for (int i = 0; i < 100; i++) {
      _colors.add(randomColor());
    }

    ///Data may be requested asynchronously
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InitialStyle.section,
      body: _isSuccess
          ? Container(
              decoration: BoxDecoration(
                  color: InitialStyle.section,
                  borderRadius:
                      BorderRadius.all(Radius.circular(InitialDims.border3)),
                  border: Border.all(color: InitialStyle.textColor, width: 1)),
              child: getBody(widget.levelString??"level"))
          : getProgressView(),
    );
  }

  Widget getProgressView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getBody(String levelString) {
    return ListTreeView(
      shrinkWrap: false,
      padding: const EdgeInsets.all(0),
      itemBuilder: (BuildContext context, NodeData data) {
        TreeListView item = data as TreeListView;
//              double width = MediaQuery.of(context).size.width;
        double offsetX = item.level * 16.0;
        return Container(
          height: 54,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(

              // border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: offsetX),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: InkWell(
                            splashColor: Colors.amberAccent.withOpacity(1),
                            highlightColor: Colors.red,
                            onTap: () {
                              selectAllChild(item);
                            },
                            child: data.isSelected
                                ? widget.favoriteIcon ??
                                    FxSvgIcon(
                                      "packages/fx_flutterap_components/assets/svgs/folderfavorite.svg",
                                      size: InitialDims.icon3,
                                    )
                                : widget.indicatorIcon ??
                                    FxSvgIcon(
                                      "packages/fx_flutterap_components/assets/svgs/folder.svg",
                                      size: InitialDims.icon3,
                                    )),
                      ),
                      FxText(
                        '$levelString-${item.level}-${item.indexInParent}',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
//                          Text(
//                            '${item.label}',
//                            style: TextStyle(color: item.color),
//                          ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: item.isExpand,
                child: InkWell(
                    onTap: () {
                      add(item);
                    },
                    child: widget.addIcon ??
                        FxSvgIcon(
                          "packages/fx_flutterap_components/assets/svgs/add.svg",
                          size: InitialDims.icon3,
                        )),
              )
            ],
          ),
        );
      },
      onTap: (NodeData data) {
        if (kDebugMode) {
          print('index = ${data.index}');
        }
      },
      onLongPress: (data) {
        delete(data);
      },
      controller: _controller,
    );
  }

  void getData() async {
    if (kDebugMode) {
      print('start get data');
    }
    _isSuccess = false;
    await Future.delayed(const Duration(microseconds: 100));

    var colors1 = TreeListView(label: 'Colors1');
    var color11 = TreeListView(
        label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 0, 139, 69));
    var color12 = TreeListView(
        label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 0, 191, 255));
    var color13 = TreeListView(
        label: 'rgb(0,139,69)',
        color: const Color.fromARGB(255, 255, 106, 106));
    var color14 = TreeListView(
        label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 160, 32, 240));
    colors1.addChild(color11);
    colors1.addChild(color12);
    colors1.addChild(color13);
    colors1.addChild(color14);

    var colors2 = TreeListView(label: 'Colors2');
    var color21 = TreeListView(
        label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 255, 64, 64));
    var color22 = TreeListView(
        label: 'rgb(0,139,69)', color: const Color.fromARGB(255, 28, 134, 238));
    var color23 = TreeListView(
        label: 'rgb(0,139,69)',
        color: const Color.fromARGB(255, 255, 106, 106));
    var color24 = TreeListView(
        label: 'rgb(0,139,69)',
        color: const Color.fromARGB(255, 205, 198, 115));
    colors2.addChild(color21);
    colors2.addChild(color22);
    colors2.addChild(color23);
    colors2.addChild(color24);

    /// set data
    _controller!.treeData([colors1]);
    // print('set treeData suceess');

    setState(() {
      _isSuccess = true;
    });
  }

  Color getColor(int level) {
    return _colors[level % _colors.length];
  }

  Color randomColor() {
    int r = Random.secure().nextInt(200);
    int g = Random.secure().nextInt(200);
    int b = Random.secure().nextInt(200);
    return Color.fromARGB(255, r, g, b);
  }

  /// Add
  void add(TreeListView dataNode) {
    /// create New node
//    DateTime time = DateTime.now();
//    int milliseconds = time.millisecondsSinceEpoch ~/ 1000;
    int r = Random.secure().nextInt(255);
    int g = Random.secure().nextInt(255);
    int b = Random.secure().nextInt(255);

    var newNode = TreeListView(
        label: 'rgb($r,$g,$b)', color: Color.fromARGB(255, r, g, b));

    _controller!.insertAtFront(dataNode, newNode);
//    _controller.insertAtRear(dataNode, newNode);
//    _controller.insertAtIndex(1, dataNode, newNode);
  }

  void delete(dynamic item) {
    _controller!.removeItem(item);
  }

  void select(dynamic item) {
    _controller!.selectItem(item);
  }

  void selectAllChild(dynamic item) {
    _controller!.selectAllChild(item);
  }
}

class TreeListView extends NodeData {
  TreeListView({this.label, this.color, this.levelString}) : super();

  /// Other properties that you want to define
  final String? label;
  final String? levelString;
  final Color? color;

  String? property1;
  String? property2;
  String? property3;

///...
}
