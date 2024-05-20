import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maxmovement/maxmovement/home_page.dart';
import 'package:maxmovement/maxmovement/login_page.dart';

class MMSplashScreen extends StatefulWidget {
  const MMSplashScreen({Key? key}) : super(key: key);

  @override
  State<MMSplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MMSplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => LoginPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset('assets/maxmovement_logo.png'),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0, -80),
                child: Text(
                  'MaxMovement',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}