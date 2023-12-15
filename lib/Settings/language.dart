import 'package:flutter/material.dart';
import 'package:creavers_project/Settings/languges.dart';
import 'package:creavers_project/model/language_model.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({
    required Key key,
  }) : super(key: key);

  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final labelChangeLanguage = Languages.of(context)?.labelChangeLanguage ?? '';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                labelChangeLanguage,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(
                width: 10,
              ),
              _createLanguageDropDown(),
            ],
          ),
        ),
      ),
    );
  }

  _createLanguageDropDown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DropdownButton<LanguageModel>(
          iconSize: 30,
          underline: const SizedBox(),
          hint: Text(Languages.of(context)?.labelSelectLanguage ?? ''),
          onChanged: (LanguageModel? language) {
            if (language != null) {
              // Assume changeLanguage is a function available in your code
              // changeLanguage(context, language.languageCode);
            }
          },
          items: LanguageModel.languageList()
              .map<DropdownMenuItem<LanguageModel>>(
                (e) => DropdownMenuItem<LanguageModel>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(e.name),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
