import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar_admin_panel/app_screen.dart';
import 'package:traktor_family_gastro_bar_admin_panel/core/ui/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Traktor Admin",
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const AppScreen(),
    );
  }
}
