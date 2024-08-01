import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void pushReplacementNamed(BuildContext context, String routeName, [Object? argument]) =>
      Navigator.of(context).pushReplacementNamed(routeName, arguments: argument);

  void pushNamed(BuildContext context, String routeName) =>
      Navigator.of(context).pushNamed(routeName);

      void pop(BuildContext context){
        Navigator.of(context).pop();
      }

      
}

extension ThemeModing on BuildContext{
  Brightness themeMode(BuildContext context) => MediaQuery.of(context).platformBrightness;
}