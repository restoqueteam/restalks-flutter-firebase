import 'package:flutter/material.dart';
import 'package:restalksflutterfirebase/view/ExemploFirebase.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExemploFirebase(title: 'Demo Restalks'),
    );
  }
}
