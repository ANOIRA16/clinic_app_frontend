import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fx_flutterap_components/components/fx_alert/fx_alerts.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import 'fx_paginate.dart';

class FxStreamPaginate<T> extends StatefulWidget {
  final Stream<T> stream;
  final Widget child;
  final  String? noNetErrorString;
  final bool finishFlag;
  final Function(int currentPage) getData;

  const FxStreamPaginate(
      {Key? key,
      required this.stream,
      required this.child,
      this.noNetErrorString,
      required this.finishFlag,
      required this.getData})
      : super(key: key);

  @override
  State<FxStreamPaginate<T>> createState() => _FxStreamPaginateState<T>();
}

class _FxStreamPaginateState<T> extends State<FxStreamPaginate<T>> {
  final ScrollController _listScrollController = ScrollController();

  bool _noNet = false;

  int _currentPage = 1;

  double _currentScroll = 0;

  List<dynamic> list = [];

  /////////////////////////handle net

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.finishFlag ? null : widget.getData(_currentPage);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: widget.stream,
      builder: (context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasData) {
          //////////return to scroll in >1 pages

          if (_currentPage > 1) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              if (_listScrollController.hasClients) {
                Future.delayed(const Duration(milliseconds: 50), () {
                  _listScrollController.jumpTo(_currentScroll);
                });
              }
            });
          }
          _noNet = false;
          ////////////////////////////////////////////////////////////////

          return FxPaginate(
            listScrollController: _listScrollController,
            onFinish: () {
              _currentPage++;
              ////////////////////////////////////set currentScroll
              if (_listScrollController.hasClients) {
                _currentScroll = _listScrollController.position.pixels + 100;
              }
              //////////////////////////////////////////////////////

              widget.finishFlag ? null : widget.getData(_currentPage);
            },
            child: SingleChildScrollView(
              controller: _listScrollController,
              child: Center(
                child: widget.child,
              ),
            ),
          );
        }
        ////////////////////////////////////handel no net

        if (snapshot.error == "noNet") {
          FxAlerts.error(context, "",
              textColor: InitialStyle.dangerColorDark,
              myContent:
                   FxText(widget.noNetErrorString??"Ensure your internet connection."),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(InitialDims.border2)),
                  border: Border.all(
                      color: InitialStyle.dangerColorDark, width: 2)));
          return Center(
            child: InkWell(
              child: Center(
                child: Icon(
                  Icons.refresh,
                  color: InitialStyle.primaryDarkColor,
                ),
              ),
              onTap: () {
                widget.getData(_currentPage);
              },
            ),
          );
        }

        if (snapshot.error == "noNet" && _noNet == false) {
          FxAlerts.error(context, "",
              textColor: InitialStyle.dangerColorDark,
              myContent:
                   FxText(widget.noNetErrorString??"Ensure your internet connection."),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(InitialDims.border2)),
                  border: Border.all(
                      color: InitialStyle.dangerColorDark, width: 2)));
          _noNet = true;

          Future.delayed(const Duration(milliseconds: 100), () {
            widget.getData(_currentPage);
          });
        }
//////////////////////////////////////////////////////////////////

        return Center(
          child: CircularProgressIndicator(
            color: InitialStyle.primaryDarkColor,
          ),
        );
      },
    );
  }
}
