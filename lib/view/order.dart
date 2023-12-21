import 'package:flutter/material.dart';

class order extends StatefulWidget {
  const order({super.key});

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Orders',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )),
    );
  }
}
