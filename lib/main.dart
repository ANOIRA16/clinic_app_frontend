import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'routes/arguments.dart';
import 'package:fx_flutterap_components/components/fx_bread_crumb/fx_app_navigator_observer.dart';
import 'package:fx_flutterap_kernel/structure/default_styles.dart';
import 'package:provider/provider.dart';
import 'routes/routes.dart';
import 'config/structure_change_provider.dart';
import 'config/supported_locales.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dart_vlc/dart_vlc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {



    return ChangeNotifierProvider<StructureChangeProvider>(
        create: (context) => StructureChangeProvider(),
        child: Builder(
            builder: (context) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primaryColor: DefaultStyles.primaryDarkColor,
                    primaryColorLight: DefaultStyles.primaryLightColor,
                    primaryColorDark: DefaultStyles.primaryDarkColor,
                  ),
                  navigatorObservers: [AppNavigatorObserver()],
                  locale: Provider.of<StructureChangeProvider>(context,
                          listen: true)
                      .currentLocale,
                  title: 'SYSMED',
                  localizationsDelegates: const [
                    SfGlobalLocalizations.delegate,
                    AppLocalizations.delegate, // Add this line
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  supportedLocales: SupportedLocales.list,
                  initialRoute: isLoggedIn ? '/' : '/login',
                  routes: Routes.rout,
                  onGenerateRoute: Arguments.arguments
                )));
  }
}