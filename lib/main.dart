import 'package:alert/config/app_colors.dart';
import 'package:alert/config/app_config.dart';
import 'package:alert/config/navigation_routes.dart';
import 'package:alert/screens/splash/splash_screen.dart';
import 'package:alert/services/local_db.dart';
import 'package:alert/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  setupLocator();
  var localDb = locator.get<LocalDb>();
  await localDb.initalize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pl', 'PL'),
      ],
      locale: const Locale('pl'),
      title: AppConfig.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.main),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: SplashScreen.route,
    );
  }
}
