// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_components/components/fx_waiting_indicator/fx_typing_waiting_indicator.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

import '../../../../../../app/models/chat_model.dart';

class FxChatGPTMessageCard extends StatelessWidget {
  final ChatsModel model;

  const FxChatGPTMessageCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: InitialDims.space2,
          horizontal: InitialDims.space2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            model.type == MessageType.receive
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const FxHSpacer(
                        factor: 5,
                      ),
                      FxText(model.name!,
                          size: InitialDims.normalFontSize,
                          color: InitialStyle.textColor),
                    ],
                  )
                : Container(),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: model.type == MessageType.send
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                model.type == MessageType.receive
                    ? FxAvatarImage(
                        backgroungColor: InitialStyle.white,
                        path:
                            "packages/fx_flutterap_components/assets/images/ChatGPT.png",
                      )
                    : Container(),
                const FxHSpacer(
                  factor: 0.5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: InitialDims.space22 * 3,
                      decoration: BoxDecoration(
                          color: model.type == MessageType.send
                              ? InitialStyle.primaryLightColor
                              : InitialStyle.cardColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(InitialDims.border3),
                            topRight: Radius.circular(InitialDims.border3),
                            bottomLeft: Radius.circular(
                                model.type == MessageType.receive
                                    ? 0
                                    : InitialDims.border3),
                            bottomRight: Radius.circular(
                                model.type == MessageType.send
                                    ? 0
                                    : InitialDims.border3),
                          ),
                          border: Border.all(color: InitialStyle.border)),
                      padding: EdgeInsets.symmetric(
                        vertical: InitialDims.space5,
                        horizontal: InitialDims.space3,
                      ),
                      alignment: Alignment.centerLeft,
                      child: model.isLoading ?? false
                          ? FxTypingWaitingIndicator()
                          : FxText.selectable(
                              model.message!,
                              size: InitialDims.normalFontSize,
                              color: InitialStyle.titleTextColor,
                              overFlowTag: true,
                              maxLine: 100,
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FxText(model.createdAt!,
                            size: InitialDims.subtitleFontSize,
                            color: InitialStyle.textColor),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
