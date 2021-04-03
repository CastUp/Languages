import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


 Future<Locale> setLocal (String languageCode) async{

  SharedPreferences _prefernces = await SharedPreferences.getInstance();

  await _prefernces.setString("languages", languageCode);

  return _locale(languageCode);

}

 Locale _locale (String lang) {

   Locale _temp ;

   switch(lang){

     case 'en':
       _temp = Locale(lang, 'US');
       break;
     case 'ar':
       _temp = Locale(lang, 'SA');
       break ;
     default:
       _temp = Locale(lang, 'US');
       break ;
   }

   return _temp ;
 }

 Future<Locale> getLocal () async{

   SharedPreferences _prefernces = await SharedPreferences.getInstance();

   String langCode = _prefernces.getString("languages") ?? 'en';

   return _locale(langCode);
 }

Future<String> getLangCoge () async{

  SharedPreferences _prefernces = await SharedPreferences.getInstance();

  String langCode = _prefernces.getString("languages") ?? 'en';

  return langCode;
}

