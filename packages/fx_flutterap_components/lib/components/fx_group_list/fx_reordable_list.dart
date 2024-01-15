import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';


class FxReOrdableList extends StatefulWidget {
  final List<Widget> widgetList;

  const FxReOrdableList({
    Key? key,
    required this.widgetList,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxReOrdableListState();
  }
}

class _FxReOrdableListState extends State<FxReOrdableList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        onReorder: _reorderData,
        children: <Widget>[
          for (final items in widget.widgetList)
            Card(
              color: InitialStyle.disableColorRegular,
              key: ValueKey(items),
              elevation: (InitialDims.space10) ,
              child: ListTile(title: items),
            ),
        ],
      ),
    );
  }

  void _reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = widget.widgetList.removeAt(oldindex);
      widget.widgetList.insert(newindex, items);
    });
  }
}
