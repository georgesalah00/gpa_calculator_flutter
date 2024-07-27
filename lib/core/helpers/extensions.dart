import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void pushReplacementNamed(BuildContext context, String routeName) =>
      Navigator.of(context).pushReplacementNamed(routeName);

  void pushNamed(BuildContext context, String routeName) =>
      Navigator.of(context).pushNamed(routeName);

      
}
