import 'package:agenda_pokemon/presentation/ui/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((_) => Navigator.of(context)
        .pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
          elevation: 20,
          child: Image.asset(
            'resources/images/pokeball.png',
            height: 300,
            width: 300,
          ),
        ),
      ),
    );
  }
}
