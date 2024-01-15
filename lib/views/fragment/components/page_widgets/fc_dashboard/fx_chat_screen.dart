import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_text_field/fx_text_field_form.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_widget.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../../app/models/chat_model.dart';
import 'fx_message_card.dart';

class FxChatScreen extends StatefulWidget {
  const FxChatScreen({Key? key}) : super(key: key);
  static const routeName = '/chat';

  @override
  State<FxChatScreen> createState() => _FxChatScreenState();
}

class _FxChatScreenState extends State<FxChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _listScrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  final List _json = [
    {
      "_id": "62c182bea5665b6de70ccab1",
      "message": "Good morning:)",
      "name": "Tomas",
      "type": "send",
      "created_at": "26 jun 2023",
      "updated_at": "26 jun 2023",
    },
    {
      "_id": "62c182bea5665b6de70ccab1",
      "message": "Hello,Are you Ok?",
      "name": "Tomas",
      "type": "rec",
      "created_at": "26 jun 2023",
      "updated_at": "26 jun 2023",
    },
  ];

  late ChatModelList _list;

  @override
  void initState() {
    super.initState();
    _list = ChatModelList.fromJson(_json);
  }

  @override
  Widget build(BuildContext context) {
    bool isDirectionRTL(BuildContext context) {
      return intl.Bidi.isRtlLanguage(
          Localizations.localeOf(context).languageCode);
    }

    bool rtl = isDirectionRTL(context);
    Widget typingCard() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: InitialDims.space1),
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: (InitialDims.space12),
                child: Form(
                  key: _formKey,
                  child: RawKeyboardListener(
                    focusNode: _focusNode,
                    onKey: (event) {
                      bool valueEnter =
                          event.isKeyPressed(LogicalKeyboardKey.enter);
                      if (valueEnter) {
                        _sendResponse();
                      }
                    },
                    child: FxTextFieldForm(
                      hint: AppLocalizations.of(context)!.typemessage,
                      hintStyle: TextStyle(
                          color: InitialStyle.hintInput,
                          fontSize: InitialDims.normalFontSize),
                      suffixIcon: InkWell(
                        child: Padding(
                          padding: EdgeInsets.all(InitialDims.space1 * 1.2),
                          child: FxAvatarWidget(
                            backGroundColor: InitialStyle.buttonColor,
                            size: InitialDims.icon3,
                            widget: RotatedBox(
                              quarterTurns: rtl ? 2 : 0,
                              child: FxSvgIcon(
                                "packages/fx_flutterap_components/assets/svgs/send.svg",
                                size: InitialDims.icon3,
                                color: InitialStyle.buttonTextColor,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          _sendResponse();
                        },
                      ),
                      fillColor: InitialStyle.backgroundInput,
                      borderStyle: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: InitialStyle.backgroundInput),
                          borderRadius: BorderRadius.all(
                              Radius.circular(InitialDims.border2))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: InitialStyle.primaryDarkColor),
                          borderRadius: BorderRadius.all(
                              Radius.circular(InitialDims.border2))),
                      controller: _controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .thisfieldcannotbeempty;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: (InitialDims.space24) * 4,
      padding: EdgeInsets.symmetric(
        horizontal: InitialDims.space2,
        vertical: InitialDims.space1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: (InitialDims.space23) * 4,
            child: Stack(
              children: [
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: double.maxFinite,
                          child: ListView.builder(
                              reverse: true,
                              controller: _listScrollController,
                              itemCount: _list.list.length,
                              itemBuilder: (context, index) {
                                return FxMessageCard(
                                  model: _list.list[index],
                                );
                              }),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: typingCard(),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendResponse() {
    if (_formKey.currentState?.validate() == true) {
      setState(() {
        _list.list.insert(
            0,
            ChatsModel.fromJson(
              {
                "_id": "62c182bea5665b6de70ccab2",
                "message": _controller.text,
                "name": AppLocalizations.of(context)!.fullname,
                "type": "send",
                "created_at": "26 jun 2023",
                "updated_at": "26 jun 2023",
              },
            ));
        _controller.text = "";
      });
    }
  }
}
