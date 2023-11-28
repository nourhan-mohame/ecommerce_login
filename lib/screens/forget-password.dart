import 'package:flutter/material.dart';


class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

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
                'Forget Password',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xFF515C6F),
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: emailController,
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
              ElevatedButton(
                onPressed: () {
                  // Implement your logic for sending the password reset email here
                  String email = emailController.text;

                  // For simplicity, assume the email is sent successfully
                  // You can add your logic for sending the email in real-world scenarios
                  // Here, we'll just print a message
                  print('Password reset email sent to $email');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF6969),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(
                  'Send Email',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
