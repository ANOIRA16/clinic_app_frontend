// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_calendar/fx_event_calendar/fx_gerogorian_event_calender.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_image.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_avatar_widget.dart';
import 'package:fx_flutterap_components/components/fx_image/fx_svg_icon.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_h_spacer.dart';
import 'package:fx_flutterap_components/components/fx_spacer/fx_v_spacer.dart';
import 'package:fx_flutterap_components/components/fx_text/fx_text.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_chart/fx_bar_chart_sample3.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_chart/fx_bar_chart_sample4.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_chart/fx_circular_chart.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_chart/fx_linear_chart.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_comment_card.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_earning_reports.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_generated_leads_chart.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_income_card.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_most_sales_card.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_new_messages.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_new_users.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_profit_card.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_recent_comments.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_social_network_visits.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_statistic_card_1.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_statistic_card_2.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_task_list.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_tickets_card.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_todo_list.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_user_progress_bar.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_dashboard_card/fx_weather_card.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_profile/fx_progress_list_card.dart';
import 'package:fx_flutterap_editable_components/editable_components/fx_timeline/showcase/fx_custom_timeline.dart';
import 'package:fx_flutterap_kernel/structure/responsive_layout.dart';
import 'package:fx_flutterap_template/default_template/components/fx_card_decoration.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_page_header.dart';
import 'package:fx_flutterap_template/default_template/components/fx_page_title_container.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import '../components/page_widgets/fc_dashboard/fx_chat_screen.dart';

class FcDashboard extends StatelessWidget {
  static const routeName = '/dashboard';

  const FcDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double factor = (ResponsiveLayot.isPhone(context)) ? 0.7 : 1;
    List<String> countryList = [
      AppLocalizations.of(context)!.australia,
      AppLocalizations.of(context)!.canada,
      AppLocalizations.of(context)!.india,
      AppLocalizations.of(context)!.us,
      AppLocalizations.of(context)!.japan,
      AppLocalizations.of(context)!.brazil,
    ];
    List<String> amountList = ["18,879", "10,357", "4,860", "899", "43", "18"];
    List<String> rateList = ["15%", "11%", "9%", "20%", "31%", "8%"];
    List<bool> isIncreasedList = [true, true, false, true, false, true];

    List<String> descriptionList = List.generate(
      4,
          (index) => AppLocalizations.of(context)!.lorem,
    );
    List<String> messageList = List.generate(
      4,
          (index) => AppLocalizations.of(context)!.lorem,
    );
    List<String> messageList2 = List.generate(
      2,
          (index) => AppLocalizations.of(context)!.lorem,
    );
    List<String> messageList3 = List.generate(
      5,
          (index) => AppLocalizations.of(context)!.lorem,
    );
    List<bool> valueList = List.generate(4, (index) {
      if (index == 2) return true;
      if (index == 4) return true;
      return false;
    });

    List<Widget> indicatorList = [
      FxAvatarImage(
        path: "packages/fx_flutterap_components/assets/images/avatar1.png",
        borderRadius: InitialDims.space5,
      ),
      FxAvatarWidget(
          backGroundColor: InitialStyle.specificColor,
          widget: FxText(
            "L",
            tag: Tag.h3,
            color: InitialStyle.primaryLightColor,
          )),
      FxAvatarWidget(
          backGroundColor: InitialStyle.primaryLightColor,
          widget: FxSvgIcon(
            "packages/fx_flutterap_components/assets/svgs/gallery.svg",
            size: InitialDims.icon3,
            color: InitialStyle.primaryDarkColor,
          )),
      FxAvatarImage(
        path: "packages/fx_flutterap_components/assets/images/avatar4.png",
        borderRadius: InitialDims.space5,
      ),
    ];

    Widget content1() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: InitialDims.space1,
          horizontal: InitialDims.space1,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText(
                AppLocalizations.of(context)!.loremshort,
                tag: Tag.h3,
                size: InitialDims.normalFontSize,
                color: InitialStyle.titleTextColor,
                align: TextAlign.start,
              ),
              const FxVSpacer(
                factor: 0.5,
              ),
              FxText(
                AppLocalizations.of(context)!.lorem,
                align: TextAlign.justify,
                color: InitialStyle.textColor,
                size: InitialDims.subtitleFontSize,
                overFlowTag: true,
                maxLine: 1,
              ),
              const FxVSpacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time,
                    size: InitialDims.icon2,
                    color: InitialStyle.secondaryTextColor,
                  ),
                  const FxHSpacer(),
                  FxText(
                    "9:40 ${AppLocalizations.of(context)!.am}",
                    tag: Tag.h5,
                    color: InitialStyle.secondaryTextColor,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget content2() {
      double imageSize = (InitialDims.space13 * factor);
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: InitialDims.space1,
          horizontal: InitialDims.space1,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: InitialDims.space1,
                runSpacing: InitialDims.space1,
                children: [
                  Image.asset(
                    "packages/fx_flutterap_components/assets/images/img1.png",
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                  const FxHSpacer(),
                  Image.asset(
                    "packages/fx_flutterap_components/assets/images/img2.png",
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                  const FxHSpacer(),
                  Image.asset(
                    "packages/fx_flutterap_components/assets/images/img3.png",
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const FxVSpacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.access_time,
                    size: InitialDims.icon2,
                    color: InitialStyle.secondaryTextColor,
                  ),
                  const FxHSpacer(),
                  FxText(
                    "20.10.2018",
                    tag: Tag.h5,
                    color: InitialStyle.secondaryTextColor,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    List<Widget> contentList = [
      content1(),
      content1(),
      content2(),
      content1(),
    ];

    List<String> titleList = [
      AppLocalizations.of(context)!.software,
      AppLocalizations.of(context)!.design,
      AppLocalizations.of(context)!.seo,
    ];

    List<double> percentList = [71, 50, 24];

    List<Color> colorList = [
      InitialStyle.primaryColor,
      InitialStyle.specificColor,
      InitialStyle.primaryDarkColor,
    ];

    Widget dashboardContainerItems({
      required String title,
      required Widget child,
      EdgeInsetsGeometry? widgetPadding,
    }) {
      return FxContainerItems(
        title: title,
        margin: EdgeInsets.all(InitialDims.space0),
        widgetPadding: widgetPadding,
        child: child,
      );
    }

    BootstrapCol cardShow1(Widget widget) {
      return BootstrapCol(
          sizes: 'col-sm-12 col-ml-12 col-lg-12 col-xl-12',
          child: Container(
              margin: FxCardDecoration().cardShowMargin, child: widget));
    }

    BootstrapCol cardShow2(Widget widget) {
      return BootstrapCol(
          sizes: 'col-sm-12 col-ml-6 col-lg-6 col-xl-3',
          child: Container(
              margin: FxCardDecoration().cardShowMargin, child: widget));
    }

    BootstrapCol cardShow3(Widget widget) {
      return BootstrapCol(
          sizes: 'col-sm-6 col-ml-3 col-lg-3 col-xl-2',
          child: Container(
              margin: FxCardDecoration().cardShowMargin, child: widget));
    }

    BootstrapCol cardShow4(Widget widget) {
      return BootstrapCol(
          sizes: 'col-sm-12 col-ml-12 col-lg-4 col-xl-4',
          child: Container(
              margin: FxCardDecoration().cardShowMargin, child: widget));
    }

    BootstrapCol cardShow5(Widget widget) {
      return BootstrapCol(
          sizes: 'col-sm-12 col-ml-12 col-lg-6 col-xl-6',
          child: Container(
              margin: FxCardDecoration().cardShowMargin, child: widget));
    }

    BootstrapCol cardShow6(Widget widget) {
      return BootstrapCol(
          sizes: 'col-sm-12 col-ml-12 col-lg-8 col-xl-8',
          child: Container(
              margin: FxCardDecoration().cardShowMargin, child: widget));
    }

    BootstrapCol cardShow7(Widget widget) {
      return BootstrapCol(
          sizes: 'col-sm-12 col-ml-12 col-lg-4 col-xl-4',
          child: Container(
              margin: FxCardDecoration().cardShowMargin, child: widget));
    }

    BootstrapCol cardShow8(Widget widget) {
      return BootstrapCol(
          sizes: 'col-sm-12 col-ml-6 col-lg-4 col-xl-6',
          child: Container(
              margin: FxCardDecoration().cardShowMargin, child: widget));
    }

    BootstrapCol cardShow9(Widget widget) {
      return BootstrapCol(
          sizes: 'col-sm-12 col-ml-12 col-lg-8 col-xl-8',
          child: Container(
              margin: FxCardDecoration().cardShowMargin, child: widget));
    }

    List list = [
      BootstrapContainer(
        fluid: true,
        children: [
          BootstrapRow(
            children: [
              cardShow3(FxStatisticCard2(
                imagePath:
                "packages/fx_flutterap_components/assets/svgs/profilecircle.svg",
                number: "8",
                description: AppLocalizations.of(context)!.followers,
                hasGrown: false,
              )),
              cardShow3(FxStatisticCard2(
                imagePath:
                "packages/fx_flutterap_components/assets/svgs/profilecircle.svg",
                number: "6",
                description: AppLocalizations.of(context)!.participation,
              )),
              cardShow3(FxStatisticCard2(
                imagePath:
                "packages/fx_flutterap_components/assets/svgs/list.svg",
                number: "30",
                description: AppLocalizations.of(context)!.participations,
              )),


            ],
          ),

          BootstrapRow(
            children: [

              cardShow9(
                dashboardContainerItems(
                  title: AppLocalizations.of(context)!.taskslist,
                  child: FxTasksList(
                  ),
                ),
              ),
            ],
          ),

          BootstrapRow(
            children: [
              cardShow5(
                dashboardContainerItems(
                  title: AppLocalizations.of(context)!.recentcomments,
                  child: FxRecentComments(
                    messageList: messageList2,
                  ),
                ),
              ),
              cardShow5(
                dashboardContainerItems(
                  title: AppLocalizations.of(context)!.newusers,
                  child: FxNewUsers(
                    descriptionList: messageList,
                  ),
                ),
              ),
            ],
          ),




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
                        title: AppLocalizations.of(context)!.dashboard,
                      ),
                    ],
                  ),
                  BootstrapContainer(
                      fluid: true,
                      padding: EdgeInsets.all(InitialDims.space3),
                      decoration: BoxDecoration(
                        color: InitialStyle.background,
                      ),
                      children: List.generate(
                          list.length, (index) => _boxShow(list[index])))
                ],
              ),
            ),
          ),
        ));
  }

  Widget _boxShow(Widget widget) {
    return BootstrapCol(
        sizes: 'col-sm-12 col-ml-12 col-lg-12 col-xl-16', child: widget);
  }
}