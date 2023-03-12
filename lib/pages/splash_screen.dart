import 'package:flutter/material.dart';
import './main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.attach_money,
              size: 200.0,
              color: Colors.amber,
            ),
            Text(
              "Money Managment",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 50.0,
                shadows: <Shadow>[
                  Shadow(
                    color: Colors.amber,
                    blurRadius: 20.0,
                    offset: Offset(10.0, 10.0),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
