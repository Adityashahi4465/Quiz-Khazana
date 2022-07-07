import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kbc_quiz_app/screens/home.dart';
import 'package:kbc_quiz_app/services/auth.dart';
import 'package:kbc_quiz_app/services/internetCon.dart';
import 'package:overlay_support/overlay_support.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      // On app internet connection change checker
      final connected = status ==
          InternetConnectionStatus
              .connected; // Return true if internet connected else false
      showSimpleNotification(
          Text(connected ? 'CONNECTED TO INTERNET' : ' NO INTERNET CONNECTION'),
          background: Colors.greenAccent);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assests/img/kbc.jpeg"),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Welcome!\nTo KBC Quiz App',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            // TextField(
            //   onChanged: (value) {},
            //   decoration: InputDecoration(
            //     hintText: 'Enter Your Email',
            //     contentPadding:
            //         EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(32)),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
            //       borderRadius: BorderRadius.all(Radius.circular(32)),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 8.0,
            // ),
            // TextField(
            //   onChanged: (value) {},
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: 'Password',
            //     contentPadding:
            //         EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(32)),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
            //       borderRadius: BorderRadius.all(Radius.circular(32)),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 12,
            ),
            SignInButton(Buttons.GoogleDark, onPressed: () async {
              await signWithGoogle();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
            }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'By Continuing, You Are Agree With Our TnC ',
              style: TextStyle(color: Colors.white38),
            )
          ],
        ),
      ),
    );
  }
}
