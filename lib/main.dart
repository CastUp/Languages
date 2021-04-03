import 'dart:io';

import 'package:control_language/Localization/Set_Localization.dart';
import 'package:control_language/Model/shardprefernces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Route/Custom_Route.dart';
import 'Route/Route_names.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static void setLocale (BuildContext context , Locale locale ){

    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();

    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale _locale ;
  void setLocale(Locale locale){

    setState(() {
      _locale = locale ;
    });
  } //وذلك عند تغير و البرنامج شغال

  @override
  void initState() {
    getLocal().then((locale) => setState(()=> _locale = locale));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: CustomRoute.allRoute,
      initialRoute: homeRoute,
      locale: _locale,
      supportedLocales: [
        Locale("ar","SA"),
        Locale("en","US"),
      ],
      localizationsDelegates: [
        SetLocalization.localizationsDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (devicelocal , supportlocal){
        for(var local in supportlocal){
          if (local.languageCode == devicelocal.languageCode && local.countryCode == devicelocal.countryCode) {

            return devicelocal;
          }
          return supportlocal.last ;
        }
      },
    );
  }
}


