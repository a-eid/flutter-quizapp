import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class LanguageSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          Provider.of<LocalProvider>(context).value == Locale('ar', '')
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            Provider.of<LocalProvider>(context, listen: false).change(
              Locale('ar', ''),
            );
          },
          child: Text('Arabic'),
        ),
        SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {
            Provider.of<LocalProvider>(context, listen: false).change(
              Locale('en', ''),
            );
          },
          child: Text('English'),
        ),
        SizedBox(width: 12),
        Text(Provider.of<LocalProvider>(context).value.toString()),
      ],
    );
  }
}
