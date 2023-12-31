import 'package:ecommerce_login/screens/home.dart';
import 'package:ecommerce_login/screens/sign-up.dart';
import 'package:ecommerce_login/task11/models/ads-ui.dart';
import 'package:ecommerce_login/task13/cart-screen.dart';
import 'package:ecommerce_login/task13/profile-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:false,
      home:  SignUpPage(),
    );
  }
}


