import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clinic_app_frontend/views/fragment/pages/fc_chat_gpt.dart';
import 'package:clinic_app_frontend/views/fragment/pages/fc_dashboard.dart';
import 'package:clinic_app_frontend/views/fragment/pages/fc_lock_screen.dart';
import 'package:clinic_app_frontend/views/layout/full_screen_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import other pages
import '../views/fragment/pages/fc_empty_screen.dart';
import '../views/fragment/pages/fc_patients_page.dart';
import '../views/fragment/pages/fc_create_patient_page.dart';
import '../views/fragment/pages/fc_contact_patient_page.dart';
import '../views/fragment/pages/fc_doctors_page.dart';
import '../views/fragment/pages/fc_manage_doctor_page.dart';
import '../views/fragment/pages/fc_rooms_page.dart';
import '../views/fragment/pages/fc_manage_rooms_page.dart';
import '../views/fragment/pages/fc_documents_page.dart';
import '../views/fragment/pages/fc_manage_planning.dart';
import '../views/fragment/pages/fc_login.dart';
import '../views/layout/admin_panel_layout.dart';
import 'initial_page.dart';

class Routes {
  static bool isLocked = false;
  static final lockDuration = Duration(minutes: 1);

  static Future<void> saveLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }


  static void checkLogin(BuildContext context, String username, String password) {
    if (username == 'demo' && password == 'demo') {
      Navigator.of(context).pushReplacementNamed('/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect username or password')),
      );
    }
  }

  static void unlockScreen(BuildContext context) {
    isLocked = false;
    Navigator.of(context).pushReplacementNamed('/');
  }

  static void lockScreen(BuildContext context) {
    isLocked = true;
    Timer(lockDuration, () => unlockScreen(context));
  }

  static var rout = {
    '/lock': (context) => FcLockScreen(
        unlockScreen: () => unlockScreen(context)
    ),
    '/login': (context) => FullScreenLayout(
      child: FcLogin(
        onLogin: (username, password) => checkLogin(context, username, password),
      ),
    ),


    '/dashboard': (context) => AdminPanelLayout(child: FcDashboard()),

    '/patients': (context) => AdminPanelLayout(child: FcPatientsPage()),
    '/patients/add': (context) => AdminPanelLayout(child: FcCreatePatientPage()),
    '/patients/contact': (context) => AdminPanelLayout(child: ContactPatientPage()),

    '/doctors': (context) => AdminPanelLayout(child: FcDoctorsPage()),
    '/doctor/manage': (context) => AdminPanelLayout(child: FcManageDoctorPage()),

    '/rooms': (context) => AdminPanelLayout(child: FcRoomsPage()),
    '/rooms/manage': (context) => AdminPanelLayout(child: FcManageRoomsPage()),

    '/documents': (context) => AdminPanelLayout(child: FcDocumentsPage()),

    '/planning/manage': (context) => AdminPanelLayout(child: FcManagePlanning()),

    '/chatbot': (context) => AdminPanelLayout(child: FcChatGPT()),


    '/': (context) => AdminPanelLayout(child: FcEmptyScreen()),
  };
}
