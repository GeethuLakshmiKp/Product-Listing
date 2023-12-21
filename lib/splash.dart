import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productlisting/api.dart';
import 'package:productlisting/homepage.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ApiConnection>(context,listen: false);
    Provider.of<ApiConnection>(context,listen: false);
    final api = Provider.of<ApiConnection>(context, listen: false);
    api.fetchProducts();
    Future.delayed(Duration(seconds: 2), () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Shopping Cart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
