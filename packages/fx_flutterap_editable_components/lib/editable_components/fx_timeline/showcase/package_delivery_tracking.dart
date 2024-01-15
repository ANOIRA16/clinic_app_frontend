import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_config.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const kTileHeight = 50.0;
Color color1 = InitialStyle.primaryLightColor;
Color color2 = InitialStyle.primaryColor;
Color color3 = InitialStyle.primaryDarkColor;

class PackageDeliveryTrackingPage extends StatelessWidget {
  const PackageDeliveryTrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final data = _data(context, index + 1);
        return Center(
          child: Container(
            color: InitialStyle.section,
            width: 360.0,
            child: Card(
              color: InitialStyle.section,
              margin: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: _OrderTitle(
                      orderInfo: data,
                    ),
                  ),
                  const Divider(height: 1.0),
                  _DeliveryProcesses(processes: data.deliveryProcesses),
                  const Divider(height: 1.0),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: _OnTimeBar(driver: data.driverInfo),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _OrderTitle extends StatelessWidget {
  const _OrderTitle({
    Key? key,
    required this.orderInfo,
  }) : super(key: key);

  final _OrderInfo orderInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FxText(
          '${AppLocalizations.of(context)!.delivery}#${orderInfo.id}',
          tag: Tag.h3,
          isBold: true,
        ),
        const Spacer(),
        FxText(
          '${orderInfo.date.day}/${orderInfo.date.month}/${orderInfo.date.year}',
          tag: Tag.h3,
          color: InitialStyle.secondaryDarkColor,
        ),
      ],
    );
  }
}

class _InnerTimeline extends StatelessWidget {
  const _InnerTimeline({
    required this.messages,
  });

  final List<_DeliveryMessage> messages;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == messages.length + 1;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                thickness: 1.0,
              ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                size: InitialDims.space2,
                position: 0.5,
              ),
        ),
        builder: TimelineTileBuilder(
          indicatorBuilder: (_, index) =>
              !isEdgeIndex(index) ? Indicator.outlined(borderWidth: 1.0) : null,
          startConnectorBuilder: (_, index) => Connector.solidLine(),
          endConnectorBuilder: (_, index) => Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }

            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(messages[index - 1].toString()),
            );
          },
          itemExtentBuilder: (_, index) => isEdgeIndex(index) ? 10.0 : 30.0,
          nodeItemOverlapBuilder: (_, index) =>
              isEdgeIndex(index) ? true : null,
          itemCount: messages.length + 2,
        ),
      ),
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.processes})
      : super(key: key);

  final List<_DeliveryProcess> processes;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: color2,
        fontFamily: InitialConfig.fontFamily,
        fontSize: InitialDims.smallFontSize,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: color3,
            indicatorTheme: IndicatorThemeData(
              position: 0,
              size: InitialDims.space5,
            ),
            connectorTheme: const ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: processes.length,
            contentsBuilder: (_, index) {
              if (processes[index].isCompleted) return null;

              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FxText(
                      processes[index].name,
                      tag: Tag.h3,
                    ),
                    _InnerTimeline(messages: processes[index].messages),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              if (processes[index].isCompleted) {
                return DotIndicator(
                  color: color2,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: InitialDims.icon3,
                  ),
                );
              } else {
                return const OutlinedDotIndicator(
                  borderWidth: 2.5,
                );
              }
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: processes[index].isCompleted ? color2 : null,
            ),
          ),
        ),
      ),
    );
  }
}

class _OnTimeBar extends StatelessWidget {
  const _OnTimeBar({Key? key, required this.driver}) : super(key: key);

  final _DriverInfo driver;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: FxText(
                AppLocalizations.of(context)!.ontime,
                tag: Tag.h3,
              )),
            );
          },
          elevation: 0,
          shape: const StadiumBorder(),
          color: color2,
          textColor: Colors.white,
          child: FxText(
            AppLocalizations.of(context)!.ontime,
            tag: Tag.h3,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        FxAvatarImage(
          path: driver.thumbnailUrl,
        ),
        const FxHSpacer(),
        FxText(
          '${AppLocalizations.of(context)!.driver}\n${driver.name}',
          tag: Tag.h3,
        ),


      ],
    );
  }
}

_OrderInfo _data(BuildContext context, int id) => _OrderInfo(
      id: id,
      date: DateTime.now(),
      driverInfo: _DriverInfo(
        name: AppLocalizations.of(context)!.drivername,
        thumbnailUrl: "packages/fx_flutterap_components/assets/images/img3.jpg",
      ),
      deliveryProcesses: [
        _DeliveryProcess(
          AppLocalizations.of(context)!.packageprocess,
          messages: [
            _DeliveryMessage('8:30${AppLocalizations.of(context)!.am}',
                AppLocalizations.of(context)!.packagereceivedbydriver),
            _DeliveryMessage('11:30${AppLocalizations.of(context)!.am}',
                AppLocalizations.of(context)!.reachedhalfwaymark),
          ],
        ),
        _DeliveryProcess(
          AppLocalizations.of(context)!.intransit,
          messages: [
            _DeliveryMessage('13:00${AppLocalizations.of(context)!.pm}',
                AppLocalizations.of(context)!.driverarrivedatdestination),
            _DeliveryMessage('11:35${AppLocalizations.of(context)!.am}',
                AppLocalizations.of(context)!.packagedeliveredby),
          ],
        ),
        const _DeliveryProcess.complete(),
      ],
    );

class _OrderInfo {
  const _OrderInfo({
    required this.id,
    required this.date,
    required this.driverInfo,
    required this.deliveryProcesses,
  });

  final int id;
  final DateTime date;
  final _DriverInfo driverInfo;
  final List<_DeliveryProcess> deliveryProcesses;
}

class _DriverInfo {
  const _DriverInfo({
    required this.name,
    required this.thumbnailUrl,
  });

  final String name;
  final String thumbnailUrl;
}

class _DeliveryProcess {
  const _DeliveryProcess(
    this.name, {
    this.messages = const [],
  });

  const _DeliveryProcess.complete()
      : name = 'Done',
        messages = const [];

  final String name;
  final List<_DeliveryMessage> messages;

  bool get isCompleted => name == 'Done';
}

class _DeliveryMessage {
  const _DeliveryMessage(this.createdAt, this.message);

  final String createdAt; // final DateTime createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}
