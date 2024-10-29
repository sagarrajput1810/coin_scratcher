import 'package:coin_scratcher/View/History.dart';
import 'package:coin_scratcher/View/Home.dart';
import 'package:coin_scratcher/View/Redemption.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/Home',
    debugShowCheckedModeBanner: false,
    routes: {
      '/Home': (context) => const Home(),
      '/redemption' : (context) => const Redemption(),
      '/history' : (context) => const History()
    },
  ));
}