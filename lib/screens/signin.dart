

import 'package:flutter/material.dart';
import 'package:ifda/screens/homescreen.dart';
import 'package:ifda/screens/signup.dart';
import 'package:ifda/widgets/reusablewidgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
      // Background Image
      Positioned.fill(
      child: Image.asset(
        'assets/images/logo1.jpg',
        fit: BoxFit.cover,  // Adjust this as needed
      ),
    ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
               height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  // logoWidget("assets/images/logo1.jpg"),
                  const SizedBox(
                    height: 100,
                  ),
                  const Center(child: Text('IFDA',
                    style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                      color: Colors.blue,
                  ),)),
                  const SizedBox(
                    height: 150,
                  ),
                  reusableTextField("Enter Email or phone number", Icons.person_outline, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ), signInSignUpButton(
                      context, false, () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  }),
                  SizedBox(
                    height: 25,
                  ),
                  signUpOption()
                ],
              ),
            ),
      ),
    ]
    )
        );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
