import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import '';

class Internet {
  bool connected = false;

  checkInternetCon() async {
    connected = await InternetConnectionChecker()
        .hasConnection; // IF INTERNET CONNECTED IT WILL RETURN TRUE ELSE FALSEA
    final msg = connected ? "CONNECTED TO INTERNET" : "NO INTERNET CONNECTION";
    showSimpleNotification(Text('$msg')); // Showing SnackBar
  }
}
