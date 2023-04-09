import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/', //first page to load
        routes: {
          //a map of routes for different screens
          '/': (context) => const loading(),
          '/home': (context) => const Home(),
          '/location': (context) => const chooseLocation(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
