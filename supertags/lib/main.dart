import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:supertags/screens/dashboard.dart';
import 'package:supertags/screens/experience.dart';
import 'package:supertags/screens/splashscreen.dart';
import 'package:supertags/screens/wallet.dart';

var routes = <String, WidgetBuilder>{
  "/splash": (BuildContext context) => SplashScreen(),
  "/wallet": (BuildContext context) => SetupWalletScreen(),
  "/dashboard": (BuildContext context) => DashboardScreen(),
  "/experience": (BuildContext context) => ExperienceScreen(),
};

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(
      MaterialApp(theme: ThemeData(useMaterial3: true), home: SuperTagsApp()));
}

class SuperTagsApp extends StatefulWidget {
  @override
  _SuperTagsAppState createState() => _SuperTagsAppState();
}

class _SuperTagsAppState extends State<SuperTagsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        top: true,
        child: SplashScreen(),
      ),
      routes: routes,
    );
  }
}
