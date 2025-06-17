import 'dart:io';

import 'package:chat_app_supabase/constants.dart';
import 'package:chat_app_supabase/pages/chat_page.dart';
import 'package:chat_app_supabase/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:chat_app_supabase/pages/splash_page.dart';

Future <void> main() async {
  print('Current working directory: ${Directory.current.path}');
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}