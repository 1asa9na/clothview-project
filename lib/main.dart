// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:ui';
import 'step_one.dart';

void main() => runApp(
      MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: MainPage(),
        ),
      ),
    );
