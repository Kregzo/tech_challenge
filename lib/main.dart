import 'package:calc_challenge/appState/calculator_view_modal.dart';
import 'package:calc_challenge/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Calc());
}

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A simple calculator app',
      // routes: <Create router here>,
      home: ChangeNotifierProvider(
        create: (_) => CalViewModal(),
        child: Home(),
      ),
    );
  }
}
