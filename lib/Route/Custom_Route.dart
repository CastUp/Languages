
import 'package:control_language/Pages/About_Page.dart';
import 'package:control_language/Pages/Home_Page.dart';
import 'package:control_language/Pages/NotFound_Page.dart';
import 'package:control_language/Pages/Settings_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Route_names.dart';

class CustomRoute{


  static Route<dynamic> allRoute(RouteSettings settings){


        switch(settings.name){

          case homeRoute :

            return MaterialPageRoute(builder: (_)=> HomePage());

          case aboutRoute :

            return MaterialPageRoute(builder: (_)=> AboutPage());

          case settingRoute :

            return MaterialPageRoute(builder: (_)=> SettingsPage());

        }

        return MaterialPageRoute(builder: (_)=> NotFoundPage());
  }
}