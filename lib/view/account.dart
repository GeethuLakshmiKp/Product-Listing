import 'package:flutter/material.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Account',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )));
  }}
