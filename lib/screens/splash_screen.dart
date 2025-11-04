import 'package:flutter/material.dart';
import 'package:weather_app/screens/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF642FF1),
        child: Container(
          padding: EdgeInsets.fromLTRB(35, 150, 35, 0),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset("lib/images/App'sIcon.png"),
                ),
                Text(
                  "Weather",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                Text(
                  "Your quick weather report",

                  style: TextStyle(
                    color: const Color.fromARGB(255, 155, 153, 153),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(  
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 244, 243, 243),
                  ),
                  child: Text("get started"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
