

import 'package:clinic_app_frontend/routes/initial_page.dart';
import 'package:clinic_app_frontend/views/fragment/pages/fc_chat_gpt.dart';
import 'package:clinic_app_frontend/views/fragment/pages/fc_dashboard.dart';
import 'package:clinic_app_frontend/views/fragment/pages/fc_lock_screen.dart';
import 'package:clinic_app_frontend/views/fragment/pages/fc_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fx_flutterap_components/ui/fx_drawer/fx_drawer.dart';

import '../../../views/fragment/pages/fc_empty_screen.dart';
import '../../../views/fragment/pages/fc_patients_page.dart';
import '../../../views/fragment/pages/fc_create_patient_page.dart';
import '../../../views/fragment/pages/fc_contact_patient_page.dart';
import '../../../views/fragment/pages/fc_doctors_page.dart';
import '../../../views/fragment/pages/fc_manage_doctor_page.dart';
import '../../../views/fragment/pages/fc_rooms_page.dart';
import '../../../views/fragment/pages/fc_manage_rooms_page.dart';
import '../../../views/fragment/pages/fc_dashboard.dart';



class DrawerConfig extends StatelessWidget {
  const DrawerConfig({Key? key}) : super(key: key);

  List menu(BuildContext context){
    return  [

    {
      'title': "Dashboard",
      'iconPath': "packages/fx_flutterap_components/assets/svgs/home.svg",
      'routeName': FcDashboard.routeName,
      'isReturnable': false,
      'submenu': [],
    },
    {
      'title': "Patients",
      'iconPath': "packages/fx_flutterap_components/assets/svgs/Database.svg",
      'routeName': FcPatientsPage.routeName,
      'isReturnable': false,
      'submenu': [
        {
          'title': "Create New Patient",
          'iconPath': "packages/fx_flutterap_components/assets/svgs/add.svg",
          'routeName': FcCreatePatientPage.routeName,
          'isReturnable': false,
          'submenu': [],
        },
        {
          'title': "View All Patients",
          'iconPath': "",
          'routeName': FcPatientsPage.routeName,
          'isReturnable': false,
          'submenu': [],
        },
        {
          'title': "Contact Patient",
          'iconPath': "",
          'routeName': ContactPatientPage.routeName,
          'isReturnable': false,
          'submenu': [],
        },
      ],
    },
    {
      'title': "Doctors",
      'iconPath': "packages/fx_flutterap_components/assets/svgs/profilecircle.svg",
      'routeName': FcDoctorsPage.routeName,
      'isReturnable': false,
      'submenu': [
        {
          'title': "View Doctors",
          'iconPath': "",
          'routeName': FcDoctorsPage.routeName,
          'isReturnable': false,
          'submenu': [],
        },
        {
          'title': "Manage Doctor",
          'iconPath': "",
          'routeName': FcManageDoctorPage.routeName,
          'isReturnable': false,
          'submenu': [],
        },
      ],
    },
    {
      'title': "Rooms",
      'iconPath': "packages/fx_flutterap_components/assets/svgs/setting2.svg",
      'routeName': FcRoomsPage.routeName,
      'isReturnable': false,
      'submenu': [
        {
          'title': "View Available Rooms",
          'iconPath': "",
          'routeName': FcRoomsPage.routeName,
          'isReturnable': false,
          'submenu': [],
        },
        {
          'title': "Manage Specific Room",
          'iconPath': "",
          'routeName': FcManageRoomsPage.routeName,
          'isReturnable': false,
          'submenu': [],
        },
      ],
    },
    {
      'title': "Documents",
      'iconPath': "packages/fx_flutterap_components/assets/svgs/star.svg",
      'routeName': FcEmptyScreen.routeName,
      'isReturnable': false,
      'submenu': [
        {
          'title': "Create New Document",
          'iconPath': "",
          'routeName': FcEmptyScreen.routeName,
          'isReturnable': false,
          'submenu': [],
        },
        {
          'title': "View All Documents",
          'iconPath': "",
          'routeName': FcEmptyScreen.routeName,
          'isReturnable': false,
          'submenu': [],
        },
      ],
    },
    {
      'title': "Planning",
      'iconPath': "packages/fx_flutterap_components/assets/svgs/notification.svg",
      'routeName': FcEmptyScreen.routeName,
      'isReturnable': false,
      'submenu': [],
    },
    {
      'title': "Chatbot",
      'iconPath': "packages/fx_flutterap_components/assets/svgs/chat.svg",
      'routeName': FcChatGPT.routeName,
      'isReturnable': false,
      'submenu': [],
    },

    ];

  }


  @override
  Widget build(BuildContext context) {

    return FxDrawer(menu(context));
  }



}



