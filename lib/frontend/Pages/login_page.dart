// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_function_literals_in_foreach_calls, avoid_print, must_be_immutable
import 'package:easytrade/frontend/Pages/slpash.dart';
import 'package:easytrade/frontend/repositories/repo_controller.dart';
import 'package:easytrade/frontend/sharedprofems/shared.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ischek = true;

  bool checker(String login, String pass) {
    memberlogin.forEach((element) {
      memberpass.forEach((elements) {
        if (element == login) {
          if (elements == pass) {
            ischek = true;
          } else {
            ischek = false;
          }
        } else {
          ischek = false;
        }
      });
    });
    return ischek;
  }

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 580),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'Hisob-Kitobni biz bilan osonlashtiring!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                    ),
                  ),
                ),
                InkWell(
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15, right: 10),
                    child: Text(
                      '+998 33 608 86 66',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 74, 141, 197),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () async {
                    final uri = Uri(
                      scheme: 'tel',
                      path: '33 608 86 66',
                    );
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      print('es');
                    }
                  },
                ),
                InkWell(
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Text(
                      '+998 90 608 86 66',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 74, 141, 197),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () async {
                    final uri = Uri(
                      scheme: 'tel',
                      path: '90 608 86 66',
                    );
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      print('es');
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 55),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Easy',
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                        Text(
                          'Trade',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Mobile',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  'assets/easytrade11.jpg',
                ),
              ),
              const Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Easy',
                      style: TextStyle(color: Colors.blue, fontSize: 30),
                    ),
                    Text(
                      'Trade',
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildUsername(),
              const SizedBox(height: 20),
              _buildPassword(),
              const SizedBox(height: 20),
              InkWell(
                child: Container(
                  height: 77,
                  width: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                ),
                onTap: () async {
                  if (checker(
                      _usernameController.text, _passwordController.text)) {
                    await UserSimplePreferences.setisLogin(true);
                    await UserSimplePreferences.setMarketName(
                        _usernameController.text);
                    print('sa');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplashScreen(
                            Marketname: _usernameController.text,
                          ),
                        ));
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUsername() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 10),
      child: TextFormField(
        controller: _usernameController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          labelText: 'Username',
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
      child: TextFormField(
        controller: _passwordController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          labelText: 'Password',
        ),
        obscureText: true,
      ),
    );
  }
}
