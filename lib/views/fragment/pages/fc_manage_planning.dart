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
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';

class FcManagePlanning extends StatelessWidget {
  static const routeName = '/planning/manage';

  const FcManagePlanning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FxContainerItems> list = [

      // New FxContainerItems for the calendar
      FxContainerItems(
        title: AppLocalizations.of(context)!.eventcalender,
        information: "Calendar for managing events and planning",
        child: FxGeogorianEventCalendar(
          onViewChanged: (details) {},
          onEditEvent: (details) {},
        ),
      ),
    ];

    return FxMainBootstrapContainer(
      title: AppLocalizations.of(context)!.emptyscreen,
      list: list,
      bootstrapSizes: 'col-sm-12 col-ml-12 col-lg-12 col-xl-12',
      description: AppLocalizations.of(context)!.emptyscreentitle,
    );
  }
}
