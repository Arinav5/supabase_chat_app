import 'package:chat_app_supabase/constants.dart';
import 'package:chat_app_supabase/pages/chat_page.dart';
import 'package:chat_app_supabase/pages/register_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future <void> _redirect() async {
    // await for the widget to mount
    await Future.delayed(Duration.zero);

    final session = supabase.auth.currentSession; 
    if (session == null) {
      Navigator.of(context)
        .pushAndRemoveUntil(RegisterPage.route(), (route) => false);
    } else {
      Navigator.of(context)
        .pushAndRemoveUntil(ChatPage.route(), (route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: preloader);
  }
}