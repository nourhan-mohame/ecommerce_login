import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          width: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Log In',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xFF515C6F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF727C8E),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF727C8E)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  contentPadding: EdgeInsets.all(8.0),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFF727C8E),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF727C8E)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  contentPadding: EdgeInsets.all(8.0),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Implement your login logic here using the entered values
                  String username = usernameController.text;
                  String password = passwordController.text;

                  // Add your login logic here
                  // You can use the username and password variables
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF6969),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Don’t have an account? Swipe right to ',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF515C6F),
                  fontWeight:FontWeight.w200,
                ),
                textAlign: TextAlign.center,
              ),
              Text('create a new account.',
              style:TextStyle(
                fontSize:12,
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
}
