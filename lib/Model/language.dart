import 'package:flutter/material.dart';

class Language {
  final int id;

  final String name;

  final String flag;

  final String languageCode;

  Language({
    this.id,
    this.name,
    this.flag,
    this.languageCode,
  });

  static List<Language> languagelist(){

    return <Language>[
      Language(id: 2, name: "Arabic", flag: "πΈπ¦",languageCode: "ar"),
      Language(id: 1, name: "English", flag: "πΊπΈ",languageCode: "en"),
    ];
  }

}
