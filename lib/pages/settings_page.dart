import 'package:flutter/material.dart';
import 'package:localization/main.dart';

import '../classes/language.dart';
import '../classes/language_constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).settings),
      ),
      body: Center(
          child: DropdownButton<Language>(
        iconSize: 30,
        hint: Text(translation(context).changeLanguage),
        onChanged: (Language? language) async{
                if (language != null) {
                  MyApp.setLocale(context, Locale(language.languageCode, ''));
                }

              },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      e.flag,
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(e.name)
                  ],
                ),
              ),
            )
            .toList(),
      )),
    );
  }
}
