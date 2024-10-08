import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar_admin_panel/app.dart';
import 'package:traktor_family_gastro_bar_admin_panel/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(const App());
}