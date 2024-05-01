import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;


import 'package:flutter_application_6/presentation/screens/show_movies_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    ),
  );
}
