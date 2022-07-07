import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kbc_quiz_app/screens/home.dart';
import 'package:kbc_quiz_app/screens/login.dart';
import 'package:kbc_quiz_app/screens/profile.dart';
import 'package:kbc_quiz_app/screens/winner.dart';
import 'package:kbc_quiz_app/screens/wrong_ans.dart';
import 'package:overlay_support/overlay_support.dart';
import 'services/localdb.dart';
import 'screens/quiz_que.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogIn = false;

  getLoggedInState() async {
    await LocalDB.getUserID().then((value) {
      setState(() {
        isLogIn = value.toString() != "null";
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getLoggedInState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Quiz Game',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: isLogIn ? const Home() : Login(),
      ),
    );
  }
}
