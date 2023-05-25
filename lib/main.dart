import 'package:design_app/views/auth/signin_acc_screen.dart';
import 'package:design_app/views/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: getInitFirebase,
    );
  }
}

get getInitFirebase {
  return FutureBuilder(
    future: Firebase.initializeApp(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Scaffold(
          body: Center(
            child: Icon(
              Icons.info,
              size: 35,
              color: Colors.red,
            ),
          ),
        );
      }
      if (snapshot.connectionState == ConnectionState.done) {
        return const SignInScreen();
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
