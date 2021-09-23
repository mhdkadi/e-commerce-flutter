import 'package:flutter/material.dart';

AppBar appBar = AppBar(
  automaticallyImplyLeading: false,
  elevation: 0.0,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text('E-Commerce', style: TextStyle(color: Colors.black, fontSize: 20)),
      Text('Flutter', style: TextStyle(color: Colors.blue)),
    ],
  ),
);
