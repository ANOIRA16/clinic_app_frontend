// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_components/components/fx_alert/fx_alerts.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_button.dart';
import 'package:fx_flutterap_components/components/fx_button/fx_icon_button.dart';
import 'package:fx_flutterap_components/components/fx_form/fx_text_field/fx_text_field_form.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_widget.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_modal/fx_modal.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_components/local/packages/art_sweetalert/src/art_dialog.dart';
import 'package:fx_flutterap_components/local/packages/art_sweetalert/src/art_sweetalert.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_decoration.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_header.dart';
import 'package:fx_flutterap_template/default_template/components/fx_page_header.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/models/chat_model.dart';
import '../../../app/local/shared_preferences/save.dart';
import '../../../app/models/chat_gpt_model.dart';
import '../../../app/server/blocs/chat_gpt_bloc.dart';
import '../components/page_widgets/fc_chat_gpt/fx_chat_gpt_message_card.dart';

class FcChatGPT extends StatefulWidget {
  static const routeName = '/chatbot';

  const FcChatGPT({Key? key}) : super(key: key);

  @override
  State<FcChatGPT> createState() => _FcChatGPTState();
}

class _FcChatGPTState extends State<FcChatGPT> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _apiKeyController = TextEditingController();
  final ScrollController _listScrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _formApiKey = GlobalKey<FormState>();

  String apiKey = "";
  bool _isResponsing = false;

  List _json = [];
  List _jsonId = [];

  ChatModelList _list = ChatModelList.fromJson([]);
  List createdIdList = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _json = await _getLastGPTList();
      _jsonId = await _getLastIdList();
      _list = ChatModelList.fromJson(_json);
      createdIdList = _jsonId;
    });

    Future.delayed(Duration.zero, () async {
      String lastCode = await _getLastGPTCode();

      if (lastCode == "") {
        Future.delayed(Duration.zero, () {
          _enterKey(context);
        });
      } else {
        _setApiKey(lastCode);
        // _openAIBuild(lastCode);
      }
    });

    _saveIdList([]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                height: (InitialDims.space15),
                child: Form(
                  key: _formKey,
                  child: RawKeyboardListener(
                    focusNode: _focusNode,
                    onKey: (event) {
                      bool valueEnter =
                          event.isKeyPressed(LogicalKeyboardKey.enter);

                      if (valueEnter) {
                        _sendResponse(_controller.text);
                      }
                    },
                    child: FxTextFieldForm(
                      hint: AppLocalizations.of(context)!.typemessage,
                      hintStyle: TextStyle(
                          color: InitialStyle.hintInput,
                          fontSize: InitialDims.normalFontSize),
                      disabled: _isResponsing,
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(InitialDims.space1),
                        child: Padding(
                          padding: EdgeInsets.all(InitialDims.space1),
                          child: FxIconButton(
                            FxAvatarWidget(
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
                            borderRadiusSize: InitialDims.fullBorder,
                            size: InitialDims.icon2,
                            disable: _isResponsing,
                            onTap: () {
                              _sendResponse(_controller.text);
                            },
                          ),
                        ),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .thisfieldcannotbeempty;
                        }
                        return null;
                      },
                      onEditingComplete: () {},
                      controller: _controller,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget chatCard() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: InitialDims.space2,
          vertical: InitialDims.space1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 375, child: _resultList()),
            Row(
              children: [
                Expanded(
                  child: typingCard(),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget card({
      required Widget child,
    }) {
      return FxCard(
        body: child,
        header: InkWell(
            onTap: () {
              _deleteList();
            },
            child: Icon(
              Icons.delete,
              color: InitialStyle.icon,
            )),
        margin: EdgeInsets.all(InitialDims.space0),
      );
    }

    BootstrapCol cardShow1(Widget widget) {
      return BootstrapCol(
          sizes: 'col-sm-12 col-ml-12 col-lg-12 col-xl-12',
          child: Container(
              margin: FxCardDecoration().cardShowMargin, child: widget));
    }

    List containerList = [
      BootstrapContainer(
        fluid: true,
        children: [
          cardShow1(card(child: chatCard())),
        ],
      ),
    ];

    bootstrapGridParameters(gutterSize: InitialDims.space0);

    return Material(
        color: InitialStyle.background,
        child: Scaffold(
          backgroundColor: InitialStyle.background,
          body: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxPageHeader(
                        title: "ChatGPT",
                      ),
                      _information(),
                    ],
                  ),
                  BootstrapContainer(
                      fluid: true,
                      padding: EdgeInsets.all(InitialDims.space3),
                      decoration: BoxDecoration(
                        color: InitialStyle.background,
                      ),
                      children: List.generate(containerList.length,
                          (index) => containerList[index]))
                ],
              ),
            ),
          ),
        ));
  }

  Widget _resultList() {
    return StreamBuilder<GPTResponseModel>(
      stream: chatGPTBlocShow.actions,
      builder: (context, AsyncSnapshot<GPTResponseModel> snapshot) {
        if (snapshot.error == "noNet") {
          FxAlerts.error(
            context,
            "",
            textColor: InitialStyle.dangerColorDark,
            myContent: FxText(
              "Ensure your internet connection.",
              color: InitialStyle.dangerColorDark,
            ),
          );
          return Center(
            child: InkWell(
              child: Center(
                child: Icon(
                  Icons.refresh,
                  color: InitialStyle.primaryDarkColor,
                ),
              ),
              onTap: () {
                _getData("", "");
              },
            ),
          );
        } else if (snapshot.hasError && _isResponsing) {
          FxAlerts.error(
            context,
            "",
            textColor: InitialStyle.dangerColorDark,
            myContent: FxText(
              snapshot.error.toString(),
              color: InitialStyle.dangerColorDark,
            ),
          );
        }

        if (snapshot.hasData) {
          String? createdId = snapshot.data?.created.toString();

          if (!createdIdList.contains(createdId)) {
            _list.list.removeAt(0);

            _list.list.insert(
                0,
                ChatsModel.fromJson(
                  {
                    "_id": "62c182bea5665b6de70ccab2",
                    "message": snapshot.data?.choices!.list[0].message!.content,
                    "isLoading": false,
                    "name": "ChatGPT",
                    "type": "rec",
                    "created_id": createdId,
                    "created_at": DateTime.now().toString(),
                    "updated_at": "15 January 2024",
                  },
                ));

            _saveList(_list);

            createdIdList.add(createdId);
            _saveIdList(createdIdList);

            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {
                _isResponsing = false;
              });
            });
          }
          return ListView.builder(
              reverse: true,
              controller: _listScrollController,
              itemCount: _list.list.length,
              itemBuilder: (context, index) {
                return FxChatGPTMessageCard(
                  model: _list.list[index],
                );
              });
        } else {
          return ListView.builder(
              reverse: true,
              controller: _listScrollController,
              itemCount: _list.list.length,
              itemBuilder: (context, index) {
                return FxChatGPTMessageCard(
                  model: _list.list[index],
                );
              });
        }
      },
    );
  }

  _getData(String text, String apiKey) async {
    await chatGPTBlocShow.fetchShow(
      apiAddress: "chat/completions",
      apiKey: apiKey,
      body: {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": text}
        ],
        "max_tokens": 2500
      },
    );
  }

  void _sendResponse(String text) {
    if (_formKey.currentState?.validate() == true) {
      _getData(text, apiKey);

      setState(() {
        _list.list.insert(
            0,
            ChatsModel.fromJson(
              {
                "_id": "62c182bea5665b6de70ccab2",
                "message": _controller.text,
                "isLoading": false,
                "name": AppLocalizations.of(context)!.fullname,
                "type": "send",
                "created_id": "",
                "created_at": DateTime.now().toString(),
                "updated_at": "15 January 2024",
              },
            ));

        _list.list.insert(
            0,
            ChatsModel.fromJson(
              {
                "_id": "62c182bea5665b6de70ccab2",
                "message": "",
                "isLoading": true,
                "name": "ChatGPT",
                "type": "rec",
                "created_id": "",
                "created_at": "",
                "updated_at": "15 January 2024",
              },
            ));

        _isResponsing = true;

        _controller.clear();
      });
    }
  }

  Future<dynamic> _enterKey(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: FxText(
            "api Key is required.",
            color: InitialStyle.titleTextColor,
          ),
          backgroundColor: InitialStyle.cardColor,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(InitialDims.space2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText(
                    AppLocalizations.of(context)!.openbelowlink,
                  ),
                  const FxVSpacer(
                    big: true,
                  ),
                  _linkLauncher(
                    link: "https://platform.openai.com/account/api-keys",
                    title: "https://platform.openai.com/account/api-keys",
                  ),
                  const FxVSpacer(
                    big: true,
                  ),
                  FxText(
                    AppLocalizations.of(context)!.clickbutton,
                  ),
                  const FxVSpacer(
                    big: true,
                  ),
                  FxText(
                    AppLocalizations.of(context)!.createsecretkey,
                  ),
                  const FxVSpacer(
                    big: true,
                  ),
                  FxText(
                    AppLocalizations.of(context)!.enterapikey,
                  ),
                  const FxVSpacer(
                    big: true,
                  ),
                  Form(
                    key: _formApiKey,
                    child: RawKeyboardListener(
                      focusNode: _focusNode2,
                      onKey: (event) {
                        bool valueEnter =
                            event.isKeyPressed(LogicalKeyboardKey.enter);

                        if (valueEnter) {
                          _sendResponse(_apiKeyController.text);
                        }
                      },
                      child: FxTextFieldForm(
                        controller: _apiKeyController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!
                                .thisfieldcannotbeempty;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  const FxVSpacer(
                    big: true,
                  ),
                  FxButton(
                    text: AppLocalizations.of(context)!.save,
                    onTap: () async {
                      if (_formApiKey.currentState?.validate() == true) {
                        _deleteList();

                        _setApiKey(_apiKeyController.text);

                        Save().setGptCode(_apiKeyController.text);

                        Future.delayed(Duration.zero, () {
                          ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.success,
                                  title: "Connection Successful"));
                        });

                        Navigator.pop(context);
                      }
                    },
                  )

                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void onGPT1Interaction() {
    // Implement interaction with the first GPT
  }

  void onGPT2Interaction() {
    // Implement interaction with the second GPT
  }

  void onGPT3Interaction() {
    // Implement interaction with the third GPT
  }

  Future<String> _getLastGPTCode() async {
    String local = await Save().getGptCode();

    return local;
  }

  Future<List> _getLastGPTList() async {
    String list = await Save().getGptList();
    List jsonList = json.decode(list);

    return jsonList;
  }

  Future<List> _getLastIdList() async {
    String list = await Save().getIdList();
    List jsonList = json.decode(list);

    return jsonList;
  }

  void _setApiKey(String key) {
    setState(() {
      apiKey = key;
      _isResponsing = false;
    });
  }

  Widget _linkLauncher({required String title, required String link}) {
    return InkWell(
      onTap: () async {
        await launchUrl(Uri.parse(link));
      },
      child: FxText(title),
    );
  }

  Widget _information() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: InitialDims.space3,
        horizontal: InitialDims.space3,
      ),
      margin: EdgeInsets.only(
        top: InitialDims.space6,
        left: InitialDims.space5,
        right: InitialDims.space5,
        bottom: InitialDims.space1,
      ),
      width: double.maxFinite,
      decoration: FxCardDecoration().decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxCardHeader(
            title: 'Chat with the AI',
          ),
          const FxVSpacer(),
          FxText(
            AppLocalizations.of(context)!.startworkingwithchat,
            tag: Tag.h4,
          ),
          const FxVSpacer(),
          FxButton(
            text: AppLocalizations.of(context)!.enterapi,
            onTap: () async {
              String lastCode = await _getLastGPTCode();

              if (lastCode == "") {
                Future.delayed(Duration.zero, () {
                  _enterKey(context);
                });
              } else {
                Future.delayed(Duration.zero, () async {
                  FxModal.simple(context,
                      hasCustomWidget: true,
                      customWidget: confirmModalCustomWidget(lastCode));
                });
              }
            },
          ),
          const FxVSpacer(),
        ],
      ),
    );
  }

  Widget confirmModalCustomWidget(String code) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: (InitialDims.space25) * 4,
        maxHeight: (InitialDims.space25) * 4,
      ),
      child: Padding(
        padding: EdgeInsets.all((InitialDims.space5)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText(
                AppLocalizations.of(context)!.alreadyregistered,
                tag: Tag.h4,
                align: TextAlign.justify,
              ),
              const FxVSpacer(),
              FxText(
                AppLocalizations.of(context)!.areyousure,
                tag: Tag.h5,
                align: TextAlign.center,
              ),
              const FxVSpacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FxButton(
                    onTap: () {
                      Navigator.pop(context);
                      _enterKey(context);
                    },
                    text: AppLocalizations.of(context)!.yes,
                    fillColor: InitialStyle.successColorRegular,
                  ),
                  const FxHSpacer(),
                  FxButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: AppLocalizations.of(context)!.cancel,
                    fillColor: InitialStyle.dangerColorRegular,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveList(ChatModelList modelList) async {
    await Future.delayed(Duration.zero, () {
      String encodedList = json.encode(List.generate(
          modelList.list.length,
          (index) => {
                "_id": modelList.list[index].id,
                "message": modelList.list[index].message,
                "name": modelList.list[index].name,
                "type": modelList.list[index].type == MessageType.send
                    ? "send"
                    : "rec",
                "created_id": modelList.list[index].createdId,
                "created_at": modelList.list[index].createdAt,
                "updated_at": modelList.list[index].updatedAt,
              }));

      Save().setGptList(encodedList);
    });
  }

  Future<void> _saveIdList(List createdIdList) async {
    await Future.delayed(Duration.zero, () {
      String encodedList = json.encode(createdIdList);

      Save().setIdList(encodedList);
    });
  }

  void _deleteList() async {
    setState(() {
      _list.list.clear();
    });
    Save().setGptList("""[]""");
  }
}
