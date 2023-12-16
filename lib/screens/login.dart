import 'package:ecommerce_login/firebase_auth/auth_services.dart';
import 'package:ecommerce_login/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final firebaseauthservices _auth =firebaseauthservices();

  @override
  void dispose() {

    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          width: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Log In',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xFF515C6F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Color(0xFF727C8E),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF727C8E)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  contentPadding: const EdgeInsets.all(8.0),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xFF727C8E),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF727C8E)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  contentPadding: const EdgeInsets.all(8.0),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                 signin();
                 Navigator.push(context,MaterialPageRoute(builder: (context) => const Home()),);

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xFFFF6969),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Don’t have an account? Swipe right to ',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF515C6F),
                  fontWeight:FontWeight.w200,
                ),
                textAlign: TextAlign.center,
              ),
              const Text('create a new account.',
              style:TextStyle(
                fontSize:13,
                color:Color(0xFFFF6969),
                fontWeight:FontWeight.w200,

              ),
                textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
  void signin() async{
    String username= usernameController.text;
    String email=usernameController.text;
    String password=passwordController.text;

    User? user =await _auth.signinemailandpassword(email, password);

    if(user!=null){
      print("User is succes login");
      Navigator.push(context,MaterialPageRoute(builder: (context) => const Home()),);


    }
    else{
      print("Some error happen! please try again");
    }

  }
}
