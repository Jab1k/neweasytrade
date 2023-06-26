// ignore_for_file: non_constant_identifier_names, await_only_futures, must_be_immutable, library_private_types_in_public_api, unnecessary_brace_in_string_interps, avoid_print, use_build_context_synchronously

import 'package:easytrade/frontend/Pages/homepage.dart';
import 'package:easytrade/frontend/Pages/login_page.dart';
import 'package:flutter/material.dart';

import '../repositories/repo_controller.dart';
import '../sharedprofems/shared.dart';

class SplashScreen extends StatefulWidget {
  String Marketname = '';

  SplashScreen({super.key, this.Marketname = ''});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool Islog = false;
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  Future<void> _navigateToMainScreen() async {
    widget.Marketname = await UserSimplePreferences.getMarketName() ?? '';
    Islog = await UserSimplePreferences.getislogin() ?? false;
    await getAlldata(widget.Marketname);
    print('${widget.Marketname} ${Islog}   aaa');
    await Future.delayed(const Duration(seconds: 3)).then((value) async {
      if (Islog) {
        await getAlldata(widget.Marketname);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                Market: widget.Marketname,
              ),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/easytrade.jpg',
          ),
          const Text(
            'Easy Trade Mobile',
            style: TextStyle(color: Colors.black, fontSize: 35),
          )
        ],
      )),
    );
  }
}
