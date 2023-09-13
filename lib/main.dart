import 'package:flutter/material.dart';
import 'package:ifda/screens/signin.dart';
import 'package:ifda/widgets/reusablewidgets.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}
class SplashScreen extends StatelessWidget {
  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a 3-second delay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          // Check if the future has completed
          if (snapshot.connectionState == ConnectionState.done) {
            // Navigate to the main screen
            return SignInScreen();
          } else {
            // Show a loading indicator (e.g., your app logo)
            return Center(
              child: Image.asset(imageName)
            );
          }
        },
      ),
    );
  }
}

